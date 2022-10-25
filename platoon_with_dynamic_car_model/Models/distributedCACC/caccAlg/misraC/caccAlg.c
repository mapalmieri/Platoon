#include "DomenicoV_caccAlg.h"
#include <math.h>
/**
 * init function
 */
void init(State* st) { 
    st->previous_mode = X1;
    st->mode = X1;
    st->acc_leader = 0.0f;
    st->acc_prec = 0.0f;
    st->accdes = 0.0f;
    st->C1_weight = 0.5f;
    st->controllerBandwidth = 0.2f;
    st->dampingRatio = 1.0f;
    st->in_x = 0.0f;
    st->in_x_leader = 0.0f;
    st->in_x_prec = 0.0f;
    st->precVehicleLenght = 4.0f;
    st->speed_leader = 0.0f;
    st->speed_me = 0.0f;
    st->speed_prec = 0.0f;
    st->targetDistance = 15.0f;
}

/**
 * leave/enter functions
 */
void enter(Mode m, State* st) { 
    st->mode = m;
}
void leave(Mode m, State* st) { 
    st->previous_mode = m;
}


/*	C1=weighting factor between the accelerations of the leader and the preceding vehicle
//	x_i / x_prec / x_0 = position of the i-th / preceding / leader vehicle
//	der1_x_i / der1_x_prec / der1_x_0 = speed of the i-th / preceding / leader vehicle
//	der2_x_prec / der2_x_0 = acceleration of the preceding / leader vehicle
//	l_prec = preceding vehicle length
//	targetDistance = desired spacing between the i-th vehicle and the preceding one
*/
double cacc(double C1, double dampingRatio, double controllerBandwidth, double l_prec, double targetDistance,  //parametri
			double x_i, double x_prec, double x_0, double der1_x_i, double der1_x_prec, double der1_x_0, double der2_x_prec, double der2_x_0 )
{
	double desiredAcceleration=0;
	double alfa1=0 , alfa2=0, alfa3=0, alfa4=0, alfa5=0, calcOptimization3=0;
	double epsilon_i = 0, der1_epsilon_i = 0;
	
	alfa1 = 1 - C1;
	alfa2 = C1;
	
	calcOptimization3 = C1* ( dampingRatio+ sqrt( dampingRatio*dampingRatio - 1 ));
	alfa3 = - ( 2*dampingRatio - calcOptimization3 ) * controllerBandwidth;
	alfa4 = - (calcOptimization3 * controllerBandwidth);
	alfa5 = - (controllerBandwidth*controllerBandwidth);
	
	epsilon_i = x_i - x_prec + l_prec + targetDistance;
	der1_epsilon_i = der1_x_i - der1_x_prec;
	desiredAcceleration = (alfa1 * der2_x_prec) + (alfa2 * der2_x_0) + (alfa3 * der1_epsilon_i) + (alfa4 * (der1_x_i - der1_x_0)) + (alfa5 * epsilon_i);
 //   printf("\nCACC: A1: %f - A2: %f - A3: %f - A4: %f - A5: %f", alfa1,alfa2,alfa3,alfa4,alfa5);
 //   printf("\nCACC: SLead: %f - SMe: %f - SPrec: %f", der1_x_0, der1_x_i, der1_x_prec);
	return desiredAcceleration;
}


/**
 * triggers
 */
bool per_tick(State* st) {
    return (st->mode == X1 && ( TRUE ));
}
State* tick(State* st) {
    // assert( per_tick(st) );
    if (st->mode == X1 && ( TRUE )) {
        #ifdef DBG
        _dbg_print_condition("st->mode == X1 && ( TRUE )");
        #endif
        leave(X1, st);
        
        /*
	    printf("\n\nInizio");
        printf("\nC1: %f\nTarget distance: %f\nSpeedMe: %f", st->C1_weight, st->targetDistance, st->speed_me);
        printf("\nSme: %f - Sprec: %f - SLead: %f", st->speed_me, st->speed_prec, st->speed_leader);
        */
        st->accdes = cacc(st->C1_weight, st->dampingRatio, 
            st->controllerBandwidth, st->precVehicleLenght, st->targetDistance, 
            st->in_x, st->in_x_prec, st->in_x_leader, 
            st->speed_me, st->speed_prec, st->speed_leader, 
            st->acc_prec, st->acc_leader);
            
        //printf("\nFine. DesAcc: %f\n", st->accdes);
        enter(X1, st);
    }
    #ifdef DBG
    _dbg_print_state(st);
    #endif
    return st;
}





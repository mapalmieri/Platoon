/*! \file skeleton.c 
 * In this file there are the implementations
 * of the fuctions declared in fmu.h
 * along with the data needed.
 */
#include "fmu.h"
#include "misraC/DomenicoV_caccAlg.h"


State st; /*!< structure containing the state of the model */
int first = 0; /* variable for execution of setup option during first step only */


 /**
       * function for the initialization of the model.
       * It calls the init function of the model and
       * 	sets the output
       * @param location is the directory where the fmu has been unzipped. Might be used in future version
       * 
       */


void initialize(const char* location) {
    init(&st);
    fmiBuffer.realBuffer[3] = st.accdes;
    
    
}

/**
 * function that performs a step of the simulation model.
 * At first the inputs of the are updated with the values fom the master algorithm
 * Then the tick function is called
 * Finally the outputs of the model are forwarded to the master algorithm 
 * @param action is the action to perform. Might be used in future version
 */
void doStep(const char* action) { 
    
    

        st.C1_weight = fmiBuffer.realBuffer[4] ;
        st.controllerBandwidth = fmiBuffer.realBuffer[5] ;
        st.dampingRatio = fmiBuffer.realBuffer[6] ;
        st.precVehicleLenght = fmiBuffer.realBuffer[10] ;
        st.targetDistance = fmiBuffer.realBuffer[14] ;
        
      

	
    st.acc_leader = fmiBuffer.realBuffer[1];
    st.acc_prec = fmiBuffer.realBuffer[2];
    st.in_x = fmiBuffer.realBuffer[7];
    st.in_x_leader = fmiBuffer.realBuffer[8];
    st.in_x_prec = fmiBuffer.realBuffer[9];
    st.speed_leader = fmiBuffer.realBuffer[11];
    st.speed_me = fmiBuffer.realBuffer[12];
    st.speed_prec = fmiBuffer.realBuffer[13];
	
    tick(&st);
    
    
    fmiBuffer.realBuffer[3] = st.accdes;
    /*
    fmiBuffer.realBuffer[4] = st.C1_weight;
    fmiBuffer.realBuffer[5] = st.controllerBandwidth;
    fmiBuffer.realBuffer[6] = st.dampingRatio;
    fmiBuffer.realBuffer[10] = st.precVehicleLenght;
    fmiBuffer.realBuffer[14] = st.targetDistance;*/
}

void terminate(){ }



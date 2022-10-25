#ifndef _misraC_DomenicoV_caccAlg_
#define _misraC_DomenicoV_caccAlg_

#include <assert.h>
#include <stdio.h>
#include "misraC_basic_types.h"
/**
 * operating modes
 */
typedef enum { X1 } Mode;

/**
 * state attributes
 */
typedef struct { 
    Mode mode;
    Mode previous_mode;
    float32_t acc_leader; //-- real
    float32_t acc_prec; //-- real
    float32_t accdes; //-- real
    float32_t C1_weight; //-- real
    float32_t controllerBandwidth; //-- real
    float32_t dampingRatio; //-- real
    float32_t in_x; //-- real
    float32_t in_x_leader; //-- real
    float32_t in_x_prec; //-- real
    float32_t precVehicleLenght; //-- real
    float32_t speed_leader; //-- real
    float32_t speed_me; //-- real
    float32_t speed_prec; //-- real
    float32_t targetDistance; //-- real
} State;

/**
 * init function
 */
void init(State* st);

/**
 * triggers
 */
bool per_tick(State* st);
State* tick(State* st);


/**
 * leave/enter functions
 */
void enter(Mode m, State* st);
void leave(Mode m, State* st);

#endif

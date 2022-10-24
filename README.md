# Vehicles platoon
This project provides a simple and ready-to-use example of terrestrial vehicles platoon.
## Requirements
 1. Linux-like OS (currently tested on Ubuntu 16 and Ubuntu 20)
 2. INTO-CPS Application, downloadable [here](https://into-cps-association.github.io/download/)
## Scenario
![plot](Platoon.jpg)
In the pre-built project we have the "standard platooning" multi-model with 3 following cars and a leading car.
The plant of every car has been modeled in OpenModelica (models can be found in the "Models" folder) while the control algorithm is the Cooperative Adaptive Cruise Control (CACC), which establishes a fixed distance between the cars and guarantees "string stability" i.e. perturbations at the head of the platoon smoothly propagates to the tail.



## DSE
In the "userMetricScripts" folder there are 2 scripts that can be used to evaluate different objective functions for the DSE analysis:
1. Accident.py takes as input two subsequent cars and returns 1 if the 2 cars crash into each other 0 otherwise
2. Distance.py takes as input two subsequent cars and return the distance averaged throughout the simulation

These scripts have been used for the evaluation of the platoon behaviour varying the parameters of the leading car to see how they affect the stability of the platoon and if they produce a crash.
![plot](StandardDSE.png)

## Instructions for co-simulation

  1. Launch the INTO-CPS application and open the `platoon` project

 2. If not already done, download the coe from the download manager of the INTO-CPS application (this is a one time only operation)

 3. Expand any Multi-Model (+ button) and open the `co-sim` scenario

 4. Launch the COE and then start the simulation

# Contacts

For futher information contact Maurizio Palmieri at maurizio.palmieri@ing.unipi.it


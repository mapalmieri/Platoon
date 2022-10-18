# Attack analysis on vehicles platoon
This project provides a simple and ready-to-use example of terrestrial vehicles platoon.
## Standard Scenario
![plot](Platoon.jpg)
In the pre-built project we have the "standard platooning" multi-model with 3 following cars and a leading car.
The plant of every car has been modeled in OpenModelica (models can be found in the "Models" folder) while the control algorithm is the Cooperative Adaptive Cruise Control (CACC), which establishes a fixed distance between the cars and guarantees "string stability" i.e. perturbations at the head of the platoon smoothly propagates to the tail.

## Attacked scenarios
![plot](PlatoonAttacked.jpg)
In the prebuilt project there are also 3 possible scenarios
# Requirements
 1. Linux-like OS (currently tested on Ubuntu 16 and Ubuntu 20)
 4. INTO-CPS Application, downloadable [here](https://into-cps-association.github.io/download/)
 
# Instructions for co-simulation

 
 1. Launch the INTO-CPS application and open the `INTO-CPS_linear_displacement_project` project

 2. If not already done, download the coe from the download manager of the INTO-CPS application (this is a one time only operation)

 3. Expand any Multi-Model (+ button) and open the `co-sim` scenario

 4. Launch the COE and then start the simulation

# Contacts

For futher information contact Maurizio Palmieri at maurizio.palmieri@ing.unipi.it


# ADCS---Bang-Bang-RCS-Thrusters

A simulation of spacecraft attitude control using 12 RCS thrusters placed on the vertices of a cuboid-shaped 
spacecraft. 

## Discrete Element Implementation: Switches and Schmitt Triggers

Before attitude control can be performed using bang-bang control, the discrete elements must be implemented in 
Simulink and their behavior confirmed using graphical methods (phase portraits).

To do this, a 1DOF "spacecraft" is considered, where only rotation about a single axis is considered, and the 
discrete elements use the full-state feedback (where the state is the displacement angle and body rate) to
apply control. The elements implemented in Simulink are shown below:

### Switch

<img src="/figures/switch_slx.png">


### Schmitt


<img src="/figures/schmitt_slx.png">


## Switch Results

The outputs in the phase space of the switch look like the following, using an initial state of [1.5 rad, 0 rad/s]':

<img src="/figures/switch_phase_portrait.png" style="height:50%">


<img src="/figures/switch_dth_t.png" style="height:50%">


<img src="/figures/switch_th_t.png" style="height:50%">

## Schmitt Trigger Results

The outputs in the phase space of the switch look like the following, using an initial state of [1.5 rad, 0 rad/s]':

<img src="/figures/schmitt_phase_portrait.png" style="height:50%">


<img src="/figures/schmitt_dth_t.png" style="height:50%">


<img src="/figures/schmitt_th_t.png" style="height:50%">

In th above, it can be seen that the Schmitt Trigger exhibits the expected behavior, reaching its convergence limit at the boundary box near equilibrium. Likewise, the switch exhibits the expected behavior of converging towards equilibrium, and if the simulation were run longer it would asymptotically approach equililbrium.

## Spacecraft Attitude Control Simulation

The spacecraft attitude control simulation is implemented using quaternion-based full-state feedback (FSFB), with the complex parts of the quaternion making and the absolute angular velocity comprising the state: [q1, q2, q3, w1, w2, w3]'. The simulink diagram for this simulation is as follows:

<img src="/figures/acs_slx.png">

As seen above, the combination of which RCS thrusters to use is written as a linear allocation problem which is solved by using the MATLAB linprog() function in-the-loop.

The simulation results are as following, demonstrating successful control using bang-bang actuated RCS thrusters:

### Angular Velocity
<img src="/figures/acs_w.png">

### Body-to-ECI Quaternion
<img src="/figures/acs_quat.png">

### Torque Comparison
<img src="/figures/acs_final.png">
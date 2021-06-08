# Digital System: Design a system for specific operation

### Objective: dsigned a system which perform the arithmetic: F = (x*y)/4 + 1.

 -  The unit will receive the operands A, and B 8-bit unsigned numbers.
 -  A 1 to 0 transition at the LOAD pin will latch the operands into internal register RA and RB. 
 -  The unit outputs the results in 16-bit register RZ output port. 
 -  Each calculation starts with a LOAD signal and ends with an END_FLAG signal.

![image](https://user-images.githubusercontent.com/60360984/121117708-94ee9000-c7e6-11eb-9d0a-ec7cdd3e3aab.png)

### Design:

 - The 8x8 Multiplication box is implemented based on the Vedic algorithm, which accelerate the computation performance and lower power consumption

![image](https://user-images.githubusercontent.com/60360984/121117861-daab5880-c7e6-11eb-99ab-277926b740ea.png)

### Simulation and Timing

![image](https://user-images.githubusercontent.com/60360984/121117911-ee56bf00-c7e6-11eb-90e7-05005f1d2a79.png)

### RTL Schematic

![image](https://user-images.githubusercontent.com/60360984/121117969-04fd1600-c7e7-11eb-8ca8-b821d8a68f9c.png)

### Tech Schematic

![image](https://user-images.githubusercontent.com/60360984/121117989-12b29b80-c7e7-11eb-8df9-f82f69733c25.png)

### Area report

![image](https://user-images.githubusercontent.com/60360984/121118041-23fba800-c7e7-11eb-82c8-9ba8bef084e0.png)


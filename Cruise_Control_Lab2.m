%% Cruise Control System Question 3
m = 1500; % kg
b = 50; % N.s/m
u = 1500; % N

%% Step 1: Write the system equation based on the Free Body Diagram of the car. 
% Ignore friction on the wheels and consider only velocity and acceleration in the horizontal direction.

syms xx_vel
xxx_accel = (1/m)*(u-(b*xx_vel));

disp('System equation of Cruise Control System:')
pretty(xxx_accel)

%% Step 2: Create the State-Space model in MATLAB using the properties above. 
% There is only one state variable, the velocity. 
% The output is also the velocity. Include the code and answer in your report

A = -b/m;
B = 1/m;
C = 1;
D = 0;

sys = ss(A,B,C,D);

%% Step 3: Generate the step response from 0 to 100 secs, with 0.05 sec step size. 
% u is the input signal.

time = 0:0.05:100;
u_input = 1500 * ones(size(time));

[y, t, x] = lsim(sys, u_input, time);

figure;
plot(t, y, 'LineWidth', 1.5);
grid on
xlabel('Time (s)');
ylabel('Velocity (m/s)')
title('Step Response of Cruise Control')


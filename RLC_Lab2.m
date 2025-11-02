%% RLC Question (2)
L = 5; %H
C = 300; %F
R = 1e5; %100 kohm
V = 300; %V

%% Step 1: 
% Write the system equation using Kirchhoff%s voltage law. 
% Charge 𝑞 is the independent variable.

syms L_ R_ C_ q(t) V_in(t)
i = diff(q, t);
eqn = L_*diff(i, t) + R_*i + (1/C_)*q == V_in;  
% L(di/dt) + R*i + q/C = V

disp('system equation using Kirchhoff%s voltage law:')
pretty(eqn)

%% Step 2: 
% Create the State-Space model in MATLAB. Choose charge and current
% (or time derivative of the charge) through the circuit as state variables
% Set the currentthrough the circuit as the output. Include the code and
% answer in your report.


A = [0, 1; -1/(L*C),-R/L];
B = [0; 1/L];
C_matrix = [0, 1];   % Output is current (x2)
D = 0;

sys = ss(A, B, C_matrix, D);

%% Step 3: 
% Generate the step response from 0 to 10 secs, with 0.05 sec step size.
% V is the input signal

t = 0:0.05:10;          % Time [s]
u = V * ones(size(t));  % Step input

% Simulate system response
[y, t_out, x_out] = lsim(sys, u, t);

% Plot current (output)
figure;
plot(t_out, y, 'LineWidth', 1.5)
xlabel('Time [s]')
ylabel('Current [A]')
title('RLC Circuit Step Response')
grid on
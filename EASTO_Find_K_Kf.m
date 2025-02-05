close all
clear

A=[0,1,0,0;-0.8266,-0.4974,0.0081,0.0450;0,0,0,1;0.8113,4.5037,-0.8113,-4.5037];
B=[0;-1.2779e-07;0;1.2779e-05];
C=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
D=[0;0;0;0];
H=[0;0;0;0];
G=[0;0;0;0];
sys=ss(A,B,C,D);

figure
step(sys)

Q=0.0001*[1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1];
R=0.001;
[K,s,e]=lqr(A,B,Q,R);

Qn=0.0001 * eye(1);
Rn=0.001*[1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1];
syse = ss(A,[B B],C,[D H]);
[kest,Kf,p]=kalman(syse,Qn,Rn);

% rlqg = lqgreg(kest,K);
% PC = -rlqg*sys;
% 
% figure
% step(PC)
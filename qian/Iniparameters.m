clear,clc,close all
copterpara
controlpara

% »¥²¹ÂË²¨ÏµÊý
global Kps Kis Kds last_e T exInt eyInt ezInt q
% Kps = 1;
% Kis = 0.05;
q = [1;0;0;0];
Kps = 20;
Kis = 0.00;
Kds = 30.00;
T = 0.01;
exInt = 0;
eyInt = 0;
ezInt = 0;
last_e = zeros(3,1);
syms fai theta psi bx by bz
c11 = cos(theta)*cos(psi);
c12 = cos(theta)*sin(psi);
c13 = -sin(theta);
c21 = sin(fai)*sin(theta)*cos(psi)-cos(fai)*sin(psi);
c22 = sin(fai)*sin(theta)*sin(psi)+cos(fai)*cos(psi);
c23 = sin(fai)*cos(theta);
c31 = cos(fai)*sin(theta)*cos(psi)+sin(fai)*sin(psi);
c32 = cos(fai)*sin(theta)*sin(psi)-sin(fai)*cos(psi);
c33 = cos(fai)*cos(theta);
% f = c11*bz*(c31*c22-c21*c32)+(c31*c12-c11*c32)*(c31*by-c21*bz)-c31*(c31*c22-c21*c32)*bx;
f = (cos(psi)*cos(theta)*(cos(psi)*sin(fai) - cos(fai)*sin(psi)*sin(theta)) + cos(theta)*sin(psi)*(sin(fai)*sin(psi) + cos(fai)*cos(psi)*sin(theta)))*(by*(sin(fai)*sin(psi) + cos(fai)*cos(psi)*sin(theta)) + bz*(cos(fai)*sin(psi) - cos(psi)*sin(fai)*sin(theta))) - bx*(sin(fai)*sin(psi) + cos(fai)*cos(psi)*sin(theta))*((sin(fai)*sin(psi) + cos(fai)*cos(psi)*sin(theta))*(cos(fai)*cos(psi) + sin(fai)*sin(psi)*sin(theta)) - (cos(fai)*sin(psi) - cos(psi)*sin(fai)*sin(theta))*(cos(psi)*sin(fai) - cos(fai)*sin(psi)*sin(theta))) + bz*cos(psi)*cos(theta)*((sin(fai)*sin(psi) + cos(fai)*cos(psi)*sin(theta))*(cos(fai)*cos(psi) + sin(fai)*sin(psi)*sin(theta)) - (cos(fai)*sin(psi) - cos(psi)*sin(fai)*sin(theta))*(cos(psi)*sin(fai) - cos(fai)*sin(psi)*sin(theta)));
df_psi=(cos(psi)*cos(theta)*(cos(psi)*sin(fai) - cos(fai)*sin(psi)*sin(theta)) + cos(theta)*sin(psi)*(sin(fai)*sin(psi) + cos(fai)*cos(psi)*sin(theta)))*(by*(cos(psi)*sin(fai) - cos(fai)*sin(psi)*sin(theta)) + bz*(cos(fai)*cos(psi) + sin(fai)*sin(psi)*sin(theta))) - bx*(cos(psi)*sin(fai) - cos(fai)*sin(psi)*sin(theta))*((sin(fai)*sin(psi) + cos(fai)*cos(psi)*sin(theta))*(cos(fai)*cos(psi) + sin(fai)*sin(psi)*sin(theta)) - (cos(fai)*sin(psi) - cos(psi)*sin(fai)*sin(theta))*(cos(psi)*sin(fai) - cos(fai)*sin(psi)*sin(theta))) - bz*cos(theta)*sin(psi)*((sin(fai)*sin(psi) + cos(fai)*cos(psi)*sin(theta))*(cos(fai)*cos(psi) + sin(fai)*sin(psi)*sin(theta)) - (cos(fai)*sin(psi) - cos(psi)*sin(fai)*sin(theta))*(cos(psi)*sin(fai) - cos(fai)*sin(psi)*sin(theta)));


%»¥²¹ÂË²¨·ÂÕæÏµÍ³

%angle=(angle+angle_dot*dt)*0.910+angle_m_cf*0.090;

% clc;
% 
% clear;
% 
% dt=0.01;
% 
% j=0;
% 
% angle=0;
% figure
% 
% for i=0:0.01:50   
% 
% x_acc = sin(i)+4*(-1+(1-(-1))*rand(1));
% 
% angle_dot =cos(i)+ 4*(-1+(1-(-1))*rand(1));%cos(i)+
% 
% angle= 0.98 * (angle + angle_dot * dt) + 0.02 * x_acc;
% 
% plot (i,x_acc,'r',i,angle_dot,'b',i,angle,'g');
% 
% hold on
% 
% end
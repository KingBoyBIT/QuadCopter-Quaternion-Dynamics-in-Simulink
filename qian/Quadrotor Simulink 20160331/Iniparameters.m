m = 0.75;
g = 9.8;
yaw = 0;

Ixx = 19.688e-3;
Iyy = 19.688e-3;
    % Izz = 19.688e-3;
Izz = 3.938e-2;
L = 0.25;
km = 7.5e-7;            %力矩系数
kf = 3.13e-5;           %升力系数

wh = sqrt(m*g/(4*kf));
aaa=inv([kf kf kf kf;0 -kf 0 kf;-kf 0 kf 0;-km km -km km]);

xf=5;
yf=5;
zf=5;

kpx = 0.75;             %x 0.96  0.113
kix = 0.001;
kdx = 0.55;
kpy = 1.4;                %y
kiy = 0.001;
kdy = 2.0;
kpz = 2.9;                %z
kiz = 0.001;
kdz = 2.4;

% kpx = 0.75;             %x 0.96  0.113
% kix = 0.001;
% kdx = 0.55;
% kpy = 0.95;                %y
% kiy = 0.001;
% kdy = 1.8;
% kpz = 2.9;                %z
% kiz = 0.001;
% kdz = 3;

% 20160329调
% kpx = 0.7;             %x 0.96  0.113
% kix = 0.001;
% kdx = 0.3;
% kpy = 0.9;                %y
% kiy = 0.01;
% kdy = 0.7;
% kpz = 2.7;                %z
% kiz = 0.01;
% kdz = 2;

kpphi = 25;            %滚转 15  193
kdphi = 8;                  %20
kptheta = kpphi;          %俯仰
kdtheta = kdphi;
kppsai = 23;           %偏航
kdpsai = 8;

% 20160327调
% kpphi =16;            %滚转 15  193
% kdphi = 35;                  %20
% kptheta = kpphi;          %俯仰
% kdtheta = kdphi;
% kppsai = 3.5;           %偏航
% kdpsai = 2.5;









% kpx = 1.8;
% kix = 1.7;
% kdx = 1.4;
% kpy = 1.5;
% kiy = 1.3;
% kdy = 1.2;
% kpz = 1.8;
% kiz = 0.6;
% kdz = 1.5;
% 
% kpphi = 1.5;
% kdphi = 2.5;
% kptheta = 2.5;
% kdtheta = 1.5;
% kppsai = 5;
% kdpsai = 4;


% m = 0.5;
% g = 9.8;
% Ixx = 0.114;
% Iyy = 0.114;
% Izz = 0.158;
% L = 0.2;
% 
% kdx = 1.3;
% kdy = 1.3;
% kdz = 2;
% kix = 1e-4;
% kiy = 3e-4;
% kiz = 1e-6;
% kpx = 0.7;
% kpy = 0.7;
% kpz = 1.3;
% 
% kdphi = 40000;
% kdtheta = 40000;
% kdpsai = 40000;
% kpphi = 20000;
% kptheta = 20000;
% kppsai = 8000;
% 
% km = 1.5e-9;            %力矩系数
% 
% kf = 6.11e-8;           %
% wh = sqrt(m*g/(4*kf));
% 
% yaw = 0;













% 互补滤波系数
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

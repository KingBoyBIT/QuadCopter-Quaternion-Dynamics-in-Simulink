function out = AHRSupdate( gyro,  acc,  mag)
%  ���ٶȼơ��شżơ������������ںϣ�������Ԫ��
%    [gx,gy,gz]Ϊ�����ǵĲ���ֵ
%    [ax,at,az]Ϊ���ٶȵĲ���ֵ
%    [mx,my,mz]Ϊ�شżƵĲ���ֵ

global exInt eyInt ezInt Kis Kps Kds T q last_e
sampleFreq  = 1/1;
halfT = T;
q0 = q(1);
q1 = q(2);
q2 = q(3);
q3 = q(4);
gx = gyro(1);
gy = gyro(2);
gz = gyro(3);
ax = acc(1);
ay = acc(2);
az = acc(3);
mx = mag(1);
my = mag(2);
mz = mag(3);
% ����һЩ������������ת������
q0q0 = q0*q0;
q0q1 = q0*q1;
q0q2 = q0*q2;
q0q3 = q0*q3;
q1q1 = q1*q1;
q1q2 = q1*q2;
q1q3 = q1*q3;
q2q2 = q2*q2;
q2q3 = q2*q3;
q3q3 = q3*q3;

% ��һ�����ٶȼƺ͵شżƵĶ���
norm = sqrt(ax*ax + ay*ay + az*az);
if norm ~= 0
	ax = ax / norm;
	ay = ay / norm;
	az = az / norm;
end

norm = sqrt(mx*mx + my*my + mz*mz);
if norm ~= 0
	mx = mx / norm;
	my = my / norm;
	mz = mz / norm;
end
% ��bϵ�еĵشżƷ���[mx,my,mz]ת����nϵ,�õ�[hx,hy,hz]
hx = 2*mx*(0.5 - q2q2 - q3q3) + 2*my*(q1q2 - q0q3) + 2*mz*(q1q3 + q0q2);
hy = 2*mx*(q1q2 + q0q3) + 2*my*(0.5 - q1q1 - q3q3) + 2*mz*(q2q3 - q0q1);
hz = 2*mx*(q1q3 - q0q2) + 2*my*(q2q3 + q0q1) + 2*mz*(0.5 - q1q1 - q2q2);

% �õ�nϵ�еĵش���������ʵֵ[bx,bz,by],����by=0
bx = sqrt((hx*hx) + (hy*hy));
bz = hz;

% [bx��by,bz]ת����bϵ�У��õ�[wx,wy,wz]
wx = 2*bx*(0.5 - q2q2 - q3q3) + 2*bz*(q1q3 - q0q2);
wy = 2*bx*(q1q2 - q0q3) + 2*bz*(q0q1 + q2q3);
wz = 2*bx*(q0q2 + q1q3) + 2*bz*(0.5 - q1q1 - q2q2);

% nϵ���������ٶ�[0,0,1]ת����bϵ�еõ���������[vx,vy,vz]
vx = 2*(q1q3 - q0q2);
vy = 2*(q0q1 + q2q3);
vz = q0q0 - q1q1 - q2q2 + q3q3;

% ����[wx,wy,wz] X [mx,my,mz],[ax,at,az] X [vx,vy,vz]���õ������������
ex = (ay*vz - az*vy) + (my*wz - mz*wy);
ey = (az*vx - ax*vz) + (mz*wx - mx*wz);
ez = (ax*vy - ay*vx) + (mx*wy - my*wx);
% ex = (ay*vz - az*vy) ;
% ey = (az*vx - ax*vz) ;
% ez = (ax*vy - ay*vx) ;
eDif = [ex;ey;ez] - last_e;
last_e = [ex;ey;ez];
% PI�������еĻ��ֲ���
exInt = exInt + ex*Kis* (1.0 / sampleFreq)+ Kds * eDif(1);
eyInt = eyInt + ey*Kis* (1.0 / sampleFreq)+ Kds * eDif(2);
ezInt = ezInt + ez*Kis* (1.0 / sampleFreq)+ Kds * eDif(3);

% ����PI�����������,Ȼ�󲹳������ٶȵ�����������Kp��Ki����Ҫ���ڵĲ���
gx = gx + Kps*ex + exInt;
gy = gy + Kps*ey + eyInt;
gz = gz + Kps*ez + ezInt;

% һ�����������������Ԫ��
q0 = q0 + (-q1*gx - q2*gy - q3*gz)*halfT;
q1 = q1 + (q0*gx + q2*gz - q3*gy)*halfT;
q2 = q2 + (q0*gy - q1*gz + q3*gx)*halfT;
q3 = q3 + (q0*gz + q1*gy - q2*gx)*halfT;

%  ��һ����Ԫ��
norm = sqrt(q0*q0 + q1*q1 + q2*q2 + q3*q3);
q0 = q0 / norm;
q1 = q1 / norm;
q2 = q2 / norm;
q3 = q3 / norm;

norm = sqrt(ax*ax + ay*ay + az*az);
if norm ~= 0
	out = [q0;q1;q2;q3];
else
	out = q;
end

end
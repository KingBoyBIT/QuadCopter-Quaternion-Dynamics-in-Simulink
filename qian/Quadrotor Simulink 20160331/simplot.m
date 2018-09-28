close all
clc

figure (1)
grid on
hold on
axis square
 plot3(pos_t(:,1),pos_t(:,2),pos_t(:,3),'-b')
hold on
plot3(1*sin(t/2),1*cos(t/2),1*t,'-r')
view(3) 

% plot3([0,xf],[0,yf],[0,zf],'-r')
% figure
% grid on
% hold on
% plot(t,pos_t(:,1)-xf,'-r');
% plot(t,pos_t(:,2)-yf,'-g');
% plot(t,pos_t(:,3)-zf,'-b');
figure (2)
grid on
hold on
plot(t,pos_t(:,1),'-r');
plot(t,pos_t(:,2),'-g');
plot(t,pos_t(:,3),'-b');

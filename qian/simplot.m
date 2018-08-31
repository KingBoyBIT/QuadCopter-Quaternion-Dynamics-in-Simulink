close all
clc

figure(1)
set(gcf,'color',[1 1 1])
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
if 0
figure (2)
set(gcf,'color',[1 1 1])
grid on
hold on
plot(t,pos_t(:,1),'-r');
plot(t,pos_t(:,2),'-g');
plot(t,pos_t(:,3),'-b');

figure(3)
set(gcf,'color',[1 1 1])
grid on
hold on
plot(t,angle_t(:,1)/pi*180,'-r');
plot(t,angle_t(:,2)/pi*180,'-g');
plot(t,angle_t(:,3)/pi*180,'-b');

end

clear all;clf


r = 6.3:0.01:8
a1= sqrt((4*r.^2-50*r+159)/3)

plot(a1,r,"k")
hold on
grid on

r = 3.75:0.01:6.3
a2=sqrt((4*r.^2-30*r+171)/153)

plot(a2,r,"k")

xlabel("$\sigma$",'Interpreter','latex')
ylabel("$r$",'Interpreter','latex')
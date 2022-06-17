g=9.81; v0=55; m=80; c=15; z0=100;


t=0:0.1:8;
z = -(z0+m/c*(v0+m*g/c)*(1-exp(-c/m*t))-m*g/c*t);
plot(t,z)
grid
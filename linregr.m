function [a,r2] = linregr(x,y)

n=length(x);

if length(y)~=n, error('x and y must be same length');
end
x=x(:); 
y=y(:); 

sx=sum(x); 
sy=sum(y);

sx2=sum(x.*x); 
sxy=sum(x.*y); 
sy2=sum(y.*y);

a(1)=(n*sxy-sx*sy)/(n*sx2-sx^2);
a(2)= sy/n - a(1)*sx/n;

r2=((n*sxy-sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2;


xp=linspace(min(x),max(x),2);
%yp=a(1)*xp+a(2);
yp=1.9842*xp-0.5620;

xx=10:1.0:80;
yy=0.2741*xx.^1.9842;

%yyy=0.2741*xx.^2; %cdv^2 과 ^2의 차이

%plot(x,y,'o',xp,yp)
%plot(x,y,'o',xp,yp,'--k',xx,yy,'b',xx,yyy,'r')
plot(x,y,'o',xp,yp,'--k',xx,yy,'b')
grid on


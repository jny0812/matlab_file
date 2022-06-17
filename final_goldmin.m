
% output:
%	x = location of minimum
%	fx = minimum function value
%	ea = approximate relative error (%)
%	iter = number of iterations

%f: 함수식에 (-)를 붙여야 한다. (최대화를 구해야 하므로)
function [x,fx,ea,iter]=final_goldmin(f,xl,xu,es,maxit,varargin)

if nargin<3, error('at least 3 input arguments required'),end
if nargin<4 || isempty(es), es=0.01;end
if nargin<5 || isempty(maxit), maxit=50;end

%phi: 황금비
phi=(1+sqrt(5))/2; 

iter=0; 
ea=100;

disp('  iter   ea       xopt     fy') 

while (1)  
    d = (phi-1)*(xu - xl);
    x1 = xl + d;
    x2 = xu - d;

    if f(x1)<f(x2)
        xopt = x1;  %x1
        xl = x2;   %xl

    else    %f(x1)>f(x2)
        xopt = x2;  
        xu = x1;        %x1

    end

    iter = iter +1;
    fy = f(xopt);
    fprintf('%4.0f  %8.4f %8.4f %8.4f \n', iter,ea,xopt,fy)

    if xopt ~= 0, ea = (2-phi) * abs((xu-xl)/xopt) * 100; end

    if ea <= es || iter >= maxit, break, end

end

x = xopt;
fx = f(xopt);




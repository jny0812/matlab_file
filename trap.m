
function [I, et] = trap(func, a, b, n, varargin)

if nargin<3, error('at least 3 input arguments required'), end
if ~(b>a), error('upper bound must be greater than lower'), end
if nargin<4 || isempty(n), n=100; end

x=a;
h=(b-a)/n;
s=func(a);

for i = 1:n-1
    x=x+h;
    s=s+2*func(x);
end

s=s+func(b);
I = (b-a) * s/(2*n);

et = (0.0320-I)/0.0320*100;

%출력값 1개여도 출력변수 지정
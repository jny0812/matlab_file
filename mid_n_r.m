
function [root, ea, iter] = mid_n_r(func,dfunc,xr, es, maxit, varargin) 

if nargin<3, error('at least 1 input arguments required'), end 
if nargin<4 || isempty(es), es= 0.0001; end 
if nargin<5 || isempty (maxit), maxit =50 ; end 
iter = 0; 
while (1) 
   xrold = xr; 
   xr = xr - func(xr)/dfunc(xr); 
   iter = iter +1; 

   if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end 
   if ea <= es || iter >= maxit, break, end 

   fprintf( '%8.0f %10.4f %10.4f \n' , iter,xr,ea)
end 

root = xr; 
end

%function fx=funcx(x)
 % fx = 3*(x.^2) -9(x) +4;
%end
 
%function dfx=dfuncx(x)
 % dfx = 6*x -9



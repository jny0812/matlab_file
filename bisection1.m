
function [root,ea,iter] = bisection1(func, xl, xu, es, maxit)

  if func(xl)*func(xu) >0 
    error ('no sign change')       
  end

if nargin<5, maxit = 50; end         
if nargin<4, es = 0.0005; end         

iter = 0;
xr = xl;
ea=100;
while (1)
     xrold = xr;
     xr = (xl + xu)/2;
     iter = iter + 1;        
     fprintf( ' %8.0f  %10.4f  %10.4f \n', iter,ea,xr)
     if xr ~= 0, ea = abs((xr-xrold)/xr)*100; end
     test =  func(xl)*func(xr);

     if test < 0
         xu = xr;
       elseif test > 0
         xl = xr;
       else
         ea = 0;
     end

   if ea <= es  ||  iter >= maxit, break, end
 end

 root = xr;

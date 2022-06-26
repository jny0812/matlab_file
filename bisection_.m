
function x = bisection_(xl, xu, es, maxit)

  if func(xl)*func(xu) >0 
    error ('no bracket')       
  end

if nargin<4, maxit = 100; end         
if nargin<3, es = 0.001; end         

iter = 0;
xr = xl;
ea=100;

while (1)
     xrold = xr;
     xr = (xl + xu)/2;   %bisection method

     iter = iter + 1;  
    
     fprintf( ' %d  %f %f  %f %f \n', iter,xl,xu,xr,ea)

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

 x = xr;

end    

function fx=func(x)
 fx= -5*(x.^4) + 216*(x.^2) -1296;
end

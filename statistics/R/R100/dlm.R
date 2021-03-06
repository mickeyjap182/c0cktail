#!/usr/bin/Rscript
# $B%m!<%+%k%l%Y%k%b%G%k(B

library(dlm)

#=====================
# $B:8C<$b?dDj$9$k(B
#=====================

#$B!!(BStep1 
#$B!!%b%G%k:n@.$N$?$a$N4X?t$r:n$k(B
build.2 <- function(theta){
    dlmModPoly(order=1, dV=exp(theta[1]), dW=exp(theta[2]), m0=exp(theta[3]))
    }

#$B!!(BStep2
#$B!!(BMLE$B$G%Q%i%a%??dDj!#(B

fit.2 <- dlmMLE(
  Nile, 
  parm=dlmMLE(Nile, parm=c(1,1,10), build.2,method="Nelder-Mead")$par,build.2, 
  method="BFGS"
)
fit.2


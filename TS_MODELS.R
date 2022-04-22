

# Uncomment to install packages
#install.packages("data.table")
#install.packages("bit64")
#install.packages("gnm")

library('data.table')
library('bit64')
library('gnm')


dataTS <- fread("EXAMPLE_DATA.csv")

#Plot counts
plot(dataTS$T, dataTS$Y,
     bty="n", pch=19, col="gray",
     ylim = c(0, 300), xlim=c(0,200),
     xlab = "Time (days)", 
     ylab = "TSCI" )

# Line marking the interruption
abline( v=50, col="firebrick", lty=2 )
text( 50, 300, "Interruption 1", col="firebrick", cex=1.3, pos=4 )

abline( v=100, col="firebrick", lty=2 )
text( 100, 250, "Interruption 2", col="firebrick", cex=1.3, pos=4 )


# Add the regression line
l <- lm( Y ~ T + D1 + D2 +D3 + P, data=dataTS )
lines( dataTS$T, l$fitted.values, col="firebrick", lwd=2 )

# Add the regression line
gn <- gnm( Y ~ T + D1 + D2 + D3 + P, data=dataTS)
lines( dataTS$T, gn$fitted.values, col="steelblue", lwd=2 )

# Because the data is linear the lm and gnm will have the same result



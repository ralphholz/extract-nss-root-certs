# This file is part of the SSL Landscape:
#
# Ralph Holz, Lothar Braun, Nils Kammenhuber, and Georg Carle.
# The SSL Landscape - A Thorough Analysis of the X.509 PKI 
# Using Active and Passive Measurements. In Proc. ACM/USENIX 
# 11th Annual Internet Measurement Conference (IMC '11), Berlin, 
# Germany, November 2011
#
# It is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This code is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this file. If not, see <http://www.gnu.org/licenses/>.

# Code history:
# Original author: Nils Kammenhuber, nils.kammenhuber@googlemail.com
# Extensions by: Ralph Holz, ralph@ralphholz.de

cinr <- read.table("root_store_count.csv", header=F, sep=",")
cinr.names <- c("epoch", "count")
names(cinr) <- cinr.names

cinr.sf <- stepfun(cinr$epoch, append(0, cinr$count))

plotCertsInRootStore <- function(
    from=965512800,   # 2000-08-06 00:00:00 UTC
    to=1356908400,   # 2012-12-31 00:00:00 UTC
    xlab='',
    forprinting=FALSE
) {

  opar <- par()
  par(las=2)
  
  cinr.sf <- stepfun(cinr$epoch, append(0, cinr$count))

  if (forprinting) {
    col.hor <- "black"
    cex.points <- 0.7
  } else {
    col.hor <- "blue"
    cex.points <- 1.1
  }
  
  plot(cinr.sf,
       xlab=xlab,
       ylab="Number of certificates",
       main="",
       xlim=c(from,to),
       col="blue",
       col.hor=col.hor,
       col.vert="grey",
       verticals=T,
       pch=16,
       xaxt='n',
       yaxt='n',
       cex.points=cex.points
  )


  ticks <- read.table("ticks_for_plot.csv", sep=",", header=F)
  ticks.names <- c("date", "epoch")
  names(ticks) <- ticks.names 
  axis(side=1,
       at=ticks$epoch,
       labels=ticks$date)
  axis(side=2,
       at=c(0,20,40,60,80,100,120,140,160,180,200,220))
  #par(opar)
  
}

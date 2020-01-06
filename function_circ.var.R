circ.var <- function(m,int,na.rm=T) { ### v4

   if(na.rm) m <- m[!is.na(m)]
   m <- sort(m%%int)
   # calculate differences between neighbouring values
   diffs <- abs(diff(c(m,m[1])))
   cdiffs <- unlist(lapply(diffs,circ.diff,int=int))

   # find the numbers with maximum circular difference between them
   maxcdiffind <- which(cdiffs==max(cdiffs))

   # does the arc containing all the points cross 0/int?
   # (i.e. does diffs have any entries greater than max(cdiffs)?)
   arccontmid <- ifelse(max(diffs)>max(cdiffs),TRUE,FALSE)

   # rotate and calculate mean if arc contains midnight
   if(arccontmid) {

      # if arc of all points contains midnight, rotate and calculate mean
      # work out which point is maximum (point "before" biggest gap)
      if(maxcdiffind==length(m)) {
         arcmax <- max(m[maxcdiffind],m[1])
      } else {
         arcmax <- max(m[maxcdiffind],m[maxcdiffind+1])
      }

      # rotate arc so it no longer crosses midnight
      rotateby <- int-arcmax
      m <- (m+rotateby)%%int

      # calculate standard mean, then rotate back by rotated amount
      cv <- var(m)

   } else {

      # calculate standard mean if arc does not contain midnight
      cv <- var(m)

   }

   return(cv)

}

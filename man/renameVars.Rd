% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/GUIfunctions.R
\docType{methods}
\name{renameVars}
\alias{renameVars}
\alias{renameVars,sdcMicroObj-method}
\alias{renameVars-methods}
\title{Change the name of levels of a keyVariable in an object of class
\code{\link{sdcMicroObj-class}}}
\usage{
renameVars(obj, var, before, after)
}
\arguments{
\item{obj}{object of class \code{\link{sdcMicroObj-class}}}

\item{var}{name of the keyVariable to change}

\item{before}{vector of levels before}

\item{after}{vector of levels after}
}
\value{
the modified \code{\link{sdcMicroObj-class}}
}
\description{
Change the labels of levels.
}
\section{Methods}{
 \describe{
\item{list("signature(obj = \"sdcMicroObj\")")}{}}
}
\examples{
## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- renameVars(sdc, var="urbrur", before=2, after=78)
}
\keyword{manip}


% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/valTable.R
\name{valTable}
\alias{valTable}
\title{Comparison of different microaggregation methods}
\usage{
valTable(x, method = c("simple", "onedims", "clustpppca",
  "addNoise: additive", "swappNum"), measure = "mean",
  clustermethod = "clara", aggr = 3, nc = 8, transf = "log", p = 15,
  noise = 15, w = 1:dim(x)[2], delta = 0.1)
}
\arguments{
\item{x}{data frame or matrix}

\item{method}{microaggregation methods or adding noise methods or rank swapping.}

\item{measure}{FUN for aggregation. Possible values are mean (default), median, trim, onestep.}

\item{clustermethod}{clustermethod, if a method will need a clustering procedure}

\item{aggr}{aggregation level (default=3)}

\item{nc}{number of clusters. Necessary, if a method will need a clustering procedure}

\item{transf}{Transformation of variables before clustering.}

\item{p}{Swapping range, if method swappNum has been chosen}

\item{noise}{noise addition, if an addNoise method has been chosen}

\item{w}{variables for swapping, if method swappNum has been chosen}

\item{delta}{parameter for adding noise method \sQuote{correlated2}}
}
\value{
Measures of information loss splitted for the comparison of different methods.

Methods for adding noise should be named via \dQuote{addNoise: method}, e.g.
\dQuote{addNoise: correlated}, i.e. the term \sQuote{at first} then followed
by a \sQuote{:} and a blank and then followed by the name of the method as
described in function \sQuote{addNoise}.
}
\description{
A Function for the comparison of different perturbation methods.
}
\details{
Tabelarise the output from summary.micro. Will be enhanced to all
perturbation methods in future versions.
}
\examples{
data(Tarragona)
\dontrun{
valTable(Tarragona[100:200,],
method=c("simple","onedims","pca","addNoise: additive"))
valTable(Tarragona,
method=c("simple","onedims","pca","clustpppca",
"mdav", "addNoise: additive", "swappNum"))
## clustpppca in combination with Mclust outperforms
## the other algorithms for this data set...
}
}
\author{
Matthias Templ
}
\references{
Templ, M. and Meindl, B., \emph{Software Development for SDC in
R}, Lecture Notes in Computer Science, Privacy in Statistical Databases,
vol. 4302, pp. 347-359, 2006.
}
\seealso{
\code{\link{microaggregation}}, \code{\link{summary.micro}}
}
\keyword{print}


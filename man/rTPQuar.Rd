% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/realizedMeasures.R
\name{rTPQuar}
\alias{rTPQuar}
\title{Realized tri-power quarticity}
\usage{
rTPQuar(rData, alignBy = NULL, alignPeriod = NULL, makeReturns = FALSE)
}
\arguments{
\item{rData}{an \code{xts} or \code{data.table} object containing returns or prices, possibly for multiple assets over multiple days.}

\item{alignBy}{character, indicating the time scale in which \code{alignPeriod} is expressed. 
Possible values are: \code{"secs"}, \code{"seconds"}, \code{"mins"}, \code{"minutes"}, \code{"hours"}.}

\item{alignPeriod}{positive numeric, indicating the number of periods to aggregate over. For example, to aggregate
based on a 5-minute frequency, set \code{alignPeriod = 5} and \code{alignBy = "minutes"}.}

\item{makeReturns}{boolean, should be \code{TRUE} when \code{rData} contains prices instead of returns. \code{FALSE} by default.}
}
\value{
\itemize{
\item In case the input is an \code{xts} object with data from one day, a numeric of the same length as the number of assets.
\item If the input data spans multiple days and is in \code{xts} format, an \code{xts} will be returned.
\item If the input data is a \code{data.table} object, the function returns a \code{data.table} with the same column names as the input data, containing the date and the realized measures.
}
}
\description{
Calculate the rTPQuar, defined in Andersen et al. (2012).

 Assume there are \eqn{N} equispaced returns \eqn{r_{t,i}} in period \eqn{t}, \eqn{i=1, \ldots,N}. Then, the rTPQuar is given by
 \deqn{
   \mbox{rTPQuar}_{t}=N\frac{N}{N-2} \left(\frac{\Gamma \left(0.5\right)}{ 2^{2/3}\Gamma \left(7/6\right)} \right)^{3} \sum_{i=3}^{N} \mbox({|r_{t,i}|}^{4/3} {|r_{t,i-1}|}^{4/3} {|r_{t,i-2}|}^{4/3})
 }
}
\examples{
tpv <- rTPQuar(rData = sampleTData[, list(DT, PRICE)], alignBy = "minutes",
              alignPeriod = 5, makeReturns = TRUE)
tpv

}
\references{
Andersen, T. G., Dobrev, D., and Schaumburg, E. (2012). Jump-robust volatility estimation using nearest neighbor truncation. \emph{Journal of Econometrics}, 169, 75-93.
}
\author{
Giang Nguyen, Jonathan Cornelissen, Kris Boudt, and Emil Sjoerup.
}
\keyword{highfrequency}
\keyword{rTPQuar}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/realizedMeasures.R
\name{rSV}
\alias{rSV}
\title{Realized semivariance of highfrequency return series}
\usage{
rSV(rData, alignBy = NULL, alignPeriod = NULL, makeReturns = FALSE, ...)
}
\arguments{
\item{rData}{an \code{xts} or \code{data.table} object containing returns or prices, possibly for multiple assets over multiple days.}

\item{alignBy}{character, indicating the time scale in which \code{alignPeriod} is expressed. 
Possible values are: \code{"secs"}, \code{"seconds"}, \code{"mins"}, \code{"minutes"}, \code{"hours"}.}

\item{alignPeriod}{positive numeric, indicating the number of periods to aggregate over. For example to aggregate.
based on a 5-minute frequency, set \code{alignPeriod = 5} and \code{alignBy = "minutes"}.}

\item{makeReturns}{boolean, should be \code{TRUE} when \code{rData} contains prices instead of returns. 
\code{FALSE} by default.}

\item{...}{used internally}
}
\value{
list with two entries, the realized positive and negative semivariances
}
\description{
Calculate the realized semivariances, defined in Barndorff-Nielsen et al. (2008).

Function returns two outcomes: 

\enumerate{
\item Downside realized semivariance 
\item Upside realized semivariance.
}

Assume there are \eqn{N} equispaced returns \eqn{r_{t,i}} in period \eqn{t}, \eqn{i=1, \ldots,N}.

Then, the \code{rSV} is given by
\deqn{
  \mbox{rSVdownside}_{t}= \sum_{i=1}^{N} (r_{t,i})^2  \ \times \ I [ r_{t,i} < 0]
}
  \deqn{
  \mbox{rSVupside}_{t}= \sum_{i=1}^{N} (r_{t,i})^2 \ \times \ I [ r_{t,i} > 0]
}
}
\examples{
sv <- rSV(sampleTData[, list(DT, PRICE)], alignBy = "minutes",
          alignPeriod = 5, makeReturns = TRUE)
sv
}
\references{
Barndorff-Nielsen, O. E., Kinnebrock, S., and Shephard N. (2010). \emph{Measuring downside risk: realised semivariance}. In: Volatility and Time Series Econometrics: Essays in Honor of Robert F. Engle,
(Edited by Bollerslev, T., Russell, J., and Watson, M.), 117-136. Oxford University Press.
}
\author{
Giang Nguyen, Jonathan Cornelissen, Kris Boudt, and Emil Sjoerup.
}
\keyword{highfrequency}
\keyword{rSV}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/girafe_options.R
\name{opts_zoom}
\alias{opts_zoom}
\title{Zoom settings}
\usage{
opts_zoom(min = 1, max = 1)
}
\arguments{
\item{min}{minimum zoom factor}

\item{max}{maximum zoom factor}
}
\description{
Allows customization of the zoom.
}
\examples{
library(ggplot2)

dataset <- mtcars
dataset$carname = row.names(mtcars)

gg <- ggplot(
  data = dataset,
  mapping = aes(x = wt, y = qsec, color = disp,
                tooltip = carname, data_id = carname) ) +
  geom_point_interactive() + theme_minimal()

x <- girafe(ggobj = gg)
x <- girafe_options(x,
  opts_zoom(min = .7, max = 2) )
if( interactive() ) print(x)
}
\seealso{
Other girafe animation options: 
\code{\link{girafe_options}()},
\code{\link{opts_hover}()},
\code{\link{opts_selection}()},
\code{\link{opts_sizing}()},
\code{\link{opts_toolbar}()},
\code{\link{opts_tooltip}()}
}
\concept{girafe animation options}

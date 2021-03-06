% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/girafe_options.R
\name{opts_toolbar}
\alias{opts_toolbar}
\title{Toolbar settings}
\usage{
opts_toolbar(position = "topright", saveaspng = TRUE)
}
\arguments{
\item{position}{one of 'top', 'bottom', 'topleft', 'topright', 'bottomleft', 'bottomright'}

\item{saveaspng}{set to TRUE to propose the 'save as png' button.}
}
\description{
Allows customization of the toolbar
}
\note{
\code{saveaspng} relies on JavaScript promises, so any browsers that don't natively
support the standard Promise object will need to have a polyfill (e.g.
Internet Explorer with version less than 11 will need it).
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
  opts_toolbar(position = "top") )
if( interactive() ) print(x)
}
\seealso{
Other girafe animation options: 
\code{\link{girafe_options}()},
\code{\link{opts_hover}()},
\code{\link{opts_selection}()},
\code{\link{opts_sizing}()},
\code{\link{opts_tooltip}()},
\code{\link{opts_zoom}()}
}
\concept{girafe animation options}

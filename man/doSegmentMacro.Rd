% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/shinyga_macros.R
\name{doSegmentMacro}
\alias{doSegmentMacro}
\title{Quick setup of shinyga segments}
\usage{
doSegmentMacro(input, output, session, token)
}
\arguments{
\item{input}{Shiny input object.}

\item{output}{Shiny output object.}

\item{session}{Shiny session object.}

\item{token}{GA token.}
}
\value{
A segment table

A DataTable called from ui.r by renderDataTable('SegmentTable')

A selectInput('menuSeg') called from ui.r by uiOutput("controlSeg") and input$menuSeg
}
\description{
This function creates the menu and fetches the GA segments.
}
\examples{
\dontrun{


## client info taken from Google API console.
CLIENT_ID      <-  "xxxxx.apps.googleusercontent.com"
CLIENT_SECRET  <-  "xxxxxxxxxxxx"
CLIENT_URL     <-  'https://mark.shinyapps.io/ga-effect/'
## comment out for deployment, in for local testing via runApp(port=6423)
CLIENT_URL     <-  'http://127.0.0.1:6423'

securityCode <- createCode()

shinyServer(function(input, output, session)){

  ## returns list of token and profile.table
  auth <- doAuthMacro(input, output, session,
                      securityCode,
                      client.id     = CLIENT_ID,
                      client.secret = CLIENT_SECRET,
                      client.uri    = CLIENT_URL)

  ga.token         <- auth$token
  profile.table    <- auth$table

  segments <- doSegmentMacro(input, output, session,
                             token=ga.token())

  }
}
}
\seealso{
Other shiny macro functions: \code{\link{authDropdownRow}};
  \code{\link{metricSelect}};
  \code{\link{renderAuthDropdownRow}}
}


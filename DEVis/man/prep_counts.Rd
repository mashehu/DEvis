% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preprocess.R
\name{prep_counts}
\alias{prep_counts}
\title{Read tab or comma delimited count data.}
\usage{
prep_counts(count_input, delim = "t")
}
\arguments{
\item{count_input}{Count data in tab-delimited or comma-delimited (CSV) format, assumes headers exist for each column.
Note that column names in the input count file must match row names in the input target metadata file.}

\item{delim}{Indicate if file is comma or tab delimited.  "t" indicated tab delimited and "c" indicates comma separated data.  Default: "t"}
}
\value{
This function will return a properly formatted count data table based on a provided input file.
}
\description{
This function takes a count data file and returns the formatted data. Requires that init_data_paths() has been run.
}
\examples{
\dontrun{

#Read a tab-delimited text file as count input.
myCounts <- prep_counts(count_input="master_count_data.txt", delim="t")

}
}
\seealso{
\code{\link{prep_targets}}, \code{\link{prep_dds_from_data}}, \code{\link{init_data_paths}}
}
\keyword{counts}
\keyword{input}

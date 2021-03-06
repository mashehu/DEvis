% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DE_expr_plots.R
\name{de_series}
\alias{de_series}
\title{Identify and visualize patterns of expression between differentially expressed genes across a series of result sets.}
\usage{
de_series(res_list, filename = "series_pattern.pdf", designVar, groupBy,
  numGroups = 5, theme = 1, method = "mean", customLabels = FALSE,
  returnData = FALSE, writeData = FALSE, fetchGroup = 0)
}
\arguments{
\item{res_list}{A list of DESeq result sets. Results can be calculated individually using DESeq's results() function.
Lists of results can be created by creating a list(result1, result2 ... result_N).}

\item{filename}{Filename for output plot.  Valid extensions are ".pdf" and ".png".
File generation for plot file can be turned off using set_output_mode("screen").
Output will be written to the /DE/series_plots/ directory.}

\item{designVar}{The design field used when performing results() extractions.
Must correspond to a metadata column. String.}

\item{groupBy}{The variable by which to group data in the plot.  I.E. "Condition_Time". String.}

\item{numGroups}{The number of groups to split data into.  Default = 5}

\item{theme}{Theme for the layout and color scheme for the plot.  Valid selections are integers between 1-6.}

\item{method}{Method for drawing.  "glm" uses generalized linear model to show overall trends over time.  "mean" uses the mean expression
value for each group as intersection points.}

\item{customLabels}{If customLabels is set to TRUE, the user will be prompted to provide a custom label for each label.}

\item{returnData}{If this value is true, this function will return a list of dataframes corresponding to groupwise splits. Default: FALSE}

\item{writeData}{If this value is true, this function will write data to file in the DE series folder for each group of genes. Default: FALSE}

\item{fetchGroup}{Specifically fetch gene information for a specific group.  This will override standard returnData and instead return data for the specified
group number.}
}
\value{
If returnData is true, this function will return a list of dataframes corresponding to groupwise splits.
}
\description{
This function identifies patterns of expression across differentially expressed genes and clusters them into
groups based on similar patterns of expression across multiple series, such as time series data (I.E. day1, day2, day3).  The resulting
group data are plotted to show how expression of groups change over the course of the series based on a generalized
linear model with a displayed 95 percent confidence interval, or based on the mean expression for each point in the series.
Similarity is calculated by clustering and merging genes until all differentially expressed genes have been clustered into
the desired number of groups.
}
\examples{
\dontrun{

 #This example assumes an experimenal design of ~Condition_Time.

#Prepare a result list.
res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
myResList <- list(res.day1, res.day2, res.day3)

/*
 * Cluster genes by similarity into 5 groups, then visualize their expression over the
 * course of the series using a generalized linear model.
 */
de_series(res_list=myResList, filename="DE_series_pattern.pdf",
             designVar="Condition_Time",
             groupBy="Time", numGroups=5, theme=1, method="glm",
             returnData=FALSE, writeData=FALSE)


/*
 * Cluster genes by similarity into 3 groups, then visualize their expression over the
 * course of the series using based on mean group expression values.
 */
de_series(res_list=myResList, filename="DE_series_pattern.pdf",
             designVar="Condition_Time",
             groupBy="Time", numGroups=3, theme=2, method="mean",
             returnData=FALSE, writeData=FALSE)

 }
}
\keyword{DE}
\keyword{aggregate}
\keyword{cluster}
\keyword{similarity}
\keyword{visualization}

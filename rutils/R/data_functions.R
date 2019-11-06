
#' Generate a random data set
#'
#' Creates a data set with 3 character columns and 3 numeric columns
#'
#' @param n Number of rows
#' @param dt Boolean, return a data.table (TRUE) or data.frame (FALSE)
#'
#' @return A data set
#' @export
#'
#' @examples gen_data()
gen_data <- function(n=20, dt=TRUE){

  d <- data.table::data.table(
    c1=sample(c('a', 'b'), n, replace=T),
    c2=sample(c('i', 'j', 'k'), n, replace=T),
    c3=sample(c('n', 'o', 'p', 'q'), n, replace=T),
    x1=rnorm(n),
    x2=runif(n),
    x3=rpois(n, 5)
  )
  if (!dt) data.table::setDF(d)
  return(d)
}

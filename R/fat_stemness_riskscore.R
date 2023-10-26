#' @title Calculate Samples BCR_Score with Fatty Acid Metabolism and Stemness gene list
#' @describeIn
#' This function is used to calculate sample BCR_Score
#'     based on fatty acid metabolism and stemness gene list.
#' @param testdata testdata is expression dataframe,
#'     But the rownames are samples names,the colnames are gene names.
#' @param scale_data scale input data
#' @return A BCR_Score of samples
#' @export
#'
#' @examples
#' \donttest{
#' scores <- fat_stemness_BCR_Score(test_input_data)
#' scores
#' }
#'
fat_stemness_BCR_Score <- function(testdata,scale_data=TRUE){
  if(isTRUE(scale_data)){
   input_data <- scale(testdata)
  }else{
   input_data <- testdata
  }
  new_data <- tryCatch(
    {
      input_data[,names(FSBCR_model$coefficients)]
    },
    error = function(e)
    {
      loss_genes <- names(FSBCR_model$coefficients)[!(names(FSBCR_model$coefficients) %in% colnames(input_data))]
      stop(paste0(loss_genes,collapse = ",")," genes are not in your data")
    })
  value <- predict(FSBCR_model,type='lp',as.data.frame(new_data))
  return(value)
}

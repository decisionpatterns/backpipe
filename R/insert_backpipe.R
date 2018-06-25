#' Insert backpipe
#'
#' Call this function to insert `%<-%` at the cursor position.
#' 
#' @details 
#' 
#' Use **Tools > Modify Keyboard Shortcuts** to bind a  ->.;  ->.;  
#'
#' @md 
#' @export

insert_backpipe <- function() {
  if( requireNamespace('rstudioapi', quietly = TRUE ) )
    rstudioapi::insertText(" %<% ")
}

#' Backpipe Shortcut
#'
#' Call this function as an addin to insert `%<-%` at the cursor position.
#' 
#' @details 
#' 
#' Use **Tools > Modify Keyboard Shortcuts** to bind a  ->.;  ->.;  
#'
#' @md 
#' @export

insert_backpipe_addin <- function() {
  if( requireNamespace('rstudioapi', quietly = TRUE ) )
    rstudioapi::insertText(" %<% ")
}

library(callr)

#' 应收单同步
#'
#' @param dms_token 
#' @param FBillNo 
#'
#' @return
#' @export
#'
#' @examples
#' arReceivable_ERPSync()
arReceivable_ERPSync <- function() {
  token_api_erpKdc <- 'CC27EF34-EDCE-44CB-8948-9B42BEF5C3A2'
  
  res <- callr::r(
    func = function(token_api_erpKdc) {
      
      mdl <- tsda::import('pyapikdc.ar.ext.em.receivable')
      
      app <- mdl$ReceivableBill_EM(token = token_api_erpKdc)
      res <- app$SaveAll()
      return(res)
    },
    args = list(
      token_api_erpKdc = token_api_erpKdc
    ),
    
    show = TRUE
  )
  return(res)
}
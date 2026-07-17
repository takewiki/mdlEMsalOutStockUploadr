library(callr)

#' 销售出库同步
#'
#' @param dms_token 
#' @param FBillNo 
#'
#' @return
#' @export
#'
#' @examples
#' outStockMerge_salOutStockSync()
outStockMerge_salOutStockSync <- function() {
  token_api_erpKdc <- 'CC27EF34-EDCE-44CB-8948-9B42BEF5C3A2'
  
  res <- callr::r(
    func = function(token_api_erpKdc) {
      
      mdl <- tsda::import('pyapikdc.sal.ext.em.saleOutStock')
      
      app <- mdl$SaleOutStockBill_EM(token = token_api_erpKdc)
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
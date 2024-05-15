
 /*------------------------------------------------------------------------
    File        : Book
    Purpose		:
    Syntax      : 
    Description :
    Author(s)   : rainr
    Created     : Wed May 15 17:36:58 EEST 2024
    Notes       : 
  ----------------------------------------------------------------------*/
  
  /* ***************************  Definitions  ************************** */
  
  /* ********************  Preprocessor Definitions  ******************** */
  
  /* ***************************  Main Block  *************************** */
  
  /** Dynamically generated schema file **/
   
@openapi.openedge.entity.required (fields="Author,BookLoanId,BookStatus,BookTitle,Genre").
	
DEFINE TEMP-TABLE ttBooks BEFORE-TABLE bttBooks
FIELD BookTitle AS CHARACTER
FIELD Author AS CHARACTER
FIELD Genre AS CHARACTER
FIELD BookLoanId AS INT64 INITIAL "1"
FIELD BookStatus AS CHARACTER
INDEX fk_loan_id IS  PRIMARY   BookLoanId  ASCENDING . 


DEFINE DATASET dsBooks FOR ttBooks.
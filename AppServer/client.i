
 /*------------------------------------------------------------------------
    File        : Client
    Purpose		:
    Syntax      : 
    Description :
    Author(s)   : rainr
    Created     : Wed May 15 17:37:15 EEST 2024
    Notes       : 
  ----------------------------------------------------------------------*/
  
  /* ***************************  Definitions  ************************** */
  
  /* ********************  Preprocessor Definitions  ******************** */
  
  /* ***************************  Main Block  *************************** */
  
  /** Dynamically generated schema file **/
   
@openapi.openedge.entity.required (fields="BookLoanId,Email,Name").
	
DEFINE TEMP-TABLE ttClients BEFORE-TABLE bttClients
FIELD Name AS CHARACTER
FIELD Email AS CHARACTER
FIELD BookLoanId AS INT64 INITIAL "1"
INDEX fk_loan_id IS  PRIMARY   BookLoanId  ASCENDING . 


DEFINE DATASET dsClients FOR ttClients.

 /*------------------------------------------------------------------------
    File        : BookLoan
    Purpose		:
    Syntax      : 
    Description :
    Author(s)   : rainr
    Created     : Wed May 15 19:31:29 EEST 2024
    Notes       : 
  ----------------------------------------------------------------------*/
  
  /* ***************************  Definitions  ************************** */
  
  /* ********************  Preprocessor Definitions  ******************** */
  
  /* ***************************  Main Block  *************************** */
  
  /** Dynamically generated schema file **/
   
@openapi.openedge.entity.required (fields="BookId,ClientId,Deadline").
	
DEFINE TEMP-TABLE ttBookLoans BEFORE-TABLE bttBookLoans
FIELD ClientId AS INTEGER INITIAL "1"
FIELD BookId AS INTEGER INITIAL "1"
FIELD Deadline AS DATE
INDEX fk_book_id  BookId  ASCENDING 
INDEX fk_client_id IS  PRIMARY   ClientId  ASCENDING . 


DEFINE DATASET dsBookLoans FOR ttBookLoans.
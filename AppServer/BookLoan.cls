 
 /*------------------------------------------------------------------------
    File        : BookLoan
    Syntax      : 
    Author(s)   : rainr
    Created     : Wed May 15 19:31:29 EEST 2024
    Notes       : 
  ----------------------------------------------------------------------*/
  
@program FILE(name="BookLoan.cls", module="AppServer").
@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
@progress.service.resource FILE(name="BookLoan", URI="/bookLoan", schemaName="dsBookLoans", schemaFile="back-end/AppServer/bookloan.i").

USING Progress.Lang.*.
USING OpenEdge.BusinessLogic.BusinessEntity.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS BookLoan INHERITS BusinessEntity:
    /*------------------------------------------------------------------------------
            Purpose:                                                                      
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    
    {"bookloan.i"}
    
    DEFINE DATA-SOURCE srcBookLoans FOR libDB.BookLoans.
    
    
    /*------------------------------------------------------------------------------
            Purpose:                                                                      
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC BookLoan():
        
        DEFINE VARIABLE hDataSourceArray AS HANDLE NO-UNDO EXTENT 1.
        DEFINE VARIABLE cSkipListArray AS CHARACTER NO-UNDO EXTENT 1.
        
        SUPER (DATASET dsBookLoans:HANDLE).
        
        /* Data Source for each table in dataset. Should be in table order as defined 
            in DataSet */     
         hDataSourceArray[1] =  DATA-SOURCE srcBookLoans:HANDLE.
         
                  
         /* Skip-list entry for each table in dataset. Should be in temp-table order 
           as defined in DataSet */
        /* Each skip-list entry is a comma-separated list of field names, to be
            ignored in create stmt */
             
         cSkipListArray[1] = "".
         
         
         THIS-OBJECT:ProDataSource = hDataSourceArray.
        THIS-OBJECT:SkipList = cSkipListArray.
                 
    END CONSTRUCTOR.
        
    /*------------------------------------------------------------------------------
            Purpose:  Get one or more records, based on a filter string                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="read", URI="?filter=~{filter~}", alias="", mediaType="application/json"). 
    METHOD PUBLIC VOID ReadBookLoan(
            INPUT filter AS CHARACTER, 
            OUTPUT DATASET dsBookLoans):
        
        SUPER:ReadData(filter).
              
    END METHOD.
      
    /*------------------------------------------------------------------------------
            Purpose: Create one or more new records                                                               
            Notes:                                                                        
    ------------------------------------------------------------------------------*/  
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="create", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID CreateBookLoan(INPUT-OUTPUT DATASET dsBookLoans):            
               
        SUPER:CreateData(DATASET dsBookLoans BY-REFERENCE).        
    END METHOD.    
    
    /*------------------------------------------------------------------------------
            Purpose:  Update one or more records                                                                  
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="update", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID UpdateBookLoan(INPUT-OUTPUT DATASET dsBookLoans):            
    
        SUPER:UpdateData(DATASET dsBookLoans BY-REFERENCE).          
    END METHOD.
    
    /*------------------------------------------------------------------------------
            Purpose:    Delete a record                                                               
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="delete", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID DeleteBookLoan(INPUT-OUTPUT DATASET dsBookLoans):                    
    
        SUPER:DeleteData(DATASET dsBookLoans BY-REFERENCE).
    END METHOD.
    
    DEFINE TEMP-TABLE ttClientLoans NO-UNDO
    FIELD Deadline AS DATE
    FIELD BookTitle AS CHARACTER
    FIELD BookAuthor AS CHARACTER
    FIELD BookGenre AS CHARACTER.

    
    METHOD PUBLIC VOID ReadAllRecordsForClient(
        INPUT clientID AS INTEGER, 
        OUTPUT DATASET dsLentBooks):
        
        FOR EACH BookLoans NO-LOCK WHERE BookLoans.clientId = clientID:
            FIND Books WHERE Books.BookId = BookLoans.BookId NO-LOCK NO-ERROR:
            IF AVAILABLE Books THEN DO:
                CREATE ttClientLoans.
                ASSIGN
                    ttClientLoans.Deadline = BookLoans.Deadline
                    ttClientLoans.BookTitle = Books.BookTitle
                    ttClientLoans.BookAuthor = Books.Author
                    ttClientLoans.BookGenre = Books.Genre.
            END.
        END.
        BUFFER-COPY ttClientLoans TO dsLentBooks.
    END METHOD. 
    
    DEFINE TEMP-TABLE ttAllLoans NO-UNDO
    FIELD ClientName AS CHARACTER
    FIELD Deadline AS DATE
    FIELD BookTitle AS CHARACTER
    FIELD BookAuthor AS CHARACTER
    FIELD BookGenre AS CHARACTER.
    
    METHOD PUBLIC VOID ReadAllRecords(OUTPUT DATASET dsAllLoans):
        FOR EACH BookLoans NO-LOCK:
            FIND Clients WHERE Clients.clientId = BookLoans.ClientId NO-LOCK NO-ERROR.
            FIND Books WHERE Books.BookId = BookLoans.BookId NO-LOCK NO-ERROR.
            IF AVAILABLE Clients AND Books THEN DO:
                CREATE ttAllLoans.
                ASSIGN 
                    ttAllLoans.ClientName = Clients.Name
                    ttAllLoans.Deadline = BookLoans.Deadline
                    ttAllLoans.BookTitle = Books.BookTitle
                    ttAllLoans.BookAuthor = Books.Author
                    ttAllLoans.BookGenre = Books.Genre.
                    
            END.
        END.
        BUFFER-COPY ttAllLoans TO dsAllLoans.
    END METHOD.
            
END CLASS.

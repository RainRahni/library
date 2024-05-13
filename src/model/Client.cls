 
 /*------------------------------------------------------------------------
    File        : Client
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : rainr
    Created     : Mon May 13 14:12:21 EEST 2024
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.


CLASS Client: 
    DEFINE PRIVATE VARIABLE cName AS CHARACTER NO-UNDO.
    DEFINE PRIVATE VARIABLE iAge AS INTEGER NO-UNDO.
    DEFINE PRIVATE VARIABLE cEmail AS CHARACTER NO-UNDO.
    
    METHOD PUBLIC VOID setName(INPUT pcName AS CHARACTER):
        ASSIGN cName = pcName.
    END METHOD.

    METHOD PUBLIC CHARACTER getName():
        RETURN cName.
    END METHOD.

    METHOD PUBLIC VOID setAge(INPUT piAge AS INTEGER):
        ASSIGN iAge = piAge.
    END METHOD.

    METHOD PUBLIC INTEGER getAge():
        RETURN iAge.
    END METHOD.
    
    METHOD PUBLIC VOID setEmail(INPUT pcEmail AS CHARACTER):
        ASSIGN cEmail = pcEmail.
    END METHOD.

    METHOD PUBLIC CHARACTER getEmail():
        RETURN cEmail.
    END METHOD.
    
END CLASS.
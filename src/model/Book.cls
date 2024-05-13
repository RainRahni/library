 
 /*------------------------------------------------------------------------
    File        : Book
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : rainr
    Created     : Mon May 13 15:02:58 EEST 2024
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Book:

    DEFINE PRIVATE VARIABLE cTitle AS CHARACTER NO-UNDO.
    DEFINE PRIVATE VARIABLE cAuthor AS CHARACTER NO-UNDO.
    //DEFINE PRIVATE VARIABLE eGenre AS BookGenre NO-UNDO.

    METHOD PUBLIC VOID setTitle(INPUT pcTitle AS CHARACTER):
        ASSIGN cTitle = pcTitle.
    END METHOD.

    METHOD PUBLIC CHARACTER getTitle():
        RETURN cTitle.
    END METHOD.

    METHOD PUBLIC VOID setAuthor(INPUT pcAuthor AS CHARACTER):
        ASSIGN cAuthor = pcAuthor.
    END METHOD.

    METHOD PUBLIC CHARACTER getAuthor():
        RETURN cAuthor.
    END METHOD.

    /*METHOD PUBLIC VOID setGenre(INPUT peBookGenre AS BookGenre):
        ASSIGN eGenre= peBookGenre.
    END METHOD.

    METHOD PUBLIC BookGenre getGenre():
        RETURN eGenre.
    END METHOD.*/

END CLASS.

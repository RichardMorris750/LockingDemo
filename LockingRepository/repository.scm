 
;  SYNERGY DATA LANGUAGE OUTPUT
;
;  REPOSITORY     : C:\Applications\LockingDemo\LockViewer\Rps\rpsmain.ism
;                 : C:\Applications\LockingDemo\LockViewer\Rps\rpstext.ism
;                 : Version 9.5.2
;
;  GENERATED      : 22-JUN-2018, 11:10:15
;                 : Version 10.3.3e
;  EXPORT OPTIONS : [ALL] 
 
 
Structure LOCKS   DBL ISAM
   Description "Record to store current record lock info"
 
Field GUID   Type ALPHA   Size 50
   Description "generated unique id"
 
Field PROCESS_ID   Type INTEGER   Size 4
   Description "process id"
 
Field TIMESTAMP   Type ALPHA   Size 20
   Description "time stamp for key"
 
Field FILE_OPERATION   Type ALPHA   Size 10
 
Field RECORD_KEY   Type ALPHA   Size 50
 
Field FILE_NAME   Type ALPHA   Size 255
   Description "file name"
 
Field LOCK_STATUS   Type BOOLEAN   Size 4
   Description "TRUE is locked, FALSE not locked anymore"
 
Field LOCK_DATE   Type DATE   Size 8   Stored YYYYMMDD
   Description "date the lock happened"
 
Field LOCK_TIME   Type TIME   Size 6   Stored HHMMSS
   Description "time the lock/unlock happened"
 
Field USERNAME   Type ALPHA   Size 30
 
Field MODULE   Type ALPHA   Size 63
   Description "module name"
 
Key UNIQUE_GUID   ACCESS   Order ASCENDING   Dups NO
   Description "unique id for record"
   Segment FIELD   GUID
 
Structure LOCKS_OPTIONS   USER DEFINED
   Description "lock viewer options"
 
Field REFRESH_RATE   Type DECIMAL   Size 6
   Description "refresh rate"
 
Key DUMMY   ACCESS   Order ASCENDING   Dups NO
   Segment FIELD   REFRESH_RATE
 
Structure LOCKS_TRACEBACK   DBL ISAM
   Description "program traceback of currentlocks"
 
Field GUID   Type ALPHA   Size 50
   Description "unique ID"
 
Field LINE_NUMBER   Type DECIMAL   Size 4
   Description "line number"
 
Field ROUTINE_LINE_NUMBER   Type DECIMAL   Size 4
   Description "routine line number"
 
Field ROUTINE   Type ALPHA   Size 32
   Description "routine name"
 
Field SPARE   Type ALPHA   Size 10
 
Key GUID_AND_LINE   ACCESS   Order ASCENDING   Dups NO
   Description "GUID and line number"
   Segment FIELD   GUID
   Segment FIELD   LINE_NUMBER
 

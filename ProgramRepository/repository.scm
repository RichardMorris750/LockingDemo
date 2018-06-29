 
;  SYNERGY DATA LANGUAGE OUTPUT
;
;  REPOSITORY     : C:\Development\SymphonyExamples\ExampleRepository\bin\Debug\
;                 : C:\Development\SymphonyExamples\ExampleRepository\bin\Debug\
;                 : Version 10.3.3c
;
;  GENERATED      : 22-JUN-2018, 11:37:43
;                 : Version 10.3.3e
;  EXPORT OPTIONS : [ALL] 
 
 
Structure GROUP   DBL ISAM
   Description "product group master details"
 
Field GROUP_ID   Type ALPHA   Size 20
   Description "group id"
   Prompt "Group ID"
   Uppercase
   Required
 
Field DESCRIPTION   Type ALPHA   Size 100
   Description "description"
   Prompt "Description"
   Required
 
Key GROUP_ID   ACCESS   Order ASCENDING   Dups NO
   Description "primary access key"
   Segment FIELD   GROUP_ID
 
Structure ORDER_HEADER   DBL ISAM
   Description "ORDER HEADER DETAILS"
 
Field ORDER_NUMBER   Type DECIMAL   Size 6
   Description "ORDER NUMBER"
   ODBC Name ORDERNUMBER
 
Field SUPPLIERID   Type ALPHA   Size 20
   Prompt "Supplier ID"
 
Field CUST_REF   Type ALPHA   Size 20
   Description "customer reference"
   ODBC Name CUSTOMERREFERENCE
 
Field DEL_DATE   Type DATE   Size 8   Stored YYYYMMDD
   Description "Delicare date"
   ODBC Name DELIVERYDATE
 
Field ITEMS   Type DECIMAL   Size 2
   Description "number of line items"
   ODBC Name ITEMCOUNT
 
Field SPARE   Type ALPHA   Size 44
 
Key ORDER_NUMBER   ACCESS   Order ASCENDING   Dups NO
   Description "order number"
   Segment FIELD   ORDER_NUMBER
 
Key SUPPLIER   ACCESS   Order ASCENDING   Dups NO
   Description "supllier access key"
   Segment FIELD   SUPPLIERID
   Segment FIELD   ORDER_NUMBER
 
Structure ORDER_LINE   DBL ISAM
   Description "order line items"
 
Field ORDER_NUMBER   Type DECIMAL   Size 6
   Description "order number"
   ODBC Name ORDERNUMBER
 
Field LINE_ITEM   Type DECIMAL   Size 2
   Description "line item number"
   ODBC Name LINE
 
Field PART_ID   Type ALPHA   Size 20
   Description "part ID"
   ODBC Name PARTID
 
Field QUANTITY   Type DECIMAL   Size 4
   Description "order quantity"
   ODBC Name ORDERQUANTITY
 
Field SPARE   Type ALPHA   Size 68
 
Key ORDER_ITEM   ACCESS   Order ASCENDING   Dups NO
   Description "order and line item"
   Segment FIELD   ORDER_NUMBER
   Segment FIELD   LINE_ITEM
 
Key PRODUCT   ACCESS   Order ASCENDING   Dups NO
   Description "product access key"
   Segment FIELD   PART_ID
   Segment FIELD   ORDER_NUMBER
   Segment FIELD   LINE_ITEM
 
Structure ORDER_LIST   USER DEFINED
   Description "order list details"
 
Field ORDER_NUMBER   Type DECIMAL   Size 6
   Description "order number"
   ODBC Name ORDERNUMBER
 
Field ORDER_DATE   Type DATE   Size 8   Stored YYYYMMDD
   Description "date of the order"
   ODBC Name ORDERDATE
 
Field CUSTOMER_REF   Type ALPHA   Size 20
   Description "customer reference"
   ODBC Name CUSTOMERREFERENCE
 
Field ORDER_VALUE   Type DECIMAL   Size 10   Precision 2
   Description "value of the order"
   ODBC Name ORDERVALUE
 
Field ORDER_ITEMS   Type DECIMAL   Size 2
   Description "number of items on the order"
 
Structure PART   DBL ISAM
   Description "Part structure"
 
Field ID   Type ALPHA   Size 20
   Description "part ID"
   Long Description
      "<SYMPHONY_UPDATE_TRIGGER=PropertyChanged>"
   Prompt "Part ID"
   Uppercase
   Break Always   Required
 
Field GROUPID   Type ALPHA   Size 20
   Description "Group ID"
   Long Description
      "<SYMPHONY_UPDATE_TRIGGER=PropertyChanged>"
   Prompt "Group ID"
   Uppercase
   Required
   Drill Method "Drill_Group_Id"   Change Method "Change_Group_Id"
 
Field SUPPLIERID   Type ALPHA   Size 20
   Description "supplier id"
   Long Description
      "<SYMPHONY_UPDATE_TRIGGER=PropertyChanged>"
   Prompt "Supplier ID"
   Uppercase
   Required
   Drill Method "Drill_Supplier_Id"   Change Method "Change_Supplier_Id"
 
Field DESCRIPTION   Type ALPHA   Size 50
   Description "Description"
   Long Description
      "<SYMPHONY_UPDATE_TRIGGER=PropertyChanged>"
   Prompt "Description"
   Required
 
Field TECHNICAL_INFO   Type ALPHA   Size 500
   Description "Technical info"
   Long Description
      "<SYMPHONY_UPDATE_TRIGGER=PropertyChanged>"
   Prompt "Technical Description"
 
Field TECHNICAL_INFO_ARRAY   Type ALPHA   Size 50   Dimension 10
   Overlay TECHNICAL_INFO:0   Script Noview
   Description "description array"
 
Field QUANTITY   Type INTEGER   Size 4
   Description "quantity in stock"
   Long Description
      "<SYMPHONY_UPDATE_TRIGGER=PropertyChanged>"
   Prompt "Quantity"
 
Field COST_PRICE   Type DECIMAL   Size 10   Precision 2
   Description "cost price"
   Long Description
      "<SYMPHONY_UPDATE_TRIGGER=PropertyChanged>"
   Prompt "Cost price"
 
Field PART_STATUS   Type DECIMAL   Size 1
   Description "Status of the product"
   Prompt "Status"
   Selection List 0 0 0  Entries "Live", "Replaced", "Obsolete"
   Enumerated 8 0 1
 
Field SPARE   Type ALPHA   Size 75   Language Noview   Script Noview
   Report Noview   Web Noview
 
Key ID   ACCESS   Order ASCENDING   Dups NO
   Description "primary part id"
   Segment FIELD   ID
 
Key GROUP_ID   ACCESS   Order ASCENDING   Dups YES   Modifiable YES
   Description "group reference"
   Segment FIELD   GROUPID
 
Key SUPPLIER_ID   ACCESS   Order ASCENDING   Dups YES
   Description "supplier reference"
   Segment FIELD   SUPPLIERID
 
Relation  1   PART GROUP_ID   GROUP GROUP_ID
 
Relation  2   PART SUPPLIER_ID   SUPPLIER SUPPLIER_ID
 
Structure SUPPLIER   DBL ISAM
   Description "Supplier details"
 
Field SUPPLIER_ID   Type ALPHA   Size 20
   Description "supplier id"
   Prompt "Supplier ID"
   Uppercase
   Required
 
Field NAME   Type ALPHA   Size 50
   Description "supplier name"
   Prompt "Name"
   Required
 
Field ADDRESS_1   Type ALPHA   Size 50
   Description "addrss line 1"
   Prompt "Address"
   Required
 
Field ADDRESS_2   Type ALPHA   Size 50
   Description "address line 2"
 
Field ADDRESS_3   Type ALPHA   Size 50
   Description "address line 3"
 
Field CITY   Type ALPHA   Size 30
   Description "city"
   Prompt "City"
   Required
 
Field POSTAL_CODE   Type ALPHA   Size 10
   Description "post code"
   Prompt "Postal/Zip code"
   Uppercase
   Required
 
Field WEB_ADDRESS   Type ALPHA   Size 78
   Description "web address"
   Prompt "Web site"
 
Field SPARE   Type ALPHA   Size 62   Language Noview   Script Noview
   Description "spare"
 
Key SUPPLIER_ID   ACCESS   Order ASCENDING   Dups NO
   Description "primary access key"
   Segment FIELD   SUPPLIER_ID
 
File GROUP   DBL ISAM   "SYMPHONYDATA:groups.ism"
   Description "Product groups"
   Assign GROUP   ODBC Name GROUP
 
File ORDER_HEADER   DBL ISAM   "SYMPHONYDATA:orders.ism"
   Description "order header file"
   Assign ORDER_HEADER
 
File ORDER_LINE   DBL ISAM   "SYMPHONYDATA:lines.ism"
   Description "order line file"
   Assign ORDER_LINE
 
File PART   DBL ISAM   "SYMPHONYDATA:parts.ism"
   Description "Part master file"
   Assign PART   ODBC Name PART
 
File SUPPLIER   DBL ISAM   "SYMPHONYDATA:suppliers.ism"
   Description "Suppliers"
   Assign SUPPLIER   ODBC Name SUPPLIER
 

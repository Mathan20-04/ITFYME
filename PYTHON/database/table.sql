/**
 * Author:  Nikesh
 * Created: May 12, 2017
 */


DROP TABLE IF EXISTS _WHStock;
CREATE TABLE _WHStock
(
  Stock_ID         INT AUTO_INCREMENT
    PRIMARY KEY,
  WH_ID            INT                           NULL,
  Category_ID      INT                           NOT NULL,
  Updated_Date     DATE                          NULL,
  Opening_Quantity DECIMAL(10, 2) DEFAULT '0.00' NULL,
  Closing_Quantity DECIMAL(10, 2) DEFAULT '0.00' NULL,
  Inward_Quantity  DECIMAL(10, 2) DEFAULT '0.00' NULL,
  Outward_Quantity DECIMAL(10, 2) DEFAULT '0.00' NULL
);

DROP TABLE IF EXISTS _WHStockTotal;
CREATE TABLE _WHStockTotal
(
  _ID              INT AUTO_INCREMENT
    PRIMARY KEY,
  WH_ID            INT                           NOT NULL,
  Category_ID      INT                           NOT NULL,
  Opening_Date     DATE                          NULL,
  Opening_Quantity DECIMAL(10, 2) DEFAULT '0.00' NULL,
  Closing_Date     DATE                          NULL,
  Closing_Quantity DECIMAL(10, 2) DEFAULT '0.00' NULL
);

DROP TABLE IF EXISTS _tFinancialYear;
CREATE TABLE _tFinancialYear
(
  _id  INT AUTO_INCREMENT
    PRIMARY KEY,
  year INT NULL
);

DROP TABLE IF EXISTS _tReport;
CREATE TABLE _tReport
(
  Report_ID        INT AUTO_INCREMENT
    PRIMARY KEY,
  Name             VARCHAR(100)       NULL,
  IsMenu           INT                NULL,
  SP_Name          VARCHAR(100)       NULL,
  Params           VARCHAR(1024)      NULL,
  Filler_XML       TEXT               NULL,
  Activities       BIGINT             NULL,
  SortOrder        INT                NULL,
  FileName         VARCHAR(100)       NULL,
  IsDelete         INT(1) DEFAULT '0' NULL,
  Parent_Report_ID INT DEFAULT '0'    NULL
);

DROP TABLE IF EXISTS _tReportHierarchy;
CREATE TABLE _tReportHierarchy
(
  Report_ID  INT NULL,
  Left_Node  INT NULL,
  Right_Node INT NULL
);

DROP TABLE IF EXISTS _tempReport;
CREATE TABLE _tempReport
(
  Report_ID        INT AUTO_INCREMENT
    PRIMARY KEY,
  Name             VARCHAR(100)       NULL,
  IsMenu           INT                NULL,
  SP_Name          VARCHAR(100)       NULL,
  Params           VARCHAR(1024)      NULL,
  Filler_XML       TEXT               NULL,
  Activities       BIGINT             NULL,
  SortOrder        INT                NULL,
  FileName         VARCHAR(100)       NULL,
  IsDelete         INT(1) DEFAULT '0' NULL,
  Parent_Report_ID INT DEFAULT '0'    NULL
);

DROP TABLE IF EXISTS tActivity;
CREATE TABLE tActivity
(
  Activity_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Exercise_ID INT           NOT NULL,
  Activity    VARCHAR(1024) NULL
);

DROP TABLE IF EXISTS tAdminMenu;
CREATE TABLE tAdminMenu
(
  Menu_ID              INT AUTO_INCREMENT
    PRIMARY KEY,
  Menu_Name            VARCHAR(128) NOT NULL,
  ObjectSP             TEXT         NULL,
  Menu_Filter_Elements TEXT         NULL,
  Menu_Filter_Params   TEXT         NULL,
  Sort_Order           INT          NULL,
  State_Name           VARCHAR(128) NULL,
  IsEnabled            INT          NULL
);

DROP TABLE IF EXISTS tAttachmentDetail;
CREATE TABLE tAttachmentDetail
(
  Attachment_ID      INT           NULL,
  File_Name          TEXT          NULL,
  File_Original_Name TEXT          NULL,
  File_Title         TEXT          NULL,
  File_Link          TEXT          NULL,
  File_Type          VARCHAR(64)   NOT NULL,
  File_Size          INT           NULL,
  Latitude_Longitude VARCHAR(1024) NULL
);

DROP TABLE IF EXISTS tAttachmentDetail;
CREATE TABLE tAttachmentHeader
(
  Attachment_ID  INT AUTO_INCREMENT
    PRIMARY KEY,
  Object_Type    VARCHAR(64) NOT NULL,
  Transaction_ID INT         NOT NULL
);

DROP TABLE IF EXISTS tAwarnessProgram;
CREATE TABLE tAwarnessProgram
(
  Awarness_ID        INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_By         INT                                NULL,
  Created_On         DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Title              TEXT                               NULL,
  Description        TEXT                               NULL,
  Awarness_Type      VARCHAR(64)                        NULL,
  URL                TEXT                               NULL,
  Is_Paid            INT DEFAULT '0'                    NULL,
  Is_POC             INT DEFAULT '0'                    NULL,
  Collected_Waste    FLOAT DEFAULT '0'                  NULL,
  Num_People_Engaged INT DEFAULT '0'                    NULL,
  Num_People_Reached INT DEFAULT '0'                    NULL,
  Program_From       DATETIME                           NULL,
  Program_To         DATETIME                           NULL,
  Is_Self            INT DEFAULT '1'                    NULL
);

DROP TABLE IF EXISTS tAwarnessProgramEntities;
CREATE TABLE tAwarnessProgramEntities
(
  Awarness_ID INT           NOT NULL,
  Entity_ID   INT           NULL,
  Entity_Name VARCHAR(1024) NULL
);

DROP TABLE IF EXISTS tAwarnessProgramPartners;
CREATE TABLE tAwarnessProgramPartners
(
  Awarness_ID INT NOT NULL,
  Partner_ID  INT NOT NULL
);

DROP TABLE IF EXISTS tAwarnessProgramReach;
CREATE TABLE tAwarnessProgramReach
(
  Awarness_ID  INT  NOT NULL,
  State_ID     INT  NULL,
  City_ID      INT  NULL,
  Place_Detail TEXT NULL
);

DROP TABLE IF EXISTS tBank;
CREATE TABLE tBank
(
  Bank_ID         INT AUTO_INCREMENT
    PRIMARY KEY,
  Bank_Name       VARCHAR(1024)                      NOT NULL,
  Created_On      DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By      INT                                NULL,
  Last_Updated_On DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By INT                                NULL
);

DROP TABLE IF EXISTS tBillSequence;
CREATE TABLE tBillSequence
(
  id INT AUTO_INCREMENT
    PRIMARY KEY
);

DROP TABLE IF EXISTS tCalendarEvent;
CREATE TABLE tCalendarEvent
(
  Event_ID            INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_Date        DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By          INT                                NULL,
  Event_Date          DATE                               NULL,
  Start_Time          TIME                               NULL,
  End_Time            TIME                               NULL,
  Title               TEXT                               NULL,
  Description         TEXT                               NULL,
  URL                 TEXT                               NULL,
  Place               TEXT                               NULL,
  Lattitude_Longitude VARCHAR(1024)                      NULL,
  Last_Updated_On     DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  State_ID            INT                                NULL,
  City_ID             INT                                NULL,
  Event_Type          VARCHAR(64)                        NULL,
  Last_Updated_By     INT                                NULL
);

DROP TABLE IF EXISTS tCalendarEventAttendanceHeader;
CREATE TABLE tCalendarEventAttendanceHeader
(
  Attendance_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_On    DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Event_ID      INT                                NOT NULL
);

DROP TABLE IF EXISTS tCalendarEventAttendanceDetail;
CREATE TABLE tCalendarEventAttendanceDetail
(
  Attendance_ID   INT             NULL,
  Entity_ID       INT             NULL,
  User_ID         INT             NULL,
  Attendance_Type INT DEFAULT '1' NULL
  COMMENT '1 - Attending, 2 - Not Attending, 3 - May Be'
);


DROP TABLE IF EXISTS tCalendarEventEntity;
CREATE TABLE tCalendarEventEntity
(
  Event_ID    INT           NOT NULL,
  Entity_Type VARCHAR(1024) NOT NULL
);

DROP TABLE IF EXISTS tCart;
CREATE TABLE tCart
(
  Cart_ID          INT AUTO_INCREMENT
    PRIMARY KEY,
  User_ID          INT                                NOT NULL,
  Entity_ID        INT                                NOT NULL,
  Cart_Date        DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Status           VARCHAR(64)                        NULL,
  Session_User_ID  INT                                NULL,
  Last_Updated_On  DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By  INT                                NULL,
  Transaction_Date DATETIME DEFAULT CURRENT_TIMESTAMP NULL
);

DROP TABLE IF EXISTS tCartItem;
CREATE TABLE tCartItem
(
  Cart_Item_ID          INT AUTO_INCREMENT
    PRIMARY KEY,
  Cart_ID               INT                                NOT NULL,
  User_ID               INT                                NOT NULL,
  Added_On              DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Category_ID           INT                                NOT NULL,
  Quantity              DECIMAL(10, 2)                     NULL,
  Original_Price        DECIMAL(10, 2)                     NULL,
  Given_Price           DECIMAL(10, 2)                     NULL,
  Seller_Bid_Price      DECIMAL(10, 2) DEFAULT '0.00'      NULL,
  Inspected_Quantity    DECIMAL(10, 2)                     NULL,
  Suggested_Price       DECIMAL(10, 2)                     NULL,
  Actual_Price          DECIMAL(10, 2)                     NULL,
  Barcode               VARCHAR(4028)                      NULL,
  Recycler_Quantity     DECIMAL(10, 2)                     NULL,
  Seller_GST            FLOAT DEFAULT '0'                  NULL,
  Recycler_GST          FLOAT DEFAULT '0'                  NULL,
  Seller_GST_Percentage DECIMAL(10, 2) DEFAULT '0.00'      NULL,
  Negotiated_Price      DECIMAL(10, 2)                     NULL,
  Negotiated_GST        DECIMAL(10, 2)                     NULL,
  Description           TEXT                               NULL,
  Last_Updated_On       DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By       INT                                NULL,
  Returned_Quantity FLOAT DEFAULT 0,
  CONSTRAINT tCartItem_ibfk_1
  FOREIGN KEY (Cart_ID) REFERENCES tCart (Cart_ID)
);

DROP TABLE IF EXISTS tCartItemQuantity;
CREATE TABLE tCartItemQuantity
(
  Cart_Item_ID INT           NOT NULL,
  Quantity     DECIMAL(5, 2) NOT NULL,
  Barcode      VARCHAR(4028) NULL,
  CONSTRAINT tCartItemQuantity_ibfk_1
  FOREIGN KEY (Cart_Item_ID) REFERENCES tCartItem (Cart_Item_ID)
);

DROP TABLE IF EXISTS tCartTrack;
CREATE TABLE tCartTrack
(
  Cart_ID     INT                                NULL,
  Status      VARCHAR(64)                        NULL,
  Status_Date DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  User_ID     INT                                NULL
);

DROP TABLE IF EXISTS tCategory;
CREATE TABLE tCategory
(
  Category_ID          INT AUTO_INCREMENT
    PRIMARY KEY,
  Category_Code        VARCHAR(64)                        NULL,
  Category_Name        VARCHAR(1024)                      NOT NULL,
  Display_Name         VARCHAR(1024)                      DEFAULT NULL,
  Parent_Category_ID   INT                                NULL,
  UOM_ID               INT                                NULL,
  Price                DECIMAL(10, 2)                     NULL,
  Category_Image_Web   VARCHAR(1024)                      NULL,
  Category_Image_Phone VARCHAR(1024)                      NULL,
  Is_Delete            INT DEFAULT '0'                    NULL,
  Created_On           DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By           INT                                NULL,
  Last_Updated_On      DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By      INT                                NULL
);

DROP TABLE IF EXISTS tCity;
CREATE TABLE tCity
(
  City_ID            INT AUTO_INCREMENT
    PRIMARY KEY,
  State_ID           INT                                NOT NULL,
  City_Name          VARCHAR(264)                       NOT NULL,
  Is_Operative       INT DEFAULT '0'                    NULL,
  Latitude_Longitude VARCHAR(1024)                      NULL,
  Created_On         DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By         INT                                NULL,
  Last_Updated_On    DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By    INT                                NULL
);

DROP TABLE IF EXISTS tCollectionPointTemp;
CREATE TABLE tCollectionPointTemp
(
  _ID                   INT AUTO_INCREMENT
    PRIMARY KEY,
  Collection_Point_Name VARCHAR(1024)   NULL,
  User_Name             VARCHAR(1024)   NULL,
  Address1              VARCHAR(4086)   NULL,
  Address2              VARCHAR(4086)   NULL,
  Address3              VARCHAR(4086)   NULL,
  Pincode               VARCHAR(64)     NULL,
  Mobile_Number         TEXT            NULL,
  State_ID              INT             NULL,
  City_ID               INT             NULL,
  Latitude_Longitude    VARCHAR(1024)   NULL,
  Is_Delete             INT DEFAULT '0' NULL
);

DROP TABLE IF EXISTS tCompanyDetail;
CREATE TABLE tCompanyDetail
(
  Company_Name         VARCHAR(1024) NULL,
  Company_Logo         VARCHAR(1024) NULL,
  About_Company        TEXT          NULL,
  Privacy_Policy       TEXT          NULL,
  Terms_And_Conditions TEXT          NULL,
  Address1             TEXT          NULL,
  Address2             TEXT          NULL,
  Address3             TEXT          NULL,
  Pincode              BIGINT        NULL,
  Phone                VARCHAR(1024) NULL,
  Email                VARCHAR(1024) NULL,
  Fax                  VARCHAR(1024) NULL,
  Website              VARCHAR(1024) NULL,
  Android_Link         VARCHAR(1024) NULL,
  iOS_Link             VARCHAR(1024) NULL
);

DROP TABLE IF EXISTS tConfig;
CREATE TABLE tConfig
(
  Config_Item      VARCHAR(1024) NULL,
  Configured_Value TEXT          NULL
);

DROP TABLE IF EXISTS tDispatch;
CREATE TABLE tDispatch
(
  Dispatch_ID   INT AUTO_INCREMENT
    PRIMARY KEY,
  Dispatched_On DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Logistic_ID   INT                                NULL,
  Created_By    INT                                NULL,
  Truck_Number  VARCHAR(1024)                      NULL,
  Driver_Name   VARCHAR(1024)                      NULL,
  Diver_Number  BIGINT                             NULL,
  Comments      TEXT                               NULL,
  Transportation_Number VARCHAR(1024) DEFAULT NULL
);

DROP TABLE IF EXISTS tDispatchDraft;
CREATE TABLE tDispatchDraft
(
  Draft_Dispatch_ID   INT AUTO_INCREMENT
    PRIMARY KEY,
  Draft_Dispatched_On DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Logistic_ID         INT                                NULL,
  Created_By          INT                                NULL,
  Truck_Number        VARCHAR(1024)                      NULL,
  Driver_Name         VARCHAR(1024)                      NULL,
  Diver_Number        BIGINT                             NULL,
  Transportation_Number VARCHAR(1024) DEFAULT NULL
);

DROP TABLE IF EXISTS tDocumentRequirement;
CREATE TABLE tDocumentRequirement
(
  Document_ID     INT                                NOT NULL,
  Entity_Type     VARCHAR(64)                        NULL,
  Is_Required     INT DEFAULT '0'                    NULL,
  Created_On      DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By      INT                                NULL,
  Last_Updated_On DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By INT                                NULL
);

DROP TABLE IF EXISTS tDocuments;
CREATE TABLE tDocuments
(
  Document_ID     INT AUTO_INCREMENT
    PRIMARY KEY,
  Document_Name   VARCHAR(264)                       NOT NULL,
  Help_Text       VARCHAR(1028)                      NULL,
  Created_On      DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By      INT                                NULL,
  Last_Updated_On DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By INT                                NULL
);

DROP TABLE IF EXISTS tEmailId;
CREATE TABLE tEmailId
(
  ID       INT AUTO_INCREMENT
    PRIMARY KEY,
  Email_ID VARCHAR(1024) NOT NULL
);

DROP TABLE IF EXISTS tEmailReport;
CREATE TABLE tEmailReport
(
  Email_Report_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Report_Name     VARCHAR(1024)              NULL,
  SP_Name         VARCHAR(1024)              NULL,
  Is_Enabled      INT DEFAULT '1'            NULL,
  Type            VARCHAR(64) DEFAULT 'HTML' NULL,
  XSLT_File_Name  VARCHAR(1024)              NULL
);

DROP TABLE IF EXISTS tEmailReportRecipients;
CREATE TABLE tEmailReportRecipients
(
  Email_Report_ID INT NULL,
  Email_ID        INT NULL
);

DROP TABLE IF EXISTS tEntity;
CREATE TABLE tEntity
(
  Entity_ID            INT           AUTO_INCREMENT
    PRIMARY KEY,
  Entity_Name          VARCHAR(1024)                                  NOT NULL,
  Display_Name         VARCHAR(1024) DEFAULT NULL,
  Entity_Type          VARCHAR(64)                                    NOT NULL,
  Address1             VARCHAR(4028)                                  NULL,
  Address2             VARCHAR(4028)                                  NULL,
  Address3             VARCHAR(4028)                                  NULL,
  State_ID             INT                                            NULL,
  City_ID              INT                                            NULL,
  Pincode              INT                                            NULL,
  Mobile_Number        VARCHAR(1024)                                  NULL,
  Landline_Number      BIGINT                                         NULL,
  Email                VARCHAR(1024)                                  NULL,
  Photo                VARCHAR(1024)                                  NULL,
  Managed_By           INT                                            NULL,
  Parent_Entity_ID     INT                                            NULL,
  Created_By           INT                                            NULL,
  Created_On           DATETIME DEFAULT CURRENT_TIMESTAMP             NULL,
  Currently_Managed_By INT                                            NULL,
  Is_Delete            INT(1) DEFAULT '0'                             NULL,
  Enrollment_Status    VARCHAR(64) DEFAULT 'ENROLLNOTSUBMITTED'       NULL,
  Entity_Status        ENUM ('ACTIVE', 'DEACTIVE') DEFAULT 'DEACTIVE' NULL,
  Latitude_Longitude   VARCHAR(1024)                                  NULL,
  Signature            VARCHAR(1024)                                  NULL,
  GST_No               VARCHAR(264)                                   DEFAULT NULL,
  Ship_Address1        VARCHAR(1024)                                  DEFAULT NULL,
  Ship_Address2        VARCHAR(1024)                                  DEFAULT NULL,
  Ship_Address3        VARCHAR(1024)                                  DEFAULT NULL,
  Ship_Pincode         INT                                            DEFAULT NULL,
  Ship_State_ID        INT                                            DEFAULT NULL,
  Ship_City_ID         INT                                            DEFAULT NULL,
  Is_System            INT DEFAULT '0'                                NULL,
  Last_Updated_On      DATETIME DEFAULT CURRENT_TIMESTAMP             NULL,
  Last_Updated_By      INT                                            NULL
);

DROP TABLE IF EXISTS tEntityBankDetails;
CREATE TABLE tEntityBankDetails
(
  Entity_ID           INT                                           NOT NULL,
  Bank_ID             INT                                           NOT NULL,
  Account_Number      VARCHAR(64)                                   NULL,
  Account_Type        ENUM ('SAVINGS', 'CURRENT') DEFAULT 'SAVINGS' NULL,
  IFSC_Code           VARCHAR(64)                                   NULL,
  Photo               VARCHAR(104)                                  NULL,
  Account_Holder_Name VARCHAR(1024)                                 NULL,
  Created_On          DATETIME DEFAULT CURRENT_TIMESTAMP            NULL,
  Created_By          INT                                           NULL,
  Last_Updated_On     DATETIME DEFAULT CURRENT_TIMESTAMP            NULL,
  Last_Updated_By     INT                                           NULL,
  CONSTRAINT tEntityBankDetails_ibfk_1
  FOREIGN KEY (Entity_ID) REFERENCES tEntity (Entity_ID),
  CONSTRAINT tEntityBankDetails_ibfk_2
  FOREIGN KEY (Bank_ID) REFERENCES tBank (Bank_ID)
);

DROP TABLE IF EXISTS tEntityDocumentDetail;
CREATE TABLE tEntityDocumentDetail
(
  Entity_Document_ID INT                                NULL,
  File_Name          VARCHAR(1024)                      NULL,
  File_Original_Name VARCHAR(1024)                      NULL,
  Created_On         DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By         INT                                NULL,
  Last_Updated_On    DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By    INT                                NULL
);

DROP TABLE IF EXISTS tEntityDocumentHeader;
CREATE TABLE tEntityDocumentHeader
(
  Entity_Document_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Entity_ID          INT           NULL,
  Document_ID        INT           NULL,
  Document_Number    VARCHAR(1024) NULL,
  CONSTRAINT tEntityDocumentHeader_ibfk_2
  FOREIGN KEY (Entity_ID) REFERENCES tEntity (Entity_ID),
  CONSTRAINT tEntityDocumentHeader_ibfk_1
  FOREIGN KEY (Document_ID) REFERENCES tDocuments (Document_ID)
);

DROP TABLE IF EXISTS tExercise;
CREATE TABLE tExercise
(
  Exercise_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Exercise    VARCHAR(1024) NULL
);

DROP TABLE IF EXISTS tFileDetail;
CREATE TABLE tFileDetail
(
  File_ID            INT AUTO_INCREMENT
    PRIMARY KEY,
  Header_ID          INT         NOT NULL,
  File_Name          TEXT        NULL,
  File_Original_Name TEXT        NULL,
  File_Type          VARCHAR(64) NULL,
  File_Size          BIGINT      NULL,
  File_Link          TEXT        NULL
);

DROP TABLE IF EXISTS tFileDraft;
CREATE TABLE tFileDraft
(
  Draft_ID           INT AUTO_INCREMENT
    PRIMARY KEY,
  Transaction_ID     INT                                NULL,
  Transaction_Type   VARCHAR(1024)                      NULL,
  Object             VARCHAR(1024)                      NULL,
  Created_By         INT                                NULL,
  Created_On         DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Context            TEXT                               NULL,
  File_Name          TEXT                               NULL,
  File_Original_Name TEXT                               NULL,
  File_Type          VARCHAR(64)                        NULL,
  File_Size          BIGINT                             NULL,
  File_Link          TEXT                               NULL
);

DROP TABLE IF EXISTS tFileHeader;
CREATE TABLE tFileHeader
(
  _ID              INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_By       INT                                NULL,
  Created_On       DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_On  DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Transaction_ID   INT                                NOT NULL,
  Transaction_Type VARCHAR(1024)                      NOT NULL,
  Object           VARCHAR(1024)                      NOT NULL,
  Context          TEXT                               NULL
);

DROP TABLE IF EXISTS tGiftItem;
CREATE TABLE tGiftItem
(
  Gift_Item_ID     INT AUTO_INCREMENT
    PRIMARY KEY,
  Gift_Name        VARCHAR(64)                        NOT NULL,
  UOM_ID           INT                                NULL,
  Indicative_Price DECIMAL(10, 1)                     NULL,
  Is_Delete        INT DEFAULT '0'                    NULL,
  Quantity         DECIMAL(10, 2) DEFAULT '0.00'      NULL,
  Created_On       DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By       INT                                NULL,
  Last_Updated_On  DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By  INT                                NULL
);

DROP TABLE IF EXISTS tGiftItemLedger;
CREATE TABLE tGiftItemLedger
(
  _ID              INT AUTO_INCREMENT
    PRIMARY KEY,
  Gift_Item_ID     INT                                NULL,
  Updated_Date     DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Quantity         DECIMAL(10, 2)                     NULL,
  Opening_Quantity DECIMAL(10, 2)                     NULL,
  Closing_Quantity DECIMAL(10, 2)                     NULL,
  Type             ENUM ('CREDIT', 'DEBIT')           NULL,
  Remarks          TEXT                               NULL
);

DROP TABLE IF EXISTS tGiftItemLedgerTotal;
CREATE TABLE tGiftItemLedgerTotal
(
  _ID          INT AUTO_INCREMENT
    PRIMARY KEY,
  Gift_Item_ID INT            NULL,
  Opening_Date DATE           NULL,
  Closing_Date DATE           NULL,
  Quantity     DECIMAL(10, 2) NULL
);

DROP TABLE IF EXISTS tHierarchy;
CREATE TABLE tHierarchy
(
  _ID               INT AUTO_INCREMENT
    PRIMARY KEY,
  User_Or_Entity_ID INT                     NULL,
  Type              ENUM ('USER', 'ENTITY') NULL,
  Left_Node         INT                     NULL,
  Right_Node        INT                     NULL
);


DROP TABLE IF EXISTS tHierarchyTemp;
CREATE TABLE tHierarchyTemp
(
  _ID               INT AUTO_INCREMENT
    PRIMARY KEY,
  User_Or_Entity_ID INT                     NULL,
  Type              ENUM ('USER', 'ENTITY') NULL,
  Left_Node         INT                     NULL,
  Right_Node        INT                     NULL
);


DROP TABLE IF EXISTS tInvoiceDetail;
CREATE TABLE tInvoiceDetail
(
  Invoice_ID       INT               NOT NULL,
  Category_ID      INT               NOT NULL,
  Quantity         FLOAT             NULL,
  Rate             FLOAT             NULL,
  GST              FLOAT             NULL,
  Producer_ID      INT               NULL,
  Advised_Quantity FLOAT DEFAULT '0' NULL,
  Returned_Quantity FLOAT DEFAULT 0
);


DROP TABLE IF EXISTS tInvoiceDraftDetail;
;
CREATE TABLE tInvoiceDraftDetail
(
  Draft_Invoice_ID INT   NOT NULL,
  Category_ID      INT   NOT NULL,
  Quantity         FLOAT NULL,
  Rate             FLOAT NULL,
  GST              FLOAT NULL,
  Producer_ID      INT   NULL
);

DROP TABLE IF EXISTS tInvoiceDraftHeader;
CREATE TABLE tInvoiceDraftHeader
(
  Draft_Invoice_ID             INT AUTO_INCREMENT
    PRIMARY KEY,
  Draft_Invoice_Date           DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By                   INT                                NULL,
  Draft_Updated_Invoice_Number VARCHAR(1024)                      NULL,
  Recycler_ID                  INT                                NOT NULL,
  Draft_Dispatch_ID            INT                                NULL,
  WH_ID                        INT                                NULL
);

DROP TABLE IF EXISTS tInvoiceHeader;
CREATE TABLE tInvoiceHeader
(
  Invoice_ID             INT AUTO_INCREMENT
    PRIMARY KEY,
  Invoice_Date           DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By             INT                                NULL,
  Invoice_Number         VARCHAR(512)                       NULL,
  Recycler_ID            INT                                NOT NULL,
  Invoice_Base_Amount    DECIMAL(10, 2)                     NULL,
  Invoice_GST_Amount     DECIMAL(10, 2)                     NULL,
  Invoice_Total_Amount   DECIMAL(10, 2)                     NULL,
  Dispatch_ID            INT                                NULL,
  Status                 VARCHAR(64)                        NULL,
  WH_ID                  INT                                NULL,
  Updated_Invoice_Number VARCHAR(1024)                      NULL,
  Last_Updated_On        DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By        INT                                NULL
);

DROP TABLE IF EXISTS tInvoiceSequence;
CREATE TABLE tInvoiceSequence
(
  id INT AUTO_INCREMENT
    PRIMARY KEY
);

DROP TABLE IF EXISTS tItemHandover;
CREATE TABLE tItemHandover
(
  Handover_ID            INT AUTO_INCREMENT
    PRIMARY KEY,
  Handover_On            DATETIME DEFAULT CURRENT_TIMESTAMP                         NULL,
  Handover_To            INT                                                        NULL,
  Cart_ID                INT                                                        NOT NULL,
  Logistinc_Trans_Number VARCHAR(264)                                               NULL,
  Truck_Number           VARCHAR(1024)                                              NULL,
  Driver_Name            VARCHAR(1024)                                              NULL,
  Driver_Phone           BIGINT                                                     NULL,
  GRN                    VARCHAR(1024)                                              NULL,
  Status                 ENUM ('SHIPPEDTOWH', 'RECEIVEDATWH') DEFAULT 'SHIPPEDTOWH' NULL,
  Last_Updated_On        DATETIME DEFAULT CURRENT_TIMESTAMP                         NULL,
  Transaction_Date       DATETIME DEFAULT CURRENT_TIMESTAMP                         NULL,
  Transportation_Number VARCHAR(1024) DEFAULT NULL,
  Last_Updated_By        INT                                                        NULL,
  CONSTRAINT tItemHandover_ibfk_1
  FOREIGN KEY (Cart_ID) REFERENCES tCart (Cart_ID)
);

DROP TABLE IF EXISTS tLanguageDetail;
CREATE TABLE tLanguageDetail
(
  Language_Detail_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Language_ID        INT             NOT NULL,
  Language_Value     TEXT            NOT NULL,
  Language_Code      VARCHAR(64)     NOT NULL,
  Is_Defualt         INT DEFAULT '0' NULL
);

DROP TABLE IF EXISTS tLanguageHeader;
CREATE TABLE tLanguageHeader
(
  Language_ID  INT AUTO_INCREMENT
    PRIMARY KEY,
  Language_Key TEXT NOT NULL
);


DROP TABLE IF EXISTS tLookUp;
CREATE TABLE tLookUp
(
  Type_Code   VARCHAR(64)            NULL,
  LookUp_Code VARCHAR(64) DEFAULT '' NOT NULL
    PRIMARY KEY,
  Description VARCHAR(264)           NULL,
  Sort_Order  INT                    NULL
);

DROP TABLE IF EXISTS tLookUpType;
CREATE TABLE tLookUpType
(
  Type_Code   VARCHAR(64)  NOT NULL
    PRIMARY KEY,
  Description VARCHAR(264) NULL
);

DROP TABLE IF EXISTS tFinancialYear;
CREATE TABLE tFinancialYear
(
  _ID            INT AUTO_INCREMENT PRIMARY KEY,
  Financial_Year YEAR NOT NULL,
  From_Date      DATE NOT NULL,
  To_Date        DATE NOT NULL,
  Display        VARCHAR(1024),
  Is_Current     INT DEFAULT 0
);

DROP TABLE IF EXISTS tMasterLog;
CREATE TABLE tMasterLog
(
  _ID           INT NOT NULL            AUTO_INCREMENT PRIMARY KEY,
  Log_Date      DATETIME                DEFAULT now(),
  User_ID       INT, -- Action By
  Master_ID     INT NOT NULL,
  Master_Type   VARCHAR(64)             DEFAULT NULL, -- Object Name
  Master_Action VARCHAR(24)             DEFAULT NULL, -- Insert,Update,Delete,upload
  Previous_Data TEXT CHARACTER SET utf8
                COLLATE utf8_unicode_ci DEFAULT NULL,
  FOREIGN KEY (User_ID) REFERENCES tUser (User_ID)
);

DROP TABLE IF EXISTS tMediaPublication;
CREATE TABLE tMediaPublication
(
  Media_Publication_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_By           INT                                NULL,
  Created_On           DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Published_On         DATETIME                           NULL,
  Type                 VARCHAR(1024)                      NULL,
  Type_Name            VARCHAR(1024)                      NULL,
  Description          TEXT                               NULL,
  Name                 TEXT                               NULL,
  Region               TEXT                               NULL,
  URL                  TEXT                               NULL,
  Reach                TEXT                               NULL,
  Latitude_Longitude   VARCHAR(1024)                      NULL,
  Earned_Value         FLOAT                              NULL,
  State_ID             INT                                NULL,
  City_ID              INT                                NULL,
  Last_Updated_On      DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By      INT                                NULL
);

DROP TABLE IF EXISTS tMonth;
CREATE TABLE tMonth
(
  Month_Number     INT             NOT NULL,
  Month_Name       VARCHAR(24)     NOT NULL,
  Month_Short_Name VARCHAR(24)     NOT NULL,
  Sort_Order       INT DEFAULT '1' NULL
);

DROP TABLE IF EXISTS tObjectGeoLocation;
CREATE TABLE tObjectGeoLocation
(
  _ID                INT AUTO_INCREMENT
    PRIMARY KEY,
  Object_Type        VARCHAR(1024) NOT NULL,
  Object_ID          INT           NOT NULL,
  Latitude_Longitude VARCHAR(1024) NOT NULL
);

DROP TABLE IF EXISTS tOutwardAllocationDetail;
CREATE TABLE tOutwardAllocationDetail
(
  Allocation_ID INT                           NOT NULL,
  WH_GRN_ID     INT                           NOT NULL,
  Quantity      DECIMAL(10, 2) DEFAULT '0.00' NULL,
  Returned_Quantity FLOAT DEFAULT 0
);

DROP TABLE IF EXISTS tOutwardAllocationHeader;
CREATE TABLE tOutwardAllocationHeader
(
  Allocation_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Invoice_ID    INT NOT NULL,
  Category_ID   INT NOT NULL
);

DROP TABLE IF EXISTS tOutwardInvoiceMapping;
CREATE TABLE tOutwardInvoiceMapping
(
  System_Invoice_Number VARCHAR(1024) NULL,
  Actual_Invoice_Number VARCHAR(1024) NULL
);

DROP TABLE IF EXISTS tPOEComment;
CREATE TABLE tPOEComment
(
  Comment_ID       INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_By       INT                                NULL,
  Created_On       DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_On  DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  GRN_ID           INT                                NOT NULL,
  Invoice_Type     VARCHAR(1024) DEFAULT 'INWARD'     NULL,
  Internal_Comment TEXT                               NULL,
  External_Comment TEXT                               NULL
);

DROP TABLE IF EXISTS tPOEDetail;
CREATE TABLE tPOEDetail
(
  POE_ID             INT           NOT NULL,
  File_Name          VARCHAR(1024) NULL,
  File_Original_Name VARCHAR(1024) NULL,
  File_Type          VARCHAR(64)   NULL,
  Latitude           VARCHAR(64)   NULL,
  Longitude          VARCHAR(64)   NULL
);

DROP TABLE IF EXISTS tPOEHeader;
CREATE TABLE tPOEHeader
(
  POE_ID           INT AUTO_INCREMENT
    PRIMARY KEY,
  Transaction_ID   INT         NULL,
  Transaction_Type VARCHAR(64) NULL,
  POE_Type         VARCHAR(64) NULL
);

DROP TABLE IF EXISTS tPickupDetail;
CREATE TABLE tPickupDetail
(
  Pickup_ID         INT             NOT NULL,
  Pickup_Request_ID INT             NOT NULL,
  Is_Handed_Over    INT DEFAULT '0' NULL
);

DROP TABLE IF EXISTS tPickupHeader;
CREATE TABLE tPickupHeader
(
  Pickup_ID                  INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_On                 DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By                 INT                                NULL,
  Logistic_Partner_Entity_ID INT                                NULL,
  Logistic_Partner_User_ID   INT                                NULL,
  WH_ID                      INT                                NULL,
  Is_Direct                  INT DEFAULT '0'                    NULL,
  Logistic_Pickup_Date       DATETIME                           NULL,
  Logistic_Instructions      TEXT                               NULL,
  Last_Updated_On            DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Recycler_ID                INT                                NULL
);

DROP TABLE IF EXISTS tPickupRequest;
CREATE TABLE tPickupRequest
(
  Pickup_Request_ID                   INT AUTO_INCREMENT
    PRIMARY KEY,
  Requested_On                        DATETIME DEFAULT CURRENT_TIMESTAMP                         NULL,
  Cart_ID                             INT                                                        NOT NULL,
  Request_By                          INT                                                        NULL,
  Logistic_Partner_Entity_ID          INT                                                        NULL,
  Logistic_Partner_User_ID            INT                                                        NULL,
  Logistic_Partner_Entity_Assigned_On DATETIME                                                   NULL,
  Logistic_Partner_User_Assigned_On   DATETIME                                                   NULL,
  Address1                            VARCHAR(4028)                                              NULL,
  Address2                            VARCHAR(4028)                                              NULL,
  Address3                            VARCHAR(4028)                                              NULL,
  Pincode                             INT                                                        NULL,
  Status                              ENUM ('APPROVED', 'REJECTED', 'PENDING') DEFAULT 'PENDING' NULL,
  Status_Changed_On                   DATETIME DEFAULT CURRENT_TIMESTAMP                         NULL,
  WH_ID                               INT                                                        NULL,
  Is_Direct                           INT DEFAULT '0'                                            NULL,
  Logistic_Pickup_Date                DATETIME                                                   NULL,
  Logistic_Instructions               TEXT                                                       NULL,
  Freight_Charge                      DECIMAL(10, 2) DEFAULT '0.00'                              NULL,
  Is_Karo_Arranged_Vehicle            INT DEFAULT '0'                                            NULL,
  Finacial_Year                       YEAR                                                       NULL,
  State_ID                            INT                                                        NULL,
  City_ID                             INT                                                        NULL,
  Last_Updated_On                     DATETIME DEFAULT CURRENT_TIMESTAMP                         NULL,
  Last_Updated_By                     INT                                                        NULL,
  Transaction_Date                    DATETIME DEFAULT CURRENT_TIMESTAMP                         NULL,
  CONSTRAINT tPickupRequest_ibfk_1
  FOREIGN KEY (Cart_ID) REFERENCES tCart (Cart_ID)
);


DROP TABLE IF EXISTS tProcurementPlanningDetail;
CREATE TABLE tProcurementPlanningDetail
(
  Planning_ID INT   NOT NULL,
  City_ID     INT   NULL,
  Category_ID INT   NULL,
  Quantity    FLOAT NULL,
  Rate        FLOAT NULL,
  WH_ID       INT   NULL,
  Recycler_ID INT   NULL
);

DROP TABLE IF EXISTS tProcurementPlanningHeader;
CREATE TABLE tProcurementPlanningHeader
(
  Planning_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_By  INT                                NULL,
  Created_On  DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Week_Date   DATE                               NULL
);

DROP TABLE IF EXISTS tProducerApportion;
CREATE TABLE tProducerApportion
(
  _ID         INT AUTO_INCREMENT
    PRIMARY KEY,
  Invoice_ID  INT                           NOT NULL,
  Category_ID INT                           NOT NULL,
  Quantity    DECIMAL(10, 2) DEFAULT '0.00' NULL,
  Producer_ID INT                           NOT NULL
);

DROP TABLE IF EXISTS tProducerInvoiceDetail;
CREATE TABLE tProducerInvoiceDetail
(
  Detail_ID           INT AUTO_INCREMENT
    PRIMARY KEY,
  Producer_Invocie_ID INT                           NOT NULL,
  Invoice_ID          INT                           NOT NULL,
  Category_ID         DECIMAL(10, 2)                NULL,
  Price               DECIMAL(10, 2) DEFAULT '0.00' NULL,
  GST                 DECIMAL(10, 2) DEFAULT '0.00' NULL,
  GST_Percentage      DECIMAL(10, 2) DEFAULT '0.00' NULL
);

DROP TABLE IF EXISTS tProducerInvoiceHeader;
CREATE TABLE tProducerInvoiceHeader
(
  Producer_Invocie_ID             INT AUTO_INCREMENT
    PRIMARY KEY,
  Producer_Invocie_Number         VARCHAR(1024)                      NULL,
  Updated_Producer_Invocie_Number VARCHAR(1024)                      NULL,
  Invoice_Date                    DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By                      INT                                NULL,
  Producer_ID                     INT                                NOT NULL,
  Invoice_Base_Amount             DECIMAL(10, 2)                     NULL,
  Invoice_GST_Amount              DECIMAL(10, 2)                     NULL,
  Invoice_Total_Amount            DECIMAL(10, 2)                     NULL
);

DROP TABLE IF EXISTS tProducerTargetDetail;
CREATE TABLE tProducerTargetDetail
(
  Producer_Target_Detail_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Producer_Target_ID        INT             NOT NULL,
  Parameter                 VARCHAR(64)     NULL,
  Target_Value              DECIMAL(16, 4),
  UOM_ID                    INT DEFAULT '1' NULL
);

DROP TABLE IF EXISTS tProducerTargetHeader;
CREATE TABLE tProducerTargetHeader
(
  Producer_Target_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_By         INT                                NOT NULL,
  Created_On         DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Producer_ID        INT                                NOT NULL,
  Month_Number       INT                                NULL,
  Target_Year        INT                                NULL,
  Target_Type        VARCHAR(64)                        NULL
);

DROP TABLE IF EXISTS tRecyclerGRNDetail;
CREATE TABLE tRecyclerGRNDetail
(
  GRN_ID           INT               NOT NULL,
  Category_ID      INT               NULL,
  Quantity         FLOAT             NULL,
  Advised_Quantity FLOAT DEFAULT '0' NULL
);

DROP TABLE IF EXISTS tRecyclerGRNDocumentConfig;
CREATE TABLE tRecyclerGRNDocumentConfig
(
  Document_Configuration_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Name                      VARCHAR(1024)                                                 NULL,
  Type                      ENUM ('ANY', 'IMAGE', 'AUDIO', 'VIDEO', 'DOCS') DEFAULT 'ANY' NULL,
  Is_Required               INT DEFAULT '1'                                               NULL,
  Added_On                  DATETIME DEFAULT CURRENT_TIMESTAMP                            NULL,
  Last_Updated_ON           DATETIME DEFAULT CURRENT_TIMESTAMP                            NULL,
  Sort_Order                INT DEFAULT '1'                                               NULL,
  Is_Direct                 INT DEFAULT '0'                                               NULL
);

DROP TABLE IF EXISTS tRecyclerGRNDocumentDetail;
CREATE TABLE tRecyclerGRNDocumentDetail
(
  Document_ID               INT           NOT NULL,
  Document_Configuration_ID INT           NULL,
  File_Name                 VARCHAR(4048) NULL,
  File_Original_Name        VARCHAR(4048) NULL,
  File_Type                 VARCHAR(64)   NULL,
  File_Size                 BIGINT        NULL,
  Lattitude_Longitude       VARCHAR(1024) NULL
);

DROP TABLE IF EXISTS tRecyclerGRNDocumentHeader;
CREATE TABLE tRecyclerGRNDocumentHeader
(
  Document_ID     INT AUTO_INCREMENT
    PRIMARY KEY,
  GRN_ID          INT                                NOT NULL,
  Created_On      DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By      INT                                NULL,
  Last_Updated_On DATETIME DEFAULT CURRENT_TIMESTAMP NULL
);

DROP TABLE IF EXISTS tRecyclerGRNHeader;
CREATE TABLE tRecyclerGRNHeader
(
  GRN_ID           INT AUTO_INCREMENT
    PRIMARY KEY,
  GRN_Date         DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By       INT                                NULL,
  Invoice_Number   VARCHAR(1024)                      NULL,
  Transaction_Date DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_On  DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By  INT                                NULL
);

DROP TABLE IF EXISTS tRequiredDocumentConfig;
CREATE TABLE tRequiredDocumentConfig
(
  _ID                       INT AUTO_INCREMENT
    PRIMARY KEY,
  Document_Configuration_ID INT                                         NOT NULL,
  Type                      ENUM ('INWARD', 'OUTWARD') DEFAULT 'INWARD' NULL,
  From_Date                 DATE                                        NULL,
  To_Date                   DATE                                        NULL
);


DROP TABLE IF EXISTS tSchoolEvaluationDetail;
CREATE TABLE tSchoolEvaluationDetail
(
  School_Evaluation_ID INT                                NOT NULL,
  Evaluation_Type      VARCHAR(64)                        NULL,
  Rating               INT DEFAULT '1'                    NULL,
  Last_Updated_On      DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By      INT                                NULL
);

DROP TABLE IF EXISTS tSchoolEvaluationHeader;
CREATE TABLE tSchoolEvaluationHeader
(
  School_Evaluation_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_On           DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By           INT                                NULL,
  School_ID            INT                                NULL
);

DROP TABLE IF EXISTS tSchoolExcercise;
CREATE TABLE tSchoolExcercise
(
  School_Excercise_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_On          DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By          INT                                NULL,
  School_ID           INT                                NULL,
  Excercise_ID        INT                                NULL,
  Activity_ID         INT                                NULL,
  Is_Completed        INT DEFAULT '1'                    NULL,
  Completed_Date      DATE                               NULL,
  Description         TEXT                               NULL,
  Num_Teachers        INT DEFAULT '0'                    NULL,
  Num_Students        INT DEFAULT '0'                    NULL,
  Num_Outside_People  INT DEFAULT '0'                    NULL,
  Ewaste_Collected    FLOAT DEFAULT '0'                  NULL,
  Last_Updated_On     DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By     INT                                NULL
);

DROP TABLE IF EXISTS tSchoolProgramExtension;
CREATE TABLE tSchoolProgramExtension
(
  School_ID     INT  NOT NULL,
  Finacial_Year YEAR NULL
);

DROP TABLE IF EXISTS tSchoolToolkitAssessmentDetail;
CREATE TABLE tSchoolToolkitAssessmentDetail
(
  Header_ID           INT             NOT NULL,
  Toolkit_Assess_Type VARCHAR(64)     NULL,
  Rating              INT DEFAULT '0' NULL
);

DROP TABLE IF EXISTS tSellerBill;
CREATE TABLE tSellerBill
(
  Bill_ID             INT AUTO_INCREMENT
    PRIMARY KEY,
  Bill_Date           DATETIME DEFAULT CURRENT_TIMESTAMP         NULL,
  Bill_Number         VARCHAR(1024)                              NULL,
  Updated_Bill_Number VARCHAR(1024)                              NULL,
  Cart_ID             INT                                        NOT NULL,
  Status              ENUM ('PENDING', 'PAID') DEFAULT 'PENDING' NULL,
  CONSTRAINT tSellerBill_ibfk_1
  FOREIGN KEY (Cart_ID) REFERENCES tCart (Cart_ID)
);

DROP TABLE IF EXISTS tSellerBillAmount;
CREATE TABLE tSellerBillAmount
(
  Bill_Amount_ID  INT AUTO_INCREMENT
    PRIMARY KEY,
  Bill_ID         INT                                NOT NULL,
  Added_By        INT                                NULL,
  Ref_Number      VARCHAR(1024)                      NULL,
  Voucher_Number  VARCHAR(1024)                      NULL,
  Ammount         DECIMAL(10, 2)                     NULL,
  Description     TEXT                               NULL,
  Voucher_Date    DATE                               NULL,
  Payment_Date    DATE                               NULL,
  Added_On        DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Bank_Name       VARCHAR(1024)                      NULL,
  Payee_Name      VARCHAR(1024)                      NULL,
  Bank_Payer_Name VARCHAR(1024)                      NULL,
  Bank_ID         INT                                NULL,
  Bank_Payer_ID   INT                                NULL,
  Last_Updated_On DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By INT                                NULL,
  CONSTRAINT tSellerBillAmount_ibfk_1
  FOREIGN KEY (Bill_ID) REFERENCES tSellerBill (Bill_ID)
);

DROP TABLE IF EXISTS tSignUpStatus;
CREATE TABLE tSignUpStatus
(
  User_ID         INT             NOT NULL,
  Steps_Completed INT DEFAULT '1' NULL,
  Is_Completed    INT DEFAULT '0' NULL
);

DROP TABLE IF EXISTS tState;
CREATE TABLE tState
(
  State_ID        INT AUTO_INCREMENT
    PRIMARY KEY,
  State_Name      VARCHAR(264)                       NOT NULL,
  Is_Operative    INT DEFAULT '0'                    NULL,
  Zone_ID         INT                                NULL,
  Created_On      DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By      INT                                NULL,
  Last_Updated_On DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By INT                                NULL,
  State_Code      VARCHAR(16) DEFAULT NULL
);

DROP TABLE IF EXISTS tTargetDetail;
CREATE TABLE tTargetDetail
(
  Target_Detail_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Target_ID        INT             NOT NULL,
  Parameter        VARCHAR(64)     NOT NULL,
  Target_Value     FLOAT           NULL,
  UOM_ID           INT DEFAULT '1' NULL
);

DROP TABLE IF EXISTS tTargetHeader;
CREATE TABLE tTargetHeader
(
  Target_ID    INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_By   INT                                NULL,
  Created_On   DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Target_To    INT                                NOT NULL,
  Is_User      INT DEFAULT '0'                    NULL,
  Month_Number INT                                NULL,
  Target_Year  YEAR                               NULL,
  Target_Type  VARCHAR(64) DEFAULT 'TGTTYPEMONTH' NULL
);

DROP TABLE IF EXISTS tTargetParameters;
CREATE TABLE tTargetParameters
(
  Target_Parameter_Code VARCHAR(1024)   NULL,
  Target_Parameter_Name VARCHAR(1024)   NULL,
  Is_Data_Driven        INT DEFAULT '1' NULL,
  Object_Type           VARCHAR(1024)   NULL
);

DROP TABLE IF EXISTS tTargetTypeMappingDetail;
CREATE TABLE tTargetTypeMappingDetail
(
  Mapping_ID            INT             NULL,
  Target_Parameter_Code VARCHAR(1024)   NULL,
  Is_Active             INT DEFAULT '1' NULL
);

DROP TABLE IF EXISTS tTargetTypeMappingHeader;
CREATE TABLE tTargetTypeMappingHeader
(
  Mapping_ID  INT AUTO_INCREMENT
    PRIMARY KEY,
  Entity_Type VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS tTempInwardWithBarcode;
CREATE TABLE tTempInwardWithBarcode
(
  Entity_ID    INT                                NULL,
  User_ID      INT                                NULL,
  WH_ID        INT                                NULL,
  Handover_ID  INT                                NULL,
  Item_Details TEXT                               NULL,
  Bill_Date    VARCHAR(1024)                      NULL,
  Bill_Number  VARCHAR(1024)                      NULL,
  Created_On   DATETIME DEFAULT CURRENT_TIMESTAMP NULL
);


DROP TABLE IF EXISTS tTempOutwardWithBarcode;
CREATE TABLE tTempOutwardWithBarcode
(
  Entity_ID      INT                                NULL,
  User_ID        INT                                NULL,
  WH_ID          INT                                NULL,
  Item_Details   TEXT                               NULL,
  Invoice_ID     INT                                NULL,
  Created_On     DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Invoice_Number VARCHAR(1024)                      NULL,
  Is_Synched     INT DEFAULT '1'                    NULL
);


DROP TABLE IF EXISTS tTransactionLog;
CREATE TABLE tTransactionLog (
  _ID                INT                     AUTO_INCREMENT PRIMARY KEY,
  Log_Date           DATETIME                DEFAULT now(), -- actual date time
  User_ID            INT, -- user id
  Transaction_ID     INT, -- id column of the transaction
  Transaction_Type   VARCHAR(24), -- Object
  Transaction_Action VARCHAR(64), -- create / update / upload / delete
  Data               TEXT CHARACTER SET utf8
                     COLLATE utf8_unicode_ci DEFAULT NULL
);


DROP TABLE IF EXISTS tUOM;
CREATE TABLE tUOM
(
  UOM_ID   INT AUTO_INCREMENT
    PRIMARY KEY,
  UOM_Type VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS tUploadPOE;
CREATE TABLE tUploadPOE
(
  File_Name    TEXT            NULL,
  Is_Processed INT DEFAULT '0' NULL
);

DROP TABLE IF EXISTS tUploadPOEOutward;
CREATE TABLE tUploadPOEOutward
(
  File_Name              TEXT            NULL,
  Is_Processed           INT DEFAULT '0' NULL,
  Updated_Invoice_Number VARCHAR(1024)   NULL
);

DROP TABLE IF EXISTS tUser;
CREATE TABLE tUser
(
  User_ID         INT AUTO_INCREMENT
    PRIMARY KEY,
  User_Name       VARCHAR(1024)                                NULL,
  Mobile_Number   BIGINT                                       NULL,
  Landline_Number BIGINT                                       NULL,
  Email           VARCHAR(1024)                                NULL,
  Designation     VARCHAR(1024)                                NULL,
  User_Password   VARCHAR(64)                                  NULL,
  Status          ENUM ('ACTIVE', 'DEACTIVE') DEFAULT 'ACTIVE' NULL,
  Photo           VARCHAR(1024)                                NULL,
  Is_Primary      INT DEFAULT '0'                              NULL,
  Parent_ID       INT                                          NULL,
  Is_Delete       INT(1) DEFAULT '0'                           NULL,
  Created_On      DATETIME DEFAULT CURRENT_TIMESTAMP           NULL,
  Other_Mobiles   VARCHAR(1024)                                NULL,
  Created_By      INT                                          NULL,
  Last_Updated_On DATETIME DEFAULT CURRENT_TIMESTAMP           NULL,
  Last_Updated_By INT                                          NULL
);

DROP TABLE IF EXISTS tUserDevice;
CREATE TABLE tUserDevice
(
  _ID             INT AUTO_INCREMENT
    PRIMARY KEY,
  User_ID         VARCHAR(128)                          NOT NULL,
  Device_ID       VARCHAR(264)                          NOT NULL,
  Device_Type     ENUM ('ANDROID', 'IPHONE', 'WINDOWS') NULL,
  Device_Detail   TEXT                                  NULL,
  Last_Updated_On DATETIME DEFAULT CURRENT_TIMESTAMP    NULL
);

DROP TABLE IF EXISTS tUserEntity;
CREATE TABLE tUserEntity
(
  User_ID   INT NULL,
  Entity_ID INT NULL,
  CONSTRAINT tUserEntity_ibfk_1
  FOREIGN KEY (User_ID) REFERENCES tUser (User_ID),
  CONSTRAINT tUserEntity_ibfk_2
  FOREIGN KEY (Entity_ID) REFERENCES tEntity (Entity_ID)
);

DROP TABLE IF EXISTS tUserEntityTemp;
CREATE TABLE tUserEntityTemp
(
  User_ID   INT NULL,
  Entity_ID INT NULL
);

-- DROP TABLE IF EXISTS tUserRole;
-- CREATE TABLE tUserRole
-- (
--   User_ID INT NULL,
--   Role_ID INT NULL,
--   CONSTRAINT tUserRole_ibfk_1
--   FOREIGN KEY (User_ID) REFERENCES tUser (User_ID),
--   CONSTRAINT tUserRole_ibfk_2
--   FOREIGN KEY (Role_ID) REFERENCES tRole (Role_ID)
-- );

DROP TABLE IF EXISTS tUserTemp;
CREATE TABLE tUserTemp
(
  User_ID         INT AUTO_INCREMENT
    PRIMARY KEY,
  User_Name       VARCHAR(1024)                                NULL,
  Mobile_Number   BIGINT                                       NULL,
  Landline_Number BIGINT                                       NULL,
  Email           VARCHAR(1024)                                NULL,
  Designation     VARCHAR(1024)                                NULL,
  User_Password   VARCHAR(64)                                  NULL,
  Status          ENUM ('ACTIVE', 'DEACTIVE') DEFAULT 'ACTIVE' NULL,
  Photo           VARCHAR(1024)                                NULL,
  Is_Primary      INT DEFAULT '0'                              NULL,
  Parent_ID       INT                                          NULL,
  Is_Delete       INT(1) DEFAULT '0'                           NULL,
  Created_On      DATETIME DEFAULT CURRENT_TIMESTAMP           NULL
);


DROP TABLE IF EXISTS tVerification;
CREATE TABLE tVerification
(
  Verification_ID        INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_Date           DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By             INT                                NULL,
  Transaction_ID         INT                                NOT NULL,
  Transaction_Type       VARCHAR(1024)                      NOT NULL,
  Current_Assignee       INT                                NOT NULL,
  Assigned_On            DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Assigned_By            INT                                NULL,
  Status_ID              INT DEFAULT '1'                    NULL,
  Status_Changed_On      DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Is_Completely_Verified INT                                NULL,
  Last_Updated_On        DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By        INT                                NULL
);

DROP TABLE IF EXISTS tVerificationHistory;
CREATE TABLE tVerificationHistory
(
  Verification_ID INT                                NOT NULL,
  Verified_On     DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By      INT                                NULL,
  Assigned_To     INT                                NULL,
  Status_ID       INT                                NOT NULL,
  Comments        TEXT                               NULL
);

DROP TABLE IF EXISTS tVerificationStatus;
CREATE TABLE tVerificationStatus
(
  Status_ID  INT AUTO_INCREMENT
    PRIMARY KEY,
  Status     TEXT            NULL,
  Is_Final   INT DEFAULT '0' NULL,
  Is_Visible INT DEFAULT '1' NULL,
  Type       VARCHAR(64)     NULL,
  Parent_ID  INT             NULL,
  Sort_Order INT DEFAULT '1' NULL
);

DROP TABLE IF EXISTS tVisit;
CREATE TABLE tVisit
(
  Visit_ID           INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_On         DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  User_ID            INT                                NOT NULL,
  Transaction_Date   DATE                               NULL,
  Entity_Type        VARCHAR(64)                        NULL,
  Entity_ID          INT                                NULL,
  Entity_Name        VARCHAR(264)                       NULL,
  Visit_Purpose      VARCHAR(64)                        NULL,
  Outcome_Achieved   INT DEFAULT '1'                    NULL,
  Awarness_Completed INT DEFAULT '1'                    NULL,
  Remarks            TEXT                               NULL,
  KARO_Materials     INT DEFAULT '0'                    NULL,
  Person_Met         VARCHAR(1024)                      NULL,
  Designation        VARCHAR(1024)                      NULL,
  State_ID           INT                                NULL,
  City_ID            INT                                NULL,
  Last_Updated_On    DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By    INT                                NULL,
  Session_User_ID    INT                                NULL,
  CONSTRAINT tVisit_ibfk_1
  FOREIGN KEY (User_ID) REFERENCES tUser (User_ID)
);

DROP TABLE IF EXISTS tVisitGifts;
CREATE TABLE tVisitGifts
(
  Visit_ID      INT            NOT NULL,
  Gift_Item_ID  INT            NOT NULL,
  Gift_Quantity DECIMAL(10, 2) NULL,
  CONSTRAINT tVisitGifts_ibfk_1
  FOREIGN KEY (Visit_ID) REFERENCES tVisit (Visit_ID),
  CONSTRAINT tVisitGifts_ibfk_2
  FOREIGN KEY (Gift_Item_ID) REFERENCES tGiftItem (Gift_Item_ID)
);

DROP TABLE IF EXISTS tWHGRNBarcode;
CREATE TABLE tWHGRNBarcode
(
  GRN_Barcode_ID   INT AUTO_INCREMENT
    PRIMARY KEY,
  WH_GRN_Detail_ID INT           NOT NULL,
  Quantity         FLOAT         NULL,
  Barcode          VARCHAR(1024) NULL
);

DROP TABLE IF EXISTS tWHGRNDetail;
CREATE TABLE tWHGRNDetail
(
  _ID              INT AUTO_INCREMENT
    PRIMARY KEY,
  WH_GRN_ID        INT               NOT NULL,
  Category_ID      INT               NOT NULL,
  Inward_Quantity  FLOAT DEFAULT '0' NULL,
  Outward_Quantity FLOAT DEFAULT '0' NULL,
  Num_Bags         INT DEFAULT '1'   NULL,
  Returned_Quantity FLOAT DEFAULT 0,
  Re_Inwarded_Quantity FLOAT DEFAULT 0
);

DROP TABLE IF EXISTS tWHGRNDocumentConfig;
CREATE TABLE tWHGRNDocumentConfig
(
  Document_Configuration_ID INT AUTO_INCREMENT
  PRIMARY KEY,
  Name                      VARCHAR(1024)                                                 NULL,
  Type                      ENUM ('ANY', 'IMAGE', 'AUDIO', 'VIDEO', 'DOCS') DEFAULT 'ANY' NULL,
  Is_Required               INT DEFAULT '1'                                               NULL,
  Added_On                  DATETIME DEFAULT CURRENT_TIMESTAMP                            NULL,
  Last_Updated_ON           DATETIME DEFAULT CURRENT_TIMESTAMP                            NULL,
  Sort_Order                INT DEFAULT '1'                                               NULL
);

DROP TABLE IF EXISTS tWHGRNDocumentDetail;
CREATE TABLE tWHGRNDocumentDetail
(
  Document_ID               INT           NOT NULL,
  Document_Configuration_ID INT           NULL,
  File_Name                 VARCHAR(4048) NULL,
  File_Original_Name        VARCHAR(4048) NULL,
  File_Type                 VARCHAR(64)   NULL,
  File_Size                 BIGINT        NULL,
  Lattitude_Longitude       VARCHAR(1024) NULL
);

DROP TABLE IF EXISTS tWHGRNDocumentHeader;
CREATE TABLE tWHGRNDocumentHeader
(
  Document_ID     INT AUTO_INCREMENT
    PRIMARY KEY,
  WH_GRN_ID       INT                                NOT NULL,
  Created_On      DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By      INT                                NULL,
  Last_Updated_On DATETIME DEFAULT CURRENT_TIMESTAMP NULL
);

DROP TABLE IF EXISTS tWHGRNHeader;
CREATE TABLE tWHGRNHeader
(
  WH_GRN_ID           INT AUTO_INCREMENT
    PRIMARY KEY,
  Logistic_Partner_ID INT                                NULL,
  WH_ID               INT                                NULL,
  Handover_ID         INT                                NOT NULL,
  Created_By          INT                                NULL,
  Create_On           DATETIME                           NULL,
  Transaction_Date    DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_On     DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By     INT                                NULL
);

DROP TABLE IF EXISTS tWHStock;
CREATE TABLE tWHStock
(
  Stock_ID         INT AUTO_INCREMENT
    PRIMARY KEY,
  WH_ID            INT                           NULL,
  Category_ID      INT                           NOT NULL,
  Updated_Date     DATE                          NULL,
  Opening_Quantity DECIMAL(10, 2) DEFAULT '0.00' NULL,
  Closing_Quantity DECIMAL(10, 2) DEFAULT '0.00' NULL,
  Inward_Quantity  DECIMAL(10, 2) DEFAULT '0.00' NULL,
  Outward_Quantity DECIMAL(10, 2) DEFAULT '0.00' NULL
);

DROP TABLE IF EXISTS tWHStockTotal;
CREATE TABLE tWHStockTotal
(
  _ID              INT AUTO_INCREMENT
    PRIMARY KEY,
  WH_ID            INT                           NOT NULL,
  Category_ID      INT                           NOT NULL,
  Opening_Date     DATE                          NULL,
  Opening_Quantity DECIMAL(10, 2) DEFAULT '0.00' NULL,
  Closing_Date     DATE                          NULL,
  Closing_Quantity DECIMAL(10, 2) DEFAULT '0.00' NULL
);

DROP TABLE IF EXISTS tWarehouse;
CREATE TABLE tWarehouse
(
  WH_ID               INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_On          DATETIME DEFAULT CURRENT_TIMESTAMP           NULL,
  Created_By          INT                                          NULL,
  Entity_ID           INT                                          NOT NULL,
  Address1            VARCHAR(4048)                                NULL,
  Address2            VARCHAR(4048)                                NULL,
  Address3            VARCHAR(4048)                                NULL,
  State_ID            INT                                          NULL,
  City_ID             INT                                          NULL,
  Pincode             INT                                          NULL,
  Lattitude_Longitude VARCHAR(1024)                                NULL,
  Mobile_Number       VARCHAR(1024)                                NULL,
  Landline_Number     VARCHAR(1024)                                NULL,
  Contact_Person_Name VARCHAR(1024)                                NULL,
  Status              ENUM ('ACTIVE', 'DEACTIVE') DEFAULT 'ACTIVE' NULL,
  Is_Delete           INT DEFAULT '0'                              NULL,
  Warehouse_Name      VARCHAR(1024)                                NULL,
  Last_Updated_On     DATETIME DEFAULT CURRENT_TIMESTAMP           NULL,
  Last_Updated_By     INT                                          NULL,
  WH_Name             VARCHAR(1024)                                NULL
);

DROP TABLE IF EXISTS tWorkshop;
CREATE TABLE tWorkshop
(
  Workshop_ID      INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_By       INT                                NULL,
  Created_On       DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Transaction_Date DATE                               NULL,
  Workshop_Type    VARCHAR(64)                        NULL,
  Venue            VARCHAR(4048)                      NULL,
  Num_Teachers     INT DEFAULT '0'                    NULL,
  Num_Students     INT DEFAULT '0'                    NULL,
  Feedback         VARCHAR(4048)                      NULL,
  State_ID         INT                                NULL,
  City_ID          INT                                NULL,
  Last_Updated_On  DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Last_Updated_By  INT                                NULL
);

DROP TABLE IF EXISTS tWorkshopAttendance;
CREATE TABLE tWorkshopAttendance
(
  Attendance_ID INT AUTO_INCREMENT
    PRIMARY KEY,
  Workshop_ID   INT NULL,
  School_ID     INT NULL
);

DROP TABLE IF EXISTS tZone;
CREATE TABLE tZone
(
  Zone_ID   INT AUTO_INCREMENT
    PRIMARY KEY,
  Zone_Name VARCHAR(1024)   NOT NULL,
  Is_Delete INT DEFAULT '0' NULL
);

DROP TABLE IF EXISTS tRecyclerRate;
CREATE TABLE tRecyclerRate
(
  _ID         INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By  INT,
  Created_On  DATETIME DEFAULT now(),
  Recycler_ID INT  NOT NULL NULL,
  Category_ID INT  NOT NULL,
  From_Date   DATE NOT NULL,
  To_Date     DATE NOT NULL,
  Rate        FLOAT,
  GST         FLOAT,
  Reviewed_By INT,
  Reviewed_On DATETIME DEFAULT now()
);

DROP TABLE IF EXISTS tRecyclerRateHistory;
CREATE TABLE tRecyclerRateHistory
(
  History_ID INT      AUTO_INCREMENT PRIMARY KEY,
  Header_ID  INT NOT NULL,
  Updated_By INT      DEFAULT NULL,
  Updated_On DATETIME DEFAULT now(),
  From_Date  DATE,
  To_Date    DATE,
  Rate       FLOAT,
  GST        FLOAT
);

DROP TABLE IF EXISTS tRole;
CREATE TABLE tRole
(
  Role_ID INT AUTO_INCREMENT PRIMARY KEY,
  Role    VARCHAR(1024) NOT NULL,
  Is_Delete           INT           DEFAULT 0,
  Created_By          INT           DEFAULT NULL,
  Created_On          DATETIME      DEFAULT now(),
  Last_Updated_By     INT           DEFAULT NULL,
  Last_Updated_On     DATETIME      DEFAULT now(),
  Is_Internal         INT           DEFAULT 0
);

DROP TABLE IF EXISTS tObject;
CREATE TABLE tObject
(
  Object_ID           INT           AUTO_INCREMENT PRIMARY KEY,
  Object_Name         VARCHAR(1024) NOT NULL,
  Display_Object_Name VARCHAR(1024) DEFAULT NULL,
  Is_Delete           INT           DEFAULT 0,
  Created_By          INT           DEFAULT NULL,
  Created_On          DATETIME      DEFAULT now(),
  Last_Updated_By     INT           DEFAULT NULL,
  Last_Updated_On     DATETIME      DEFAULT now()
);


DROP TABLE IF EXISTS tDocument;
CREATE TABLE tDocument
(
  Document_ID   INT AUTO_INCREMENT PRIMARY KEY,
  Document_Type VARCHAR(1024) NOT NULL
);

DROP TABLE IF EXISTS tObjectDocument;
CREATE TABLE tObjectDocument
(
  Object_Document_ID INT AUTO_INCREMENT PRIMARY KEY,
  Object_Type        VARCHAR(1024) NOT NULL, -- Object_Name from tObject table
  Document_Type      VARCHAR(1024) NOT NULL
);

DROP TABLE IF EXISTS tObjectField;
CREATE TABLE tObjectField
(
  Field_ID           INT           AUTO_INCREMENT PRIMARY KEY,
  Field_Name         VARCHAR(1024) NOT NULL,
  Field_Display_Name VARCHAR(1024) DEFAULT NULL,
  Object_ID          INT           NOT NULL
);

DROP TABLE IF EXISTS tRoleAccess;
CREATE TABLE tRoleAccess
(
  Role_ID    INT NOT NULL,
  Object_ID  INT NOT NULL,
  Access_Bit BIGINT DEFAULT 0000000000000000, -- 16 Bit
  Is_Delete           INT           DEFAULT 0,
  Created_By          INT           DEFAULT NULL,
  Created_On          DATETIME      DEFAULT now(),
  Last_Updated_By     INT           DEFAULT NULL,
  Last_Updated_On     DATETIME      DEFAULT now()
);

DROP TABLE IF EXISTS tFieldAccess;
CREATE TABLE tFieldAccess
(
  Role_ID    INT NOT NULL,
  Field_ID   INT NOT NULL,
  Access_Bit BIGINT DEFAULT 0000000000000000 -- 16 Bit
);

DROP TABLE IF EXISTS tUserRole;
CREATE TABLE tUserRole
(
  User_ID INT NOT NULL,
  Role_ID INT NOT NULL
);

DROP TABLE IF EXISTS tEntityRole;
CREATE TABLE tEntityRole
(
  Entity_Type VARCHAR(264),
  Role_ID     INT
);

DROP TABLE IF EXISTS tUserRoleAccess;
CREATE TABLE tUserRoleAccess
(
  User_ID    INT NOT NULL,
  Role_ID    INT NOT NULL,
  Object_ID  INT NOT NULL,
  Access_Bit BIGINT DEFAULT 0000000000000000 -- 16 Bit
);

DROP TABLE IF EXISTS tUserRoleFieldAccess;
CREATE TABLE tUserRoleFieldAccess
(
  User_ID    INT NOT NULL,
  Role_ID    INT NOT NULL,
  Field_ID   INT NOT NULL,
  Access_Bit BIGINT DEFAULT 0000000000000000 -- 16 Bit
);

DROP TABLE IF EXISTS tInwardDraft;
CREATE TABLE tInwardDraft (
  _ID                    INT PRIMARY KEY AUTO_INCREMENT,
  Created_On             DATETIME        DEFAULT CURRENT_TIMESTAMP,
  Created_By             INT,
  Entity_ID              INT, -- seller entity
  User_ID                INT, -- seller user_id
  Address1               TEXT            DEFAULT NULL,
  Address2               TEXT            DEFAULT NULL,
  Address3               TEXT            DEFAULT NULL,
  Pincode                INT             DEFAULT NULL,
  Object_Geo_Location    VARCHAR(1024)   DEFAULT NULL,
  State_ID               INT             DEFAULT NULL, -- seller state
  City_ID                INT             DEFAULT NULL, -- seller city
  Seller_Invoice_Number  VARCHAR(128)    DEFAULT NULL,
  Seller_Invoice_Date    DATETIME        DEFAULT NULL,
  Is_Stock_For_Next_Year INT             DEFAULT 0,
  LSP_ID                 INT             DEFAULT NULL,
  Other_Name             VARCHAR(128)    DEFAULT NULL, -- if lsp is local
  Is_Direct              INT,
  Recycler_ID            INT             DEFAULT NULL,
  Truck_number           VARCHAR(512)    DEFAULT NULL,
  Driver_Name            VARCHAR(512)    DEFAULT NULL,
  Driver_Phone_Number    VARCHAR(10)     DEFAULT NULL,
  Freight_Charges        FLOAT           DEFAULT NULL,
  WH_ID                  INT             DEFAULT NULL,
  Transaction_Date       DATETIME        DEFAULT NULL,
  Karo_Invoice_Number    VARCHAR(128)    DEFAULT NULL,
  Karo_Invoice_Date      DATETIME        DEFAULT NULL,
  Status                 VARCHAR(64)     DEFAULT 'DRAFT', -- other status commit deleted
  Assigned_To            INT             DEFAULT NULL,
  Is_Draft               INT             DEFAULT NULL,
  Transportation_Number VARCHAR(1024) DEFAULT NULL,
  Last_Updated_On        DATETIME,
  Last_Updated_By        INT
);

DROP TABLE IF EXISTS tInwardDraftItem;
CREATE TABLE tInwardDraftItem (
  Inward_Draft_Item_ID INT PRIMARY KEY AUTO_INCREMENT,
  _ID                  INT,
  Category_ID          INT,
  Price                FLOAT,
  Gst                  FLOAT,
  Quantity             FLOAT
);

DROP TABLE IF EXISTS tCommentMaster;
CREATE TABLE tCommentMaster
(
  Comment_Master_ID INT           AUTO_INCREMENT PRIMARY KEY,
  Created_By        INT           DEFAULT NULL,
  Created_On        DATETIME      DEFAULT now(),
  Comment           TEXT CHARACTER SET utf8
                    COLLATE utf8_unicode_ci,
  Comment_Display   TEXT CHARACTER SET utf8
                    COLLATE utf8_unicode_ci,
  Object_Type       VARCHAR(1024) DEFAULT NULL, -- If null applicable to all
  Document_Type     VARCHAR(1024) DEFAULT NULL,
  Is_Visible        INT           DEFAULT 1
);

DROP TABLE IF EXISTS tComment;
CREATE TABLE tComment
(
  Comment_ID        INT           AUTO_INCREMENT PRIMARY KEY,
  Created_By        INT           DEFAULT NULL,
  Created_On        DATETIME      DEFAULT now(),
  Comment_Master_ID INT           DEFAULT NULL,
  Comments          TEXT CHARACTER SET utf8
                    COLLATE utf8_unicode_ci,
  Transaction_ID    INT           NOT NULL,
  Object_Type       VARCHAR(1024) NOT NULL,
  Document_Type     VARCHAR(1024) DEFAULT NULL,
  Internal_Comments TEXT CHARACTER SET utf8
                    COLLATE utf8_unicode_ci,
  External_Comments TEXT CHARACTER SET utf8
                    COLLATE utf8_unicode_ci,
  Last_Updated_On   DATETIME      DEFAULT now(),
  Last_Updated_By   INT           DEFAULT NULL,
  Is_Delete         INT           DEFAULT 0
);

DROP TABLE IF EXISTS tCommentHistory;
CREATE TABLE tCommentHistory
(
  Comment_History_ID INT      AUTO_INCREMENT PRIMARY KEY,
  Comment_ID         INT NULL,
  Updated_By         INT      DEFAULT NULL,
  Updated_On         DATETIME DEFAULT now(),
  Comment_Master_ID  INT      DEFAULT NULL,
  Comments           TEXT CHARACTER SET utf8
                     COLLATE utf8_unicode_ci,
  Internal_Comments  TEXT CHARACTER SET utf8
                     COLLATE utf8_unicode_ci,
  External_Comments  TEXT CHARACTER SET utf8
                     COLLATE utf8_unicode_ci
);

drop table if exists tVerificationDefaultAssignee ;
CREATE TABLE tVerificationDefaultAssignee (
  Transaction_Type VARCHAR(128) NOT NULL,
  User_ID          INT(11)      NOT NULL
);

DROP  TABLE IF EXISTS tWHTransferHeader;
create TABLE  tWHTransferHeader
(
  _ID INT PRIMARY KEY AUTO_INCREMENT,
  Created_By INT null,
  Created_On datetime default now(),
  From_WH INT,
  To_WH INT,
  Truck_Number varchar(1024) null,
 	Driver_Name varchar(1024) null,
 	Diver_Number varchar(1024) null,
  Transferred_Date DATE,
  Last_Updated_By INT null,
  Last_Updated_On datetime default now()
);

DROP TABLE IF EXISTS tWHTransferDetail;
CREATE TABLE tWHTransferDetail
(
  Header_ID INT,
  Category_ID INT,
  Quantity DECIMAL(10,2)
);

DROP TABLE IF EXISTS tWHStockLog;
CREATE TABLE tWHStockLog
(
  _ID              INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By       INT      DEFAULT NULL,
  Created_On       DATETIME DEFAULT now(),
  WH_ID            INT NOT NULL,
  Transaction_ID   INT NOT NULL,
  Transaction_Type VARCHAR(64),
  Category_ID      INT NOT NULL,
  Stock_Before     FLOAT,
  Stock_After      FLOAT
);


DROP TABLE IF EXISTS tChecklistHeader;
CREATE TABLE tChecklistHeader
(
  _ID             INT          AUTO_INCREMENT PRIMARY KEY,
  Created_By      INT          DEFAULT NULL,
  Created_On      DATETIME     DEFAULT now(),
  Object_Type     VARCHAR(256) NOT NULL,
  Document_Type   VARCHAR(256) DEFAULT NULL,
  Last_Updated_By INT          DEFAULT NULL,
  Last_Updated_On DATETIME     DEFAULT now()
);

DROP TABLE IF EXISTS tChecklistDetail;
CREATE TABLE tChecklistDetail
(
  CheckList_ID      INT      AUTO_INCREMENT PRIMARY KEY,
  Header_ID         INT NOT NULL,
  Checklist         TEXT CHARACTER SET utf8
                    COLLATE utf8_unicode_ci,
  Checklist_Display TEXT CHARACTER SET utf8
                    COLLATE utf8_unicode_ci,
  Last_Updated_By   INT,
  Last_Updated_On   DATETIME DEFAULT now()
);


DROP TABLE IF EXISTS tCheckListUpdateHeader;
CREATE TABLE tCheckListUpdateHeader
(
  Update_ID       INT          AUTO_INCREMENT PRIMARY KEY,
  Created_By      INT          DEFAULT NULL,
  Created_On      DATETIME     DEFAULT now(),
  Transaction_ID  INT          NOT NULL,
  Object_Type     VARCHAR(256) NOT NULL,
  Document_Type   VARCHAR(256) DEFAULT NULL,
  Last_Updated_By INT          DEFAULT NULL,
  Last_Updated_On DATETIME     DEFAULT now()
);

DROP TABLE IF EXISTS tCheckListUpdateDetail;
CREATE TABLE tCheckListUpdateDetail
(
  Update_ID    INT NOT NULL,
  CheckList_ID INT NOT NULL,
  Is_Checked   INT                     DEFAULT 0,
  Comments     TEXT CHARACTER SET utf8
               COLLATE utf8_unicode_ci DEFAULT NULL
);

DROP TABLE IF EXISTS tCollectionCentreAudit;
CREATE TABLE tCollectionCentreAudit
(
  Audit_ID             INT          AUTO_INCREMENT PRIMARY KEY,
  Created_By           INT          DEFAULT NULL,
  Created_On           DATETIME     DEFAULT now(),
  Collection_Centre_ID INT           NOT NULL,
  Audited_By           INT          DEFAULT NULL,
  Audited_By_Name      VARCHAR(1024) NOT NULL,
  Audited_On           DATE          NOT NULL,
  Audit_Type           VARCHAR(256) DEFAULT 'FREQMONTH', -- Lookup FREQTYPE
  Remarks              TEXT CHARACTER SET utf8
                       COLLATE utf8_unicode_ci,
  Last_Updated_By      INT          DEFAULT NULL,
  Last_Updated_On      DATETIME     DEFAULT now(),
  Is_Delete            INT          DEFAULT 0
);

DROP TABLE IF EXISTS tDataSyncUpdate;
CREATE TABLE tDataSyncUpdate
(
  _ID        INT      AUTO_INCREMENT PRIMARY KEY,
  Updated_On DATETIME DEFAULT now(),
  Update_Bit BIGINT   DEFAULT 0000000000000000
);

DROP TABLE IF EXISTS tPaymentRequestHeader;
CREATE TABLE tPaymentRequestHeader
(
  Request_ID        INT         AUTO_INCREMENT PRIMARY KEY,
  Transaction_Date  DATETIME    DEFAULT now(),
  Requested_By      INT         DEFAULT NULL,
  Remarks           VARCHAR(4048)
                    CHARACTER SET utf8
                    COLLATE utf8_unicode_ci,
  To_Be_Advised_By  INT         DEFAULT NULL,
  Status            VARCHAR(64) DEFAULT 'OPEN', -- OPEN, CLOSED
  Status_Changed_On DATETIME    DEFAULT now(),
  Last_Updated_On   DATETIME    DEFAULT now(),
  Last_Updated_By   INT         DEFAULT NULL
);

DROP TABLE IF EXISTS tPaymentRequestDetail;
CREATE TABLE tPaymentRequestDetail
(
  Request_ID     INT          NOT NULL,
  Bill_ID        INT          NOT NULL,
  Bill_Type      VARCHAR(128) NOT NULL DEFAULT 'SELLERINV',
  Bill_Amount    FLOAT        NOT NULL,
  Request_Amount FLOAT        NOT NULL,
  Pay_By_Date    DATE                  DEFAULT NULL,
  Priority       INT                   DEFAULT 0,
  Status         VARCHAR(64)           DEFAULT 'OPEN'
);


DROP TABLE IF EXISTS tPaymentAdviceHeader;
CREATE TABLE tPaymentAdviceHeader
(
  Advice_ID         INT         AUTO_INCREMENT PRIMARY KEY,
  Transaction_Date  DATETIME    DEFAULT now(),
  Advised_By        INT         DEFAULT NULL,
  To_Be_Cleared_By  INT         DEFAULT NULL,
  Remarks           VARCHAR(4048)
                    CHARACTER SET utf8
                    COLLATE utf8_unicode_ci,
  Status            VARCHAR(64) DEFAULT 'OPEN', -- OPEN, CLOSED
  Status_Changed_On DATETIME    DEFAULT now(),
  Last_Updated_On   DATETIME    DEFAULT now(),
  Last_Updated_By   INT         DEFAULT NULL
);

DROP TABLE IF EXISTS tPaymentAdviceDetail;
CREATE TABLE tPaymentAdviceDetail
(
  Advice_ID      INT          NOT NULL,
  Request_ID     INT          NOT NULL,
  Bill_ID        INT,
  Bill_Type      VARCHAR(128) NOT NULL DEFAULT 'SELLERINV',
  Advised_Amount FLOAT                 DEFAULT 0,
  Status         VARCHAR(64)  DEFAULT 'OPEN'
);

DROP TABLE IF EXISTS tPaymentHeader;
CREATE TABLE tPaymentHeader
(
  Payment_ID        INT         AUTO_INCREMENT PRIMARY KEY,
  Transaction_Date  DATETIME    DEFAULT now(),
  Created_By        INT         DEFAULT NULL,
  Status            VARCHAR(64) DEFAULT 'OPEN', -- OPEN, CLOSED
  Status_Changed_On DATETIME    DEFAULT now(),
  Last_Updated_On   DATETIME    DEFAULT now(),
  Last_Updated_By   INT         DEFAULT NULL
);


DROP TABLE IF EXISTS tPaymentDetail;
CREATE TABLE tPaymentDetail
(
  Payment_ID      INT          NOT NULL,
  Advice_ID       INT          NOT NULL,
  Bill_ID         INT          NOT NULL,
  Bill_Type       VARCHAR(128) NOT NULL DEFAULT 'SELLERINV',
  Payment_Date    DATETIME              DEFAULT now(),
  Paid_Amount     FLOAT                 DEFAULT 0,
  UTR             VARCHAR(256),
  Voucher_Number  VARCHAR(256),
  Voucher_Date    DATE                  DEFAULT NULL,
  Bank_ID         INT                   DEFAULT NULL,
  Bank_Name       VARCHAR(1024)         DEFAULT NULL,
  Payer_Bank_ID   INT                   DEFAULT NULL,
  Payer_Bank_Name VARCHAR(1024)         DEFAULT NULL,
  Remarks         VARCHAR(4048)
                  CHARACTER SET utf8
                  COLLATE utf8_unicode_ci
);

/* Vault */


/* File / Folder type properties */
DROP TABLE IF EXISTS tFileFolderType;
CREATE TABLE tFileFolderType
(
  Type_ID   INT                     AUTO_INCREMENT PRIMARY KEY,
  Type      VARCHAR(1024) NOT NULL,
  Display   VARCHAR(1024)
            CHARACTER SET utf8
            COLLATE utf8_unicode_ci DEFAULT NULL,
  Type_Code VARCHAR(264)  NOT NULL,
  Is_Delete INT                     DEFAULT 0
);

DROP TABLE IF EXISTS tFileFolderProperties;
CREATE TABLE tFileFolderProperties
(
  Property_ID      INT AUTO_INCREMENT PRIMARY KEY,
  Type_ID          INT           NOT NULL,
  Property         VARCHAR(1024) NOT NULL,
  Display_Property VARCHAR(1024) NOT NULL,
  Datatype         VARCHAR(64),
  Is_Mandatory     INT DEFAULT 0,
  Default_Value    VARCHAR(1024),
  Proc_Name        VARCHAR(1024)
);

/* Tags */
DROP TABLE IF EXISTS tTags;
CREATE TABLE tTags
(
  Tag_ID      INT      AUTO_INCREMENT PRIMARY KEY,
  Tag         VARCHAR(264)
              CHARACTER SET utf8
              COLLATE utf8_unicode_ci,
  Created_By  INT      DEFAULT NULL,
  Created_On  DATETIME DEFAULT now(),
  Is_Approved INT      DEFAULT 0
);

DROP TABLE IF EXISTS tVault;
CREATE TABLE tVault
(
  Vault_ID        INT          AUTO_INCREMENT PRIMARY KEY,
  Created_On      DATETIME     DEFAULT now(),
  Created_By      INT          DEFAULT NULL,
  Type            VARCHAR(64) NOT NULL, -- File / Folder
  Name            VARCHAR(1024)
                  CHARACTER SET utf8
                  COLLATE utf8_unicode_ci,
  File_Type       VARCHAR(264) DEFAULT NULL, -- Returns / Invoice etc
  Left_Node       INT         NOT NULL,
  Right_Node      INT         NOT NULL,
  Is_Delete       INT          DEFAULT 0,
  Parent_ID       INT          DEFAULT NULL,
  Last_Updated_On DATETIME     DEFAULT now(),
  Last_Updated_By INT          DEFAULT NULL
);


DROP TABLE IF EXISTS tVaultTags;
CREATE TABLE tVaultTags
(
  _ID      INT AUTO_INCREMENT PRIMARY KEY,
  Vault_ID INT NOT NULL,
  Tag_ID   INT NOT NULL
);

DROP TABLE IF EXISTS tVaultRoleAccess;
CREATE TABLE tVaultRoleAccess
(
  _ID        INT    AUTO_INCREMENT PRIMARY KEY,
  Vault_ID   INT NOT NULL,
  Role_ID    INT,
  Access_Bit BIGINT DEFAULT 11010000 -- Add, Update, Delete, View, Download, Share
);

DROP TABLE IF EXISTS tVaultUserAccess;
CREATE TABLE tVaultUserAccess
(
  _ID               INT         AUTO_INCREMENT PRIMARY KEY,
  Vault_ID          INT,
  User_Or_Entity_ID INT,
  Type              VARCHAR(64) DEFAULT 'USER', -- USER or Entity
  Access_Bit        BIGINT      DEFAULT 11010000 -- Add, Update, Delete, View, Download, Share
);

DROP TABLE IF EXISTS tVaultProperties;
CREATE TABLE tVaultProperties
(
  _ID            INT                     AUTO_INCREMENT PRIMARY KEY,
  Vault_ID       INT NOT NULL,
  Financial_Year YEAR                    DEFAULT NULL,
  Document_Date  DATE                    DEFAULT NULL,
  State_ID       INT                     DEFAULT NULL,
  City_ID        INT                     DEFAULT NULL,
  Remarks        TEXT CHARACTER SET utf8
                 COLLATE utf8_unicode_ci DEFAULT NULL
);

/* Recent File View */
DROP TABLE IF EXISTS tVaultFileView;
CREATE TABLE tVaultFileView
(
  _ID         INT      AUTO_INCREMENT PRIMARY KEY,
  Vault_ID    INT NOT NULL,
  Viewed_On   DATETIME DEFAULT now(),
  Viewed_By   INT NOT NULL,
  Total_Views INT      DEFAULT 1
);

DROP TABLE IF EXISTS tVaultFavorite;
CREATE TABLE tVaultFavorite
(
  _ID        INT      AUTO_INCREMENT PRIMARY KEY,
  User_ID    INT,
  Vault_ID   INT,
  Created_On DATETIME DEFAULT now()
);

/* WH Stock Adjustment */

DROP TABLE IF EXISTS tWHStockAdjustmentHeader;
CREATE TABLE tWHStockAdjustmentHeader
(
  Adjustment_ID   INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By      INT      DEFAULT NULL,
  Created_On      DATETIME DEFAULT now(),
  Adjustment_Date DATE,
  WH_ID           INT NOT NULL,
  Remarks         VARCHAR(4048)
                  CHARACTER SET utf8
                  COLLATE utf8_unicode_ci,
  Last_Updated_On DATETIME DEFAULT now(),
  Last_Updated_By INT      DEFAULT NULL
);


DROP TABLE IF EXISTS tWHStockAdjustmentDetail;
CREATE TABLE tWHStockAdjustmentDetail
(
  Adjustment_ID INT NOT NULL,
  Category_ID   INT NOT NULL,
  Quantity      FLOAT,
  Is_Credit     INT
);

DROP TABLE IF EXISTS tWHStockBalance;
CREATE TABLE tWHStockBalance
(
  _ID             INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By      INT      DEFAULT NULL,
  Created_On      DATETIME DEFAULT now(),
  Financial_Year   YEAR NOT NULL,
  WH_ID           INT  NOT NULL,
  Category_ID     INT,
  Opening_Date    DATE,
  Opening_Balance FLOAT,
  Closing_Date    DATE,
  Closing_Balance FLOAT
);

DROP TABLE IF EXISTS tStatus;
CREATE TABLE tStatus (
  Status_ID        INT PRIMARY KEY AUTO_INCREMENT,
  Transaction_Type VARCHAR(264) NOT NULL,
  Status_Display   VARCHAR(264)    DEFAULT NULL,
  Is_Final         INT             DEFAULT 0,
  Is_Default       int             DEFAULT 0
);

DROP TABLE IF EXISTS tDepartment;
CREATE TABLE tDepartment (
  Department_ID   INT PRIMARY KEY AUTO_INCREMENT,
  Department_Name VARCHAR(264) NOT NULL,
  Is_Delete       INT             DEFAULT 0,
  Last_Updated_On DATETIME        DEFAULT now(),
  Last_Updated_By INT             DEFAULT NULL
);

DROP TABLE IF EXISTS tTicketType;
CREATE TABLE tTicketType (
  Ticket_Type_ID INT PRIMARY KEY AUTO_INCREMENT,
  Ticket_Type    VARCHAR(100) NOT NULL
);


DROP TABLE IF EXISTS tTicket;
CREATE TABLE tTicket (
  Ticket_ID      INT PRIMARY KEY AUTO_INCREMENT,
  Created_On     DATETIME        DEFAULT now(),
  Created_By     INT,
  Ticket_Type    INT             DEFAULT NULL,
  Category       VARCHAR(64)     DEFAULT NULL, -- Lookup FreqType
  Severity       VARCHAR(64), -- Lookup
  Status_ID      INT,
  Root_Cause     TEXT CHARACTER SET utf8
                 COLLATE utf8_unicode_ci,
  Title          VARCHAR(1024)
                 CHARACTER SET utf8
                 COLLATE utf8_unicode_ci,
  Description    TEXT CHARSET utf8
                 COLLATE utf8_unicode_ci,
  Department_ID  INT,
  Transaction_ID INT             DEFAULT NULL
);



DROP TABLE IF EXISTS tTicketTags;
CREATE TABLE tTicketTags (

  Ticket_ID INT NOT NULL,
  Tag_ID    INT NOT NULL
);


DROP TABLE IF EXISTS tWorkflow;
CREATE TABLE tWorkflow
(
  Workflow_ID      INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By       INT      DEFAULT NULL,
  Created_On       DATETIME DEFAULT now(),
  Transaction_ID   INT         NOT NULL,
  Transaction_Type VARCHAR(64) NOT NULL,
  Assigned_By      INT      DEFAULT NULL,
  Current_Assignee INT         NOT NULL,
  Assigned_On      DATETIME DEFAULT now(),
  Comments         TEXT CHARACTER SET utf8
                   COLLATE utf8_unicode_ci,
  Status_ID        INT,
  Last_Updated_By  INT,
  Last_Updated_On  DATETIME DEFAULT now()
);

DROP TABLE IF EXISTS tWorkflowHistory;
CREATE TABLE tWorkflowHistory
(
  _ID         INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By  INT,
  Created_On  DATETIME DEFAULT now(),
  Workflow_ID INT NOT NULL,
  Assigned_By INT,
  Assigned_To INT,
  Comments    TEXT CHARACTER SET utf8
              COLLATE utf8_unicode_ci
);

/* Workflow */

DROP TABLE IF EXISTS tWorkflow;
CREATE TABLE tWorkflow
(
  Workflow_ID      INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By       INT      DEFAULT NULL,
  Created_On       DATETIME DEFAULT now(),
  Transaction_ID   INT         NOT NULL,
  Transaction_Type VARCHAR(64) NOT NULL,
  Assigned_By      INT      DEFAULT NULL,
  Current_Assignee INT         NOT NULL,
  Assigned_On      DATETIME DEFAULT now(),
  Comments         TEXT CHARACTER SET utf8
                   COLLATE utf8_unicode_ci,
  Status_ID        INT,
  Last_Updated_By  INT,
  Last_Updated_On  DATETIME DEFAULT now()
);

DROP TABLE IF EXISTS tWorkflowHistory;
CREATE TABLE tWorkflowHistory
(
  _ID         INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By  INT,
  Created_On  DATETIME DEFAULT now(),
  Workflow_ID INT NOT NULL,
  Assigned_By INT,
  Assigned_To INT,
  Comments    TEXT CHARACTER SET utf8
              COLLATE utf8_unicode_ci
);

/* Debit and Credit Notes */
DROP TABLE IF EXISTS tDebitCreditNoteHeader;
CREATE TABLE tDebitCreditNoteHeader
(
  Note_ID          INT           AUTO_INCREMENT PRIMARY KEY,
  Created_By       INT,
  Created_On       DATETIME      DEFAULT now(),
  Transaction_Date DATE,
  Note_Type        VARCHAR(64), -- Lookup NOTEDEBIT, NOTECREDIT
  Transaction_ID   INT NOT NULL,
  Transaction_Type VARCHAR(64),
  Remarks          VARCHAR(4048)
                   CHARACTER SET utf8
                   COLLATE utf8_unicode_ci,
  Voucher_Number   VARCHAR(1024) DEFAULT NULL,
  Voucher_Date     DATE          DEFAULT NULL,
  Status_ID        INT, -- OPEN, APPROVED, REJECTED, CLOSED
  Current_Assignee INT           DEFAULT NULL,
  Assigned_On      DATETIME      DEFAULT now(),
  Last_Updated_On  DATETIME      DEFAULT now(),
  Last_Updated_By  INT
);


DROP TABLE IF EXISTS tDebitCreditNoteDetail;
CREATE TABLE tDebitCreditNoteDetail
(
  _ID           INT   AUTO_INCREMENT PRIMARY KEY,
  Note_ID       INT NOT NULL,
  Item_ID       INT   DEFAULT NULL, -- For Vendor and Recycler it is category for Logistic cost it may be item id
  Rate          FLOAT DEFAULT 0,
  GST           FLOAT DEFAULT 0,
  Approved_Rate FLOAT DEFAULT 0,
  Approved_GST  FLOAT DEFAULT 0
);

DROP TABLE IF EXISTS tDebitCreditNoteHistory;
CREATE TABLE tDebitCreditNoteHistory
(
  _ID         INT      AUTO_INCREMENT PRIMARY KEY,
  Note_ID     INT NOT NULL,
  Created_On  DATETIME DEFAULT now(),
  Assigned_By INT,
  Assigned_To INT,
  Comments    VARCHAR(4048)
              CHARACTER SET utf8
              COLLATE utf8_unicode_ci
);


DROP TABLE IF EXISTS tLoginLog;
CREATE TABLE tLoginLog
(
  _ID            INT           AUTO_INCREMENT PRIMARY KEY,
  User_ID        INT NOT NULL,
  Logged_In_Time DATETIME      DEFAULT now(),
  User_Agent     VARCHAR(4048) DEFAULT NULL,
  Device_ID      TEXT          DEFAULT NULL,
  Device_Type    VARCHAR(64),
  Other_Detail   TEXT CHARACTER SET utf8
                 COLLATE utf8_unicode_ci
);


DROP TABLE IF EXISTS tExcelHelperHeader;
CREATE TABLE tExcelHelperHeader
(
  Excel_ID         INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By       INT      DEFAULT NULL,
  Created_On       DATETIME DEFAULT now(),
  Object_Type      VARCHAR(264) NOT NULL,
  Transaction_Type VARCHAR(264) NOT NULL,
  Is_Active        INT      DEFAULT 1,
  Last_Updated_By  INT      DEFAULT NULL,
  Last_Updated_On  DATETIME DEFAULT now()
);


DROP TABLE IF EXISTS tExcelHelperDetail;
CREATE TABLE tExcelHelperDetail
(
  _ID              INT           AUTO_INCREMENT PRIMARY KEY,
  Excel_ID         INT           NOT NULL,
  Column_Name      VARCHAR(1024) NOT NULL,
  Column_Type      VARCHAR(64), -- INT, STRING, DATE, FLOAT
  Attribute        VARCHAR(1024) DEFAULT NULL,
  Default_Value    VARCHAR(4048),
  Is_Mandatory     INT           DEFAULT 0,
  Is_Upload_Column INT           DEFAULT 0,
  Sort_Order       INT           DEFAULT 1
);


-- Billing

DROP TABLE IF EXISTS tJobType;
CREATE TABLE tJobType
(
  JobType_ID      INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By      INT      DEFAULT NULL,
  Created_On      DATETIME DEFAULT now(),
  JobType         VARCHAR(4048)
                  CHARACTER SET utf8
                  COLLATE utf8_unicode_ci,
  JobType_Display VARCHAR(4048)
                  CHARACTER SET utf8
                  COLLATE utf8_unicode_ci,
  Is_Delete       INT      DEFAULT 0,
  Last_Updated_By INT      DEFAULT NULL,
  Last_Updated_On DATETIME DEFAULT now()
);


DROP TABLE IF EXISTS tObjectJobType;
CREATE TABLE tObjectJobType
(
  Object_JobType_ID INT  AUTO_INCREMENT PRIMARY KEY,
  Object_Type       VARCHAR(264) NOT NULL,
  JobType_ID        INT          NOT NULL,
  Active_From       DATE DEFAULT NULL,
  Active_To         DATE DEFAULT NULL
);

/* Draft Billing */
DROP TABLE IF EXISTS tBillDraftHeader;
CREATE TABLE tBillDraftHeader
(
  Draft_ID              INT           AUTO_INCREMENT PRIMARY KEY,
  Created_On            DATETIME      DEFAULT now(),
  Created_By            INT           DEFAULT NULL,
  Entity_ID             INT          NOT NULL
  COMMENT 'Bill for which entity, like if BIll for logistic then this should be Logistic Entity_ID',
  Transaction_ID        INT          NOT NULL,
  Object_Type           VARCHAR(264) NOT NULL,
  Description           TEXT CHARACTER SET utf8
                        COLLATE utf8_unicode_ci,
  Other_Price           FLOAT         DEFAULT 0,
  Total_Base_Amount     FLOAT,
  Total_GST_Amount      FLOAT,
  Transportation_Number VARCHAR(1024) DEFAULT NULL,
  Last_Updated_On       DATETIME      DEFAULT now(),
  Last_Updated_By       INT           DEFAULT NULL
);

DROP TABLE IF EXISTS tBillDraftDetail;
CREATE TABLE tBillDraftDetail
(
  Draft_ID   INT NOT NULL,
  JobType_ID INT,
  Quantity   FLOAT DEFAULT 1,
  UOM_ID     INT,
  Price      FLOAT DEFAULT 0,
  GST        FLOAT DEFAULT 0
);

/* Actual Billing */
DROP TABLE IF EXISTS tBillHeader;
CREATE TABLE tBillHeader
(
  Bill_ID           INT         AUTO_INCREMENT PRIMARY KEY,
  Created_On        DATETIME    DEFAULT now(),
  Created_By        INT         DEFAULT NULL,
  Entity_ID         INT           NOT NULL
  COMMENT 'Bill for which entity, like if BIll for logistic then this should be Logistic Entity_ID',
  Bill_Type         VARCHAR(64) DEFAULT NULL,
  Bill_Frequency    VARCHAR(64) DEFAULT NULL,
  From_Date         DATE        DEFAULT NULL,
  To_Date           DATE        DEFAULT NULL,
  Bill_Date         DATE,
  Bill_Number       VARCHAR(1024) NOT NULL,
  Description       TEXT CHARACTER SET utf8
                    COLLATE utf8_unicode_ci,
  Other_Price       FLOAT       DEFAULT 0,
  Total_Base_Amount FLOAT,
  Total_GST_Amount  FLOAT,
  Total_Payable_Base_Amount FLOAT DEFAULT 0,
  Total_Payable_GST_Amount FLOAT DEFAULT 0,
  Total_Payable_GST_Prcernt FLOAT DEFAULT 0,
  Total_Payable_Amount FLOAT DEFAULT 0,
  Final_Remarks TEXT CHARACTER SET utf8
COLLATE utf8_unicode_ci DEFAULT NULL,
  Payment_Status    VARCHAR(64),
  Approved_By       INT         DEFAULT NULL,
  Last_Updated_On   DATETIME    DEFAULT now(),
  Last_Updated_By   INT,
  Status VARCHAR(64) DEFAULT 'OPEN'
);

DROP TABLE IF EXISTS tBillDetail;
CREATE TABLE tBillDetail
(
  Bill_Detail_ID        INT           AUTO_INCREMENT PRIMARY KEY,
  Bill_ID               INT          NOT NULL,
  Transaction_ID        INT          NOT NULL,
  Object_Type           VARCHAR(264) NOT NULL,
  Transportation_Number VARCHAR(1024) DEFAULT NULL
);

DROP TABLE IF EXISTS tBillDetailPrice;
CREATE TABLE tBillDetailPrice
(
  Bill_Detail_ID INT NOT NULL,
  JobType_ID     INT,
  Quantity       FLOAT DEFAULT 1,
  UOM_ID         INT,
  Price          FLOAT DEFAULT 0,
  GST            FLOAT DEFAULT 0
);


DROP TABLE IF EXISTS tPaymentLedgerTotal;
CREATE TABLE tPaymentLedgerTotal
(
  _ID             INT   AUTO_INCREMENT PRIMARY KEY,
  Entity_ID       INT NOT NULL,
  Opening_Date    DATE  DEFAULT NULL,
  Opening_Balance FLOAT DEFAULT 0,
  Closing_Date    DATE  DEFAULT NULL,
  Closing_Balance FLOAT DEFAULT 0
);

DROP TABLE IF EXISTS tPaymentLedger;
CREATE TABLE tPaymentLedger
(
  _ID                 INT      AUTO_INCREMENT PRIMARY KEY,
  Entity_ID           INT NOT NULL,
  Created_Date        DATETIME DEFAULT now(),
  Transaction_Date    DATETIME DEFAULT now(),
  Payment_Description TEXT CHARACTER SET utf8
                      COLLATE utf8_unicode_ci,
  Type                VARCHAR(1024),
  Transaction_ID      INT,
  Object_Type         VARCHAR(264),
  Amount              FLOAT    DEFAULT 0,
  Closing_Balance     FLOAT    DEFAULT 0
);

/* Planning  */

/* Procurement */
DROP TABLE IF EXISTS tCollectionPlan;
CREATE TABLE tCollectionPlan
(
  Plan_ID              INT      AUTO_INCREMENT PRIMARY KEY,
  Created_On           DATETIME DEFAULT now(),
  Created_By           INT      DEFAULT NULL,
  Month                INT  NOT NULL,
  Year                 YEAR NOT NULL,
  Category_ID          INT  NOT NULL,
  City_ID              INT  NOT NULL,
  Quantity             FLOAT    DEFAULT 0,
  Price                FLOAT    DEFAULT 0,
  Quantity_To_WH       FLOAT    DEFAULT 0,
  Quantity_To_Recycler FLOAT    DEFAULT 0,
  Last_Updated_By      INT      DEFAULT NULL,
  Last_Updated_On      DATETIME DEFAULT now()
);

/* Recycle */
DROP TABLE IF EXISTS tRecyclePlanHeader;
CREATE TABLE tRecyclePlanHeader
(
  Plan_ID      INT      AUTO_INCREMENT PRIMARY KEY,
  Created_On   DATETIME DEFAULT now(),
  Created_By   INT      DEFAULT NULL,
  Month        INT  NOT NULL,
  Year         YEAR NOT NULL,
  Category_ID  INT  NOT NULL,
  From_City_ID INT      DEFAULT NULL, -- Direct
  From_WH_ID   INT      DEFAULT NULL, -- From WH
   Status VARCHAR(24) DEFAULT 'UNCHANGED'
);

DROP TABLE IF EXISTS tRecyclePlanDetail;
CREATE TABLE tRecyclePlanDetail
(
  Plan_Detail_ID INT   AUTO_INCREMENT PRIMARY KEY,
  Plan_ID        INT NOT NULL,
  Recycler_ID    INT NOT NULL,
  Quantity       FLOAT DEFAULT 0
);

/* Logistics */
DROP TABLE IF EXISTS tLogisticPlanHeader;
CREATE TABLE tLogisticPlanHeader
(
  Plan_ID    INT         AUTO_INCREMENT PRIMARY KEY,
  Created_On DATETIME    DEFAULT now(),
  Created_By INT         DEFAULT NULL,
  Month      INT  NOT NULL,
  Year       YEAR NOT NULL,
  Quantity   FLOAT       DEFAULT 0,
  From_ID    INT         DEFAULT NULL,
  To_ID      INT         DEFAULT NULL,
  From_Type  VARCHAR(64) DEFAULT NULL
  COMMENT 'CITY, WH',
  To_Type    VARCHAR(64) DEFAULT NULL
  COMMENT 'CITY, WH, RECYLER',
  Status VARCHAR(24) DEFAULT 'UNCHANGED'
);

DROP TABLE IF EXISTS tLogisticPlanDetail;
CREATE TABLE tLogisticPlanDetail
(
  Plan_Detail_ID INT   AUTO_INCREMENT PRIMARY KEY,
  Plan_ID        INT NOT NULL,
  LSP_ID         INT NOT NULL,
  Rate           FLOAT DEFAULT 0
);

/* Allocation */
DROP TABLE IF EXISTS tAllocationPlanHeader;
CREATE TABLE tAllocationPlanHeader
(
  Plan_ID     INT      AUTO_INCREMENT PRIMARY KEY,
  Created_On  DATETIME DEFAULT now(),
  Created_By  INT      DEFAULT NULL,
  Month       INT  NOT NULL,
  Year        YEAR NOT NULL,
  Category_ID INT  NOT NULL,
  Quantity    FLOAT    DEFAULT 0,
  Status VARCHAR(24) DEFAULT 'UNCHANGED'
);

DROP TABLE IF EXISTS tAllocationPlanDetail;
CREATE TABLE tAllocationPlanDetail
(
  Plan_Detail_ID INT   AUTO_INCREMENT PRIMARY KEY,
  Plan_ID        INT NOT NULL,
  Producer_ID    INT NOT NULL,
  Quantity       FLOAT DEFAULT 0
);

/* Finance */
DROP TABLE IF EXISTS tFinancePlanHeader;
CREATE TABLE tFinancePlanHeader
(
  Plan_ID    INT      AUTO_INCREMENT PRIMARY KEY,
  Created_On DATETIME DEFAULT now(),
  Created_By INT      DEFAULT NULL,
  Month      INT  NOT NULL,
  Year       YEAR NOT NULL
);


DROP TABLE IF EXISTS tFinancePlanDetail;
CREATE TABLE tFinancePlanDetail
(
  Plan_Detail_ID INT   AUTO_INCREMENT PRIMARY KEY,
  Plan_ID        INT NOT NULL,
  Cost_Type      VARCHAR(64) COMMENT '',
  Cost           FLOAT DEFAULT 0
);


/* Other Pickups (BK, RWA etc) */

DROP TABLE IF EXISTS tOtherPickupHeader;
CREATE TABLE tOtherPickupHeader
(
  Pickup_ID              INT           AUTO_INCREMENT PRIMARY KEY,
  Created_By             INT           DEFAULT NULL,
  Created_On             DATETIME      DEFAULT now(),
  Entity_ID              INT           DEFAULT NULL,
  Entity_Name            TEXT          DEFAULT NULL,
  Ref_Date               DATE          DEFAULT NULL,
  Ref_Number             VARCHAR(1024) DEFAULT NULL,
  Firm_Name VARCHAR(1024) DEFAULT NULL,
  Address1 VARCHAR(1024) DEFAULT NULL,
  Address2 VARCHAR(1024) DEFAULT NULL,
  Pincode INT DEFAULT NULL,
  State_ID INT DEFAULT NULL,
  City_ID INT DEFAULT NULL,
  LSP_ID                 INT           DEFAULT NULL,
  Other                  VARCHAR(1024) DEFAULT NULL,
  Truck_No               VARCHAR(1024) DEFAULT NULL,
  Driver_Number          VARCHAR(264),
  Driver_Name            VARCHAR(264),
  To_ID                  INT           DEFAULT NULL
  COMMENT 'WH_ID or Recycler_ID',
  To_Type                VARCHAR(264)  DEFAULT NULL
  COMMENT 'WH or RECYCLER',
  Freight_Charges        FLOAT         DEFAULT 0,
  Is_Doc_Required        INT           DEFAULT 0,
  Can_Allocate_To_Others INT           DEFAULT 1,
  Is_Committed           INT           DEFAULT 0,
  Last_Updated_By        INT           DEFAULT NULL,
  Last_Updated_On        DATETIME      DEFAULT now(),
  Type VARCHAR(24) DEFAULT 'RULED'
);

DROP TABLE IF EXISTS tOtherPickupDetail;
CREATE TABLE tOtherPickupDetail
(
  Pickup_Detail_ID INT   AUTO_INCREMENT PRIMARY KEY,
  Pickup_ID        INT NOT NULL,
  Item_Desc        TEXT CHARACTER SET utf8
                   COLLATE utf8_unicode_ci,
  Category_ID      INT   DEFAULT NULL,
  Quantity_Kg      FLOAT DEFAULT 0,
  Quantity_Num     FLOAT DEFAULT 0,
  Total_Price      FLOAT DEFAULT 0
  COMMENT 'Total Price inculding GST. THis price is not per unit price, its a total price',
  Recycled_Quantity FLOAT DEFAULT 0
);

DROP TABLE IF EXISTS tOtherPickupInvoiceHeader;
CREATE TABLE tOtherPickupInvoiceHeader
(
  Invoice_ID           INT           AUTO_INCREMENT PRIMARY KEY,
  Created_By           INT           DEFAULT NULL,
  Created_On           DATETIME      DEFAULT now(),
  Pickup_ID            INT default NULL,
  Invoice_Number       VARCHAR(1024) DEFAULT NULL,
  Invoice_Date         DATE          DEFAULT NULL,
  Recycler_ID          INT NOT NULL,
  Invoice_Base_Amount  FLOAT         DEFAULT 0,
  Invoice_GST_Amount   FLOAT         DEFAULT 0,
  Invoice_Total_Amount FLOAT         DEFAULT 0,
  Status               VARCHAR(64)   DEFAULT 'CREATED',
  WH_ID                INT           DEFAULT NULL,
  LSP_ID               INT           DEFAULT NULL,
  Other                VARCHAR(1024) DEFAULT NULL,
  Truck_No             VARCHAR(1024) DEFAULT NULL,
  Driver_Number        VARCHAR(1024) DEFAULT NULL,
  Driver_Name          VARCHAR(1024) DEFAULT NULL,
  Is_Committed         INT           DEFAULT 0,
  Last_Updated_By      INT           DEFAULT NULL,
  Last_Updated_On      DATETIME      DEFAULT now()
);

DROP TABLE IF EXISTS tOtherPickupInvoiceDetail;
CREATE TABLE tOtherPickupInvoiceDetail
(
  Invoice_ID  INT NOT NULL,
  Item_Desc   TEXT CHARACTER SET utf8
              COLLATE utf8_unicode_ci DEFAULT NULL,
  Category_ID INT                     DEFAULT NULL,
  Quantity    FLOAT                   DEFAULT 0,
  Rate        FLOAT                   DEFAULT 0,
  GST         FLOAT                   DEFAULT 0,
  Pickup_ID INT DEFAULT NUL
);

DROP TABLE IF EXISTS tOtherPickupInvoiceDetailAllocation;
CREATE TABLE tOtherPickupInvoiceDetailAllocation
(
  Allocation_ID INT   AUTO_INCREMENT PRIMARY KEY,
  Invoice_ID    INT NOT NULL,
  Category_ID   INT NOT NULL,
  Producer_ID   INT NOT NULL,
  Quantity      FLOAT DEFAULT 0,
  Pickup_ID INT DEFAULT NULL
);


DROP TABLE IF EXISTS tCartItemAllocation;
CREATE TABLE tCartItemAllocation
(
  Allocation_ID    INT   AUTO_INCREMENT PRIMARY KEY,
  Cart_Item_ID     INT NOT NULL,
  Producer_ID      INT NOT NULL,
  Quantity         FLOAT DEFAULT 0,
  Is_Approved      INT   DEFAULT 0,
  Recycled_Quantity FLOAT DEFAULT 0,
  Returned_Quantity FLOAT DEFAULT 0,
  Un_Allocated_Quantity FLOAT DEFAULT 0
);


/* Allocate Producer/s for Inward Invoice */
DROP TABLE IF EXISTS tTempAllocation;
CREATE TABLE tTempAllocation
(
  Producer_ID  INT,
  Total_Target FLOAT,
  Total_Items  INT,
  Allocated    FLOAT
);


/* Notification tabele */
DROP TABLE IF EXISTS tNotificationConfig;
CREATE TABLE tNotificationConfig
(
  Notification_ID    INT AUTO_INCREMENT
    PRIMARY KEY,
  Created_On         DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Created_By         INT                                NULL,
  Object_Type        VARCHAR(256)                       NULL,
  Action             VARCHAR(256)                       NOT NULL,
  Context            VARCHAR(256)                       NULL,
  Is_Active          INT DEFAULT '1'                    NOT NULL,
  Notification_Type  VARCHAR(256)                       NOT NULL,
  Title              TEXT                               NOT NULL,
  Title_Config       TEXT                               NULL,
  Description        TEXT                               NOT NULL,
  Description_Config TEXT                               NULL,
  Image_Config       TEXT                               NULL
);


DROP TABLE IF EXISTS tNotificationDefaultRecipient;
CREATE TABLE tNotificationDefaultRecipient
(
  Notification_ID  INT          NOT NULL,
  Procedure_name   VARCHAR(256) NOT NULL,
  Procedure_Config TEXT         NULL
);

DROP TABLE IF EXISTS tNotificationRecipientGroup;
CREATE TABLE tNotificationRecipientGroup
(
  Notification_ID INT          NOT NULL,
  Recipient_ID    INT          NULL,
  Type            VARCHAR(256) NULL
);


DROP TABLE IF EXISTS tNotificationLog;
CREATE TABLE tNotificationLog
(
  Log_ID          INT AUTO_INCREMENT
    PRIMARY KEY,
  Notification_ID INT                                NULL,
  Sent_On         DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
  Title           TEXT                               NULL,
  Description     TEXT                               NULL,
  Image           TEXT                               NULL,
  Payload         TEXT                               NULL,
  URL             TEXT                               NULL,
  Object_ID       TEXT                               NULL,
  Recipients      TEXT                               NULL
);

DROP TABLE IF EXISTS tNotificationACK;
CREATE TABLE tNotificationACK
(
  Log_ID  INT                                NULL,
  User_ID INT                                NOT NULL,
  ACK_On  DATETIME DEFAULT CURRENT_TIMESTAMP NULL
);

DROP TABLE IF EXISTS tZonesManagers;
CREATE TABLE tZonesManagers
(
  Zone_ID    INT NOT NULL,
  Manager_ID INT NOT NULL
);

DROP TABLE IF EXISTS tOutwardRecycleAllocation;
CREATE TABLE tOutwardRecycleAllocation
(
  _ID                     INT   AUTO_INCREMENT PRIMARY KEY,
  Allocation_ID           INT NOT NULL,
  WH_GRN_ID               INT NOT NULL,
  Cart_Item_Allocation_ID INT NOT NULL,
  Quantity                FLOAT DEFAULT 0,
  Returned_Quantity FLOAT DEFAULT 0,
  Re_Allocated_Quantity FLOAT DEFAULT 0
);


DROP TABLE IF EXISTS tPDFViewConf;
CREATE TABLE tPDFViewConf
(
  _ID         INT AUTO_INCREMENT PRIMARY KEY,
  Producer_ID INT DEFAULT NULL,
  FY          INT DEFAULT NULL,
  Is_Inward   INT DEFAULT 0
);

DROP TABLE IF EXISTS tAppVersions;
CREATE TABLE tAppVersions
(
  _ID             INT                            AUTO_INCREMENT PRIMARY KEY,
  Platform        ENUM ('ANDROID', 'IOS', 'WEB') DEFAULT 'ANDROID',
  Version_ID      INT                            DEFAULT NULL,
  Version_Number  VARCHAR(264)                   DEFAULT NULL,
  Release_Date    DATE NOT NULL,
  Release_Notes   TEXT CHARACTER SET utf8
                  COLLATE utf8_unicode_ci,
  Is_Force_Update INT                            DEFAULT 0
);


DROP TABLE IF EXISTS tCarryForwardItems;
CREATE TABLE tCarryForwardItems
(
  _ID             INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By      INT      DEFAULT NULL,
  Created_On      DATETIME DEFAULT now(),
  FY              INT NOT NULL,
  Bill_ID         INT NOT NULL,
  Category_ID     INT NOT NULL,
  Quantity        FLOAT    DEFAULT 0,
  Linked_Quantity FLOAT    DEFAULT 0,
  Last_Updated_By INT,
  Last_Updated_On DATETIME DEFAULT now()
);


DROP TABLE IF EXISTS tUnitTransportCost;
CREATE TABLE tUnitTransportCost
(
  Cost_ID         INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By      INT      DEFAULT NULL,
  Created_On      DATETIME DEFAULT now(),
  From_City       INT  NOT NULL,
  To_City         INT  NOT NULL,
  Avg_Cost        FLOAT    DEFAULT 0,
  Valid_From      DATE NOT NULL,
  Valid_To        DATE NOT NULL,
  Last_Updated_On DATETIME DEFAULT now(),
  Last_Updated_By INT      DEFAULT NULL
);


DROP TABLE IF EXISTS tRecyclerPaymentHeader;
CREATE TABLE tRecyclerPaymentHeader
(
  Payment_ID      INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By      INT      DEFAULT NULL,
  Created_On      DATETIME DEFAULT now(),
  Recycler_ID     INT NOT NULL,
  Payment_Date    DATE     DEFAULT NULL,
  UTR             VARCHAR(1024),
  Total_Amount    FLOAT    DEFAULT 0,
  Remarks         TEXT CHARACTER SET utf8
                  COLLATE utf8_unicode_ci,
  Last_Updated_On DATETIME DEFAULT now(),
  Last_Updated_By INT      DEFAULT NULL
);

DROP TABLE IF EXISTS tRecyclerPaymentDetail;
CREATE TABLE tRecyclerPaymentDetail
(
  Payment_Detail_ID INT   AUTO_INCREMENT PRIMARY KEY,
  Payment_ID        INT NOT NULL,
  Invoice_ID        INT NOT NULL,
  Total             FLOAT DEFAULT 0
);

DROP TABLE IF EXISTS tRecyclerPaymentDetailItems;
CREATE TABLE tRecyclerPaymentDetailItems
(
  Payment_Detail_ID INT NOT NULL,
  Category_ID       INT NOT NULL,
  Price             FLOAT DEFAULT 0,
  GST               FLOAT DEFAULT 0
);

DROP TABLE IF EXISTS tDailyPlan;
CREATE TABLE tDailyPlan
(
  Plan_ID            INT         AUTO_INCREMENT PRIMARY KEY,
  Created_By         INT         DEFAULT NULL,
  Created_On         DATETIME    DEFAULT now(),
  City_ID            INT NOT NULL,
  Dispatch_Date      DATE,
  Dispatch_Type      VARCHAR(64) DEFAULT 'WH'
  COMMENT 'WH, RECYCLER',
  Recycler_ID        INT         DEFAULT NULL,
  LSP_ID             INT         DEFAULT NULL,
  Other_LSP          VARCHAR(64) DEFAULT NULL,
  Category_ID        INT NOT NULL,
  Tentative_Quantity FLOAT       DEFAULT 0,
  Quantity           FLOAT       DEFAULT 0,
  Type               VARCHAR(62) DEFAULT 'INWARD'
  COMMENT 'INWARD, OUTWARD',
  Status             VARCHAR(64) DEFAULT 'OPEN'
  COMMENT 'OPEN, CLOSED',
  Remarks            TEXT CHARACTER SET utf8
                     COLLATE utf8_unicode_ci,
  Last_Updated_On    DATETIME    DEFAULT now(),
  Last_Updated_By    INT         DEFAULT NULL
);

DROP TABLE IF EXISTS tUserLocation;
CREATE TABLE tUserLocation
(
  User_ID         INT           NOT NULL,
  Location        VARCHAR(1024) NOT NULL,
  Last_Updated_On DATETIME
);

DROP TABLE IF EXISTS tMonthlyTargetHeader;
CREATE TABLE tMonthlyTargetHeader
(
  Target_ID       INT         AUTO_INCREMENT PRIMARY KEY,
  Created_By      INT         DEFAULT NULL,
  Created_On      DATETIME    DEFAULT now(),
  Year            INT NOT NULL,
  Month           INT NOT NULL,
  Type            VARCHAR(24) DEFAULT 'COLLECTION'
  COMMENT 'COLLECTION, RECYCLE',
  Zone_ID         INT         DEFAULT NULL,
  Total_Target    FLOAT       DEFAULT 0,
  Last_Updated_On DATETIME    DEFAULT now(),
  Last_Updated_By INT         DEFAULT NULL
);

DROP TABLE IF EXISTS tMonthlyTargetDetail;
CREATE TABLE tMonthlyTargetDetail
(
  Target_Detail_ID INT   AUTO_INCREMENT PRIMARY KEY,
  Target_ID        INT NOT NULL,
  Category_ID      INT NOT NULL,
  Target           FLOAT DEFAULT 0
);


DROP TABLE IF EXISTS tVerificationStagesMaster;
CREATE TABLE tVerificationStagesMaster
(
  Stage_ID      INT AUTO_INCREMENT PRIMARY KEY,
  Stage_Name    VARCHAR(1024)
                CHARACTER SET utf8
                COLLATE utf8_unicode_ci,
  Stage_Display VARCHAR(1024)
                CHARACTER SET utf8
                COLLATE utf8_unicode_ci,
  Applicable_To VARCHAR(64) -- SELLERINV, KAROINV, BCSI, BCKI
);


DROP TABLE IF EXISTS tVerificationStageUpdate;
CREATE TABLE tVerificationStageUpdate
(
  Update_ID      INT      AUTO_INCREMENT PRIMARY KEY,
  Created_By      INT      DEFAULT NULL,
  Created_On      DATETIME DEFAULT now(),
  Verification_ID INT,
  Stage_ID        INT NOT NULL
);

DROP TABLE IF EXISTS tInvoiceDraftDetailLink;
CREATE TABLE tInvoiceDraftDetailLink
(
  Draft_Invoice_ID INT NOT NULL,
  Category_ID      INT NOT NULL,
  Bill_ID          INT NOT NULL,
  Quantity         FLOAT DEFAULT 0
);


DROP TABLE IF EXISTS tPurchaseReturnHeader;
CREATE TABLE tPurchaseReturnHeader
(
  Return_ID             INT           AUTO_INCREMENT PRIMARY KEY,
  Created_By            INT           DEFAULT NULL,
  Created_On            DATETIME      DEFAULT now(),
  Bill_ID               INT  NOT NULL,
  Return_Date           DATE NOT NULL,
  LSP_ID                INT           DEFAULT NULL,
  Other_LSP             VARCHAR(64),
  Truck_Number          VARCHAR(1024),
  Driver_Name           VARCHAR(1024),
  Driver_Number         VARCHAR(1024),
  Remarks               TEXT
                        CHARACTER SET utf8
                        COLLATE utf8_unicode_ci,
  Transportation_Number VARCHAR(1024) DEFAULT NULL,
  Freight_Charges       FLOAT         DEFAULT 0,
  Last_Updated_On       DATETIME      DEFAULT now(),
  Last_Updated_By       INT           DEFAULT NULL
);

DROP TABLE IF EXISTS tPurchaseReturnDetail;
CREATE TABLE tPurchaseReturnDetail
(
  Return_Detail_ID INT   AUTO_INCREMENT PRIMARY KEY,
  Return_ID        INT NOT NULL,
  Category_ID      INT NOT NULL,
  Quantity         FLOAT DEFAULT 0,
  Rate             FLOAT DEFAULT 0,
  GST              FLOAT DEFAULT 0
);


DROP TABLE IF EXISTS tRecyclerReturnHeader;
CREATE TABLE tRecyclerReturnHeader
(
  Return_ID             INT         AUTO_INCREMENT PRIMARY KEY,
  Created_By            INT         DEFAULT NULL,
  Created_On            DATETIME    DEFAULT now(),
  Invoice_ID            INT,
  Return_Date           DATE NOT NULL,
  LSP_ID                INT         DEFAULT NULL,
  Other_LSP             VARCHAR(64),
  Truck_Number          VARCHAR(1024),
  Driver_Name           VARCHAR(1024),
  Driver_Number         VARCHAR(1024),
  Transportation_Number VARCHAR(1024),
  Remarks               TEXT
                        CHARACTER SET utf8
                        COLLATE utf8_unicode_ci,
  Return_Doc_Number     VARCHAR(1024),
  Return_Document_Date  VARCHAR(1024),
  Return_To             INT  NOT NULL
  COMMENT 'WH_ID, SELLER_ID, RECYCLER_ID',
  Return_To_Type        VARCHAR(64) DEFAULT 'WH'
  COMMENT 'WH, SELLER, RECYCLER',
  Last_Updated_On       DATETIME    DEFAULT now(),
  Last_Updated_By       INT         DEFAULT NULL
);


DROP TABLE IF EXISTS tRecyclerReturnDetail;
CREATE TABLE tRecyclerReturnDetail
(
  Return_Detail_ID     INT   AUTO_INCREMENT PRIMARY KEY,
  Return_ID            INT NOT NULL,
  Category_ID          INT NOT NULL,
  Quantity             FLOAT DEFAULT 0,
  Rate                 FLOAT,
  GST                  FLOAT,
  Re_Invoiced_Quantity FLOAT DEFAULT 0
);

DROP TABLE IF EXISTS tRecyclerReturnDetailInwards;
CREATE TABLE tRecyclerReturnDetailInwards
(
  Return_Detail_Inward_ID INT   AUTO_INCREMENT PRIMARY KEY,
  Return_Detail_ID        INT NOT NULL,
  Bill_ID                 INT NOT NULL,
  Quantity                FLOAT DEFAULT 0,
  Re_Invoiced_Quantity    FLOAT DEFAULT 0
);



DROP TABLE IF EXISTS tInvoiceDetailReturnLink;
CREATE TABLE tInvoiceDetailReturnLink
(
  Invoice_ID  INT NOT NULL,
  Category_ID INT NOT NULL,
  Return_ID   INT NOT NULL,
  Bill_ID     INT   DEFAULT NULL,
  Quantity    FLOAT DEFAULT 0
);


DROP TABLE IF EXISTS tProducerTargetParentCategoryDetail;
CREATE TABLE tProducerTargetParentCategoryDetail
(
  Producer_Target_Parent_Category_Detail_ID INT AUTO_INCREMENT PRIMARY KEY,
  Producer_Target_ID                        INT,
  Category_ID                               INT,
  Target_Value                              DECIMAL(16, 4),
  UOM_ID                                    INT DEFAULT 1
);


DROP TABLE IF EXISTS tProducerTargetSubCategoryPercentage;
CREATE TABLE tProducerTargetSubCategoryPercentage
(
  Percentage_ID                             INT AUTO_INCREMENT PRIMARY KEY,
  Producer_Target_Parent_Category_Detail_ID INT NOT NULL,
  Category_ID                               INT NOT NULL,
  Percentage                                DECIMAL(16, 4)
);


-- #Secondary
DROP TABLE IF EXISTS tSecondaryBillDraftHeader;
CREATE TABLE tSecondaryBillDraftHeader
(
  Secondary_Draft_ID    INT           AUTO_INCREMENT PRIMARY KEY,
  Draft_ID              INT NOT NULL,
  Entity_ID             INT NOT NULL,
  Description           TEXT CHARACTER SET utf8
                        COLLATE utf8_unicode_ci,
  Other_Price           FLOAT         DEFAULT 0,
  Total_Base_Amount     FLOAT         DEFAULT 0,
  Total_GST_Amount      FLOAT         DEFAULT 0,
  Transportation_Number VARCHAR(1024) DEFAULT NULL
);

DROP TABLE IF EXISTS tSecondaryBillDraftDetail;
CREATE TABLE tSecondaryBillDraftDetail
(
  Secondary_Draft_ID INT NOT NULL,
  JobType_ID         INT NOT NULL,
  Quantity           FLOAT DEFAULT 0,
  UOM_ID             INT   DEFAULT 1,
  Price              FLOAT DEFAULT 0,
  GST                FLOAT DEFAULT 0
);
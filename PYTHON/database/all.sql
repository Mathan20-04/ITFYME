/**
 * Author:  Nikesh
 * Created: May 12, 2017
 */
DELIMITER $$


DROP FUNCTION IF EXISTS fRemoveExtraChar;
CREATE FUNCTION fRemoveExtraChar(str VARCHAR(255))
  RETURNS VARCHAR(255)
    CHARSET latin1
  NO SQL
BEGIN
  DECLARE i, len SMALLINT DEFAULT 1;
  DECLARE ret CHAR(32) DEFAULT '';
  DECLARE c CHAR(1);
  SET len = CHAR_LENGTH(str);
  REPEAT
    BEGIN
      SET c = MID(str, i, 1);
      IF c REGEXP '[[:alnum:]]'
      THEN
        SET ret = CONCAT(ret, c);
      END IF;
      SET i = i + 1;
    END;
  UNTIL i > len END REPEAT;
  RETURN ret;
END;

DROP FUNCTION IF EXISTS fStripSpecialChars;
CREATE FUNCTION fStripSpecialChars(dirty_string VARCHAR(2048), allow_space TINYINT, allow_number TINYINT,
                                   allow_alphabets TINYINT, no_trim TINYINT)
  RETURNS VARCHAR(2048)
    CHARSET utf8
BEGIN
  DECLARE clean_string VARCHAR(2048) DEFAULT '';
  DECLARE c VARCHAR(2048) DEFAULT '';
  DECLARE counter INT DEFAULT 1;

  DECLARE has_space TINYINT DEFAULT 0; -- let spaces in result string
  DECLARE chk_cse TINYINT DEFAULT 0;
  DECLARE adv_trim TINYINT DEFAULT 1; -- trim extra spaces along with hidden characters, new line characters etc.

  IF allow_number = 0 AND allow_alphabets = 0
  THEN
    RETURN NULL;
  ELSEIF allow_number = 1 AND allow_alphabets = 0
  THEN
    SET chk_cse = 1;
  ELSEIF allow_number = 0 AND allow_alphabets = 1
  THEN
    SET chk_cse = 2;
  END IF;

  IF allow_space = 1
  THEN
    SET has_space = 1;
  END IF;

  IF no_trim = 1
  THEN
    SET adv_trim = 0;
  END IF;

  IF ISNULL(dirty_string)
  THEN
    RETURN NULL;
  ELSE

    CASE chk_cse
      WHEN 1
        THEN
          -- return only Numbers in result
          WHILE counter <= LENGTH(dirty_string) DO
          SET c = MID(dirty_string, counter, 1);

          IF ASCII(c) = 32 OR ASCII(c) >= 48 AND ASCII(c) <= 57
          THEN
            SET clean_string = CONCAT(clean_string, c);
          END IF;

          SET counter = counter + 1;
          END WHILE;
      WHEN 2
        THEN
          -- return only Alphabets in result
          WHILE counter <= LENGTH(dirty_string) DO
          SET c = MID(dirty_string, counter, 1);

          IF ASCII(c) = 32 OR ASCII(c) >= 65 AND ASCII(c) <= 90 OR ASCII(c) >= 97 AND ASCII(c) <= 122
          THEN
            SET clean_string = CONCAT(clean_string, c);
          END IF;

          SET counter = counter + 1;
          END WHILE;
      ELSE
        -- return numbers and Alphabets in result
        WHILE counter <= LENGTH(dirty_string) DO
        SET c = MID(dirty_string, counter, 1);

        IF ASCII(c) = 32 OR ASCII(c) >= 48 AND ASCII(c) <= 57 OR ASCII(c) >= 65 AND ASCII(c) <= 90 OR
           ASCII(c) >= 97 AND ASCII(c) <= 122
        THEN
          SET clean_string = CONCAT(clean_string, c);
        END IF;

        SET counter = counter + 1;
        END WHILE;
      END CASE;
  END IF;

  -- remove spaces from result
  IF has_space = 0
  THEN
    SET clean_string = REPLACE(clean_string, ' ', '');
  END IF;

  -- remove extra spaces, newline,tabs. from result
  IF adv_trim = 1
  THEN
    SET clean_string = TRIM(Replace(Replace(Replace(clean_string, '\t', ''), '\n', ''), '\r', ''));
  END IF;

  RETURN clean_string;
END;

DROP FUNCTION IF EXISTS fGetFinacialYear;
CREATE FUNCTION fGetFinacialYear(PMonth_Number INT)
  RETURNS YEAR
BEGIN
  DECLARE _year YEAR;
  DECLARE _fyear YEAR;
  SET _year = year(now());
  IF PMonth_Number = 0 OR PMonth_Number IS NULL
  THEN
    SET PMonth_Number = month(now());
  END IF;

  IF PMonth_Number <= 3
  THEN
    SET _fyear = _year -1;
  ELSE
    SET _fyear = _year;
  END IF;

  RETURN _fyear;

END;

DROP FUNCTION IF EXISTS fGetFirstDateOfWeek;
CREATE FUNCTION fGetFirstDateOfWeek(PDate DATE)
  RETURNS DATE
BEGIN
  RETURN SUBDATE(PDate, WEEKDAY(PDate));
END;

DROP FUNCTION IF EXISTS fGetFirstDateOfMonth;
CREATE FUNCTION fGetFirstDateOfMonth(PDate DATE)
  RETURNS DATE
BEGIN
  RETURN date_add(date_add(LAST_DAY(PDate), INTERVAL 1 DAY), INTERVAL -1 MONTH);
END;

-- select fGetFinacialYearByDate('2018-4-12')
DROP FUNCTION IF EXISTS fGetFinacialYearByDate;
CREATE FUNCTION fGetFinacialYearByDate(PDate DATE)
  RETURNS YEAR
  BEGIN
    DECLARE _year YEAR;
    #     DECLARE _fyear YEAR;
    #     DECLARE PMonth_Number INT;
    #
    #     SET _year = year(PDate);
    #     SET PMonth_Number = month(PDate);
    #
    #     IF PMonth_Number <= 3
    #     THEN
    #       SET _fyear = _year -1;
    #     ELSE
    #       SET _fyear = _year;
    #     END IF;
    #
    #     RETURN _fyear;

    SET _year = (SELECT Financial_Year
                 FROM tFinancialYear
                 WHERE PDate BETWEEN From_Date AND To_Date
                 LIMIT 0, 1);

    RETURN _year;

  END;

DROP FUNCTION IF EXISTS fGetAcademicYearByDate;
CREATE FUNCTION fGetAcademicYearByDate(PDate DATE)
  RETURNS YEAR
BEGIN
  DECLARE _year YEAR;
  DECLARE _fyear YEAR;
  DECLARE PMonth_Number INT;

  SET _year = year(PDate);
  SET PMonth_Number = month(PDate);

  IF PMonth_Number <= 4
  THEN
    SET _fyear = _year -1;
  ELSE
    SET _fyear = _year;
  END IF;

  RETURN _fyear;
END;

DROP FUNCTION IF EXISTS fGetFirstDateOfWeek;
CREATE FUNCTION fGetFirstDateOfWeek(PDate DATE)
  RETURNS DATE
BEGIN
  RETURN SUBDATE(PDate, WEEKDAY(PDate));
END;

DROP FUNCTION IF EXISTS fGetFirstDateOfMonth;
CREATE FUNCTION fGetFirstDateOfMonth(PDate DATE)
  RETURNS DATE
BEGIN
  RETURN date_add(date_add(LAST_DAY(PDate), INTERVAL 1 DAY), INTERVAL -1 MONTH);
END;

DROP FUNCTION IF EXISTS fGetFinacialYearByDate;
CREATE FUNCTION fGetFinacialYearByDate(PDate DATE)
  RETURNS YEAR
BEGIN
  DECLARE _year YEAR;
  DECLARE _fyear YEAR;
  DECLARE PMonth_Number INT;

  SET _year = year(PDate);
  SET PMonth_Number = month(PDate);

  IF PMonth_Number <= 3
  THEN
    SET _fyear = _year -1;
  ELSE
    SET _fyear = _year;
  END IF;

  RETURN _fyear;

END;

DROP FUNCTION IF EXISTS fGetKaroEntityID;
CREATE FUNCTION fGetKaroEntityID()
  RETURNS INT
BEGIN
  RETURN (SELECT Entity_ID
          FROM tEntity
          WHERE Entity_Type = 'ENTKARO'
          LIMIT 0, 1);
END;

DROP FUNCTION IF EXISTS fCheckIsSystemEntity;
CREATE FUNCTION fCheckIsSystemEntity(PEntity_ID INT)
  RETURNS INT
BEGIN
  RETURN (SELECT Is_System
          FROM tEntity
          WHERE Entity_ID = PEntity_ID
          LIMIT 0, 1);
END;

DROP FUNCTION IF EXISTS fGetKaroEntityName;
CREATE FUNCTION fGetKaroEntityName()
  RETURNS VARCHAR(1024)
BEGIN
  RETURN (SELECT Entity_Name
          FROM tEntity
          WHERE Entity_Type = 'ENTKARO'
          LIMIT 0, 1);
END;

DROP FUNCTION IF EXISTS fGetPrimaryUserIdForEntity;
CREATE FUNCTION fGetPrimaryUserIdForEntity(PEntity_ID INT)
  RETURNS INT
BEGIN
  RETURN (SELECT a.User_ID
          FROM tUserEntity a
                 INNER JOIN tUser b ON a.User_ID = b.User_ID
          WHERE a.Entity_ID = PEntity_ID
            AND b.Is_Primary = 1
          LIMIT
            0, 1);
END;

DROP FUNCTION IF EXISTS fGetWeekOfMonth;
CREATE FUNCTION fGetWeekOfMonth(PDate date) RETURNS INT
BEGIN
  RETURN FLOOR((DayOfMonth(PDate) - 1) / 7) + 1 ;
END;

DROP FUNCTION IF EXISTS SPLIT_UTF;
CREATE FUNCTION SPLIT_UTF(pStr LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci,
                          pDelim varchar(24),
                          pPos int) RETURNS longtext CHARSET utf8 COLLATE utf8_unicode_ci
begin
  declare pCheckExists int default 0;
  declare idx int;
  declare str LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
  declare start int;
  declare loopi int;
  declare delim varchar(24);
  declare pCount int default 1;
  declare returnStr LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci default "";
  set idx = 0;
  set loopi = 1;
  set str = pStr;
  set delim = pDelim;
  set idx = locate(delim, str);
  set start = 1;

  set pCheckExists = INSTR(pStr, delim);
  if pCheckExists = 0 and pPos = 1 then
    return pStr ;
  end if;

  if pCheckExists = 0 and pPos <> 1 then
    return "" ;
  end if;

  set pCount = fCountTokens(pStr, pDelim);
  if pPos > pCount then
    return "" ;
  end if;

  while (idx > 0 and loopi <= pPos) do
  set returnStr = substring(str, start, idx - 1) ;
  set str = substring(str, idx + 1, length(str)) ;
  if (loopi = pPos) then
    set loopi = pPos + 1 ;
  else
    set loopi = loopi + 1 ;
  end if;
  set idx = locate(delim, str);
  end while;

  if (idx = 0 and pPos = loopi) then
    return str ;
  else
    return returnStr ;
  end if;
end;

DROP FUNCTION IF EXISTS SPLIT_STR;
CREATE FUNCTION SPLIT_STR(strtosplit LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci,
                          delim char(1),
                          pos tinyint(2)) RETURNS LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci
BEGIN
  RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(strtosplit, delim, pos),
                           LENGTH(SUBSTRING_INDEX(strtosplit, delim, pos - 1)) + 1),
                 delim, '');
END;

DROP FUNCTION IF EXISTS fCountTokens;
CREATE FUNCTION `fCountTokens`(pStr LONGTEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci,
                               pDelim varchar(24)) RETURNS longtext CHARSET utf8 COLLATE utf8_unicode_ci
begin
  declare idx int;
  declare nCnt int;
  set idx = 0;
  set nCnt = 1;

  set idx = INSTR(pStr, pDelim);
  if (idx = 0) then
    return nCnt ;
  end if;

  while ((length(pStr) > 0) and (idx > 0)) do
  set pStr = substring(pStr, idx + 1, length(pStr)) ;
  set idx = INSTR(pStr, pDelim) ;
  set nCnt = nCnt + 1 ;
  end while;
  return nCnt;
end;

DROP FUNCTION IF EXISTS fGetRootUserID;
CREATE FUNCTION fGetRootUserID(User_ID INT)
  RETURNS INT
  DETERMINISTIC
BEGIN
  DECLARE _current_id INT;
  DECLARE _parent_id INT;

  SET _current_id = User_ID;
  WHILE _current_id > 0 DO
  SELECT IFNULL(parent_id, -1) INTO _current_id
  FROM (SELECT parent_id
        FROM tUser
        WHERE User_ID = _current_id) A;

  IF _current_id > 0
  THEN
    SET _parent_id = _current_id;
  END IF;
  END WHILE;

  RETURN _parent_id;
END;

DROP FUNCTION IF EXISTS fGetHierarchyUsers;
CREATE FUNCTION fGetHierarchyUsers(PUser_ID INT)
  RETURNS VARCHAR(1024)
BEGIN
  DECLARE pUserIDs VARCHAR(1024);

  SET @pv = NULL;

  SET pUserIDs = (SELECT GROUP_CONCAT(lv SEPARATOR ',')
                  FROM (
                         SELECT @pv := (SELECT GROUP_CONCAT(User_ID SEPARATOR ',')
                                        FROM tUser
                                        WHERE FIND_IN_SET(Parent_ID, @pv)
                                          AND Is_Delete = 0) AS lv
                         FROM tUser
                                JOIN
                                (SELECT @pv := PUser_ID) tmp
                         WHERE FIND_IN_SET(Parent_ID, @pv)
                       ) a);

  RETURN pUserIDs;

END;

DROP FUNCTION IF EXISTS fGetHierarchyEntities;
CREATE FUNCTION fGetHierarchyEntities(PEntity_ID INT)
  RETURNS VARCHAR(1024)
BEGIN
  DECLARE pEntityIDs VARCHAR(1024);

  SET @pv = NULL;

  SET pEntityIDs = (SELECT GROUP_CONCAT(lv SEPARATOR ',')
                    FROM (
                           SELECT @pv := (SELECT GROUP_CONCAT(Entity_ID SEPARATOR ',')
                                          FROM tEntity
                                          WHERE FIND_IN_SET(Parent_Entity_ID, @pv)
                                            AND Is_Delete = 0) AS lv
                           FROM tEntity
                                  JOIN
                                  (SELECT @pv := PEntity_ID) tmp
                           WHERE FIND_IN_SET(Parent_Entity_ID, @pv)
                         ) a);

  RETURN pEntityIDs;

END;

DROP FUNCTION IF EXISTS fGetHierarchyCategories;
CREATE FUNCTION fGetHierarchyCategories(PCategory_ID INT) RETURNS VARCHAR(1024)
BEGIN
  DECLARE pCategoryIDs VARCHAR(1024);

  SET @pv = NULL;

  SET pCategoryIDs = (SELECT GROUP_CONCAT(lv SEPARATOR ',')
                      FROM (
                             SELECT @pv := (SELECT GROUP_CONCAT(Category_ID SEPARATOR ',')
                                            FROM tCategory
                                            WHERE FIND_IN_SET(Parent_Category_ID, @pv)) AS lv
                             FROM tCategory
                                    JOIN
                                    (SELECT @pv := PCategory_ID) tmp
                             WHERE FIND_IN_SET(Parent_Category_ID, @pv)
                           ) a);

  return pCategoryIDs;
END;

DROP FUNCTION IF EXISTS fUpdateSignUpStatus;
CREATE FUNCTION fUpdateSignUpStatus(PUser_ID INT, PSteps_Completed INT, PIs_Completed INT) RETURNS INT
BEGIN
  IF exists(SELECT 1 FROM tSignUpStatus WHERE User_ID = PUser_ID) THEN
    /* Update Status */
    UPDATE tSignUpStatus
    SET Steps_Completed = PSteps_Completed,
        Is_Completed    = PIs_Completed
    WHERE User_ID = PUser_ID;
  ELSE
    /* Insert Status */
    INSERT INTO tSignUpStatus
    (User_ID,
     Steps_Completed,
     Is_Completed)
    VALUES (PUser_ID,
            PSteps_Completed,
            PIs_Completed);
  END IF;

  return 1;
END;

DROP FUNCTION IF EXISTS fGetEntityName;
CREATE FUNCTION fGetEntityName(PEntity_ID INT) RETURNS VARCHAR(1024)
BEGIN
  DECLARE pEntity_Name VARCHAR(1024);
  SET pEntity_Name = (SELECT Entity_Name FROM tEntity WHERE Entity_ID = PEntity_ID);
  return pEntity_Name;
END;

DROP FUNCTION IF EXISTS fGetUserName;
CREATE FUNCTION fGetUserName(PUser_ID INT) RETURNS VARCHAR(1024)
BEGIN
  DECLARE pUser_Name VARCHAR(1024);
  SET pUser_Name = (SELECT User_Name FROM tUser WHERE User_ID = PUser_ID);
  return pUser_Name;
END;

DROP FUNCTION IF EXISTS fUpdateCartTrack;
CREATE FUNCTION fUpdateCartTrack(PUser_ID INT, PCart_ID INT, PStatus VARCHAR(64)) RETURNS INT
BEGIN
  INSERT INTO tCartTrack
  (Cart_ID, Status, Status_Date, User_ID)
  VALUES (PCart_ID, PStatus, now(), PUser_ID);

  return 1;
END;

DROP FUNCTION IF EXISTS fGetPriceByQuantity;
CREATE FUNCTION fGetPriceByQuantity(PCategory_ID INT, PQuantity decimal(10, 2), PState_ID INT, PCity_ID INT)
  RETURNS decimal(10, 2)
BEGIN
  DECLARE pPrice decimal(10, 2) DEFAULT NULL;

  IF exists(SELECT 1
            FROM tCategoryPrice
            WHERE Category_ID = PCategory_ID
              AND State_ID = PState_ID
              AND City_ID = PCity_ID)
  THEN
    SET pPrice = (SELECT Price
                  FROM tCategoryPrice
                  WHERE Category_ID = PCategory_ID
                    AND State_ID = PState_ID
                    AND City_ID = PCity_ID
                    AND PQuantity BETWEEN ifnull(Lower_Range, 0) AND ifnull(Upper_Range, PQuantity)
                  LIMIT 0, 1);
  ELSE
    IF exists(SELECT 1
              FROM tCategoryPrice
              WHERE Category_ID = PCategory_ID
                AND State_ID = PState_ID
                AND City_ID IS NULL)
    THEN
      SET pPrice = (SELECT Price
                    FROM tCategoryPrice
                    WHERE Category_ID = PCategory_ID
                      AND State_ID = PState_ID
                      AND City_ID IS NULL
                      AND PQuantity BETWEEN ifnull(Lower_Range, 0) AND ifnull(Upper_Range, PQuantity)
                    LIMIT 0, 1);
    ELSE
      SET pPrice = (SELECT Price
                    FROM tCategoryPrice
                    WHERE Category_ID = PCategory_ID
                      AND State_ID IS NULL
                      AND City_ID IS NULL
                      AND PQuantity BETWEEN ifnull(Lower_Range, 0) AND ifnull(Upper_Range, PQuantity)
                    LIMIT 0, 1);
    END IF;
  END IF;

  IF pPrice IS NULL
  THEN
    SET pPrice = (SELECT Price
                  FROM tCategory
                  WHERE Category_ID = PCategory_ID);
  END IF;
  RETURN pPrice;
END;

DROP FUNCTION IF EXISTS fAddPOE;
CREATE FUNCTION fAddPOE(PUser_ID INT, PTransaction_ID INT, PTransaction_Type VARCHAR(64), PPOE_Type VARCHAR(64),
                        PFile_Name TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci,
                        PFile_Original_Name TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci, PFile_Type VARCHAR(64),
                        PLatitude VARCHAR(64), PLongitude VARCHAR(64), PIs_Add INT) RETURNS INT
BEGIN

  DECLARE pPOE_ID INT;
  IF PIs_Add IS NULL THEN SET PIs_Add = 1; END IF;

  SET pPOE_ID = (SELECT POE_ID
                 FROM tPOEHeader
                 WHERE Transaction_ID = PTransaction_ID
                   AND Transaction_Type = PTransaction_Type
                   AND POE_Type = PPOE_Type);

  IF PIs_Add = 1 THEN
    IF pPOE_ID = 0 OR pPOE_ID IS NULL THEN
      INSERT INTO tPOEHeader
      (Transaction_ID, Transaction_Type, POE_Type)
      VALUES (PTransaction_ID, PTransaction_Type, PPOE_Type);
      SET pPOE_ID = (SELECT LAST_INSERT_ID());
    END IF;

    INSERT INTO tPOEDetail
    (POE_ID, File_Name, File_Original_Name, File_Type, Latitude, Longitude)
    VALUES (pPOE_ID, PFile_Name, PFile_Original_Name, PFile_Type, PLatitude, PLongitude);
  ELSE
    UPDATE tPOEDetail
    SET File_Name          = PFile_Name,
        File_Original_Name = PFile_Original_Name,
        File_Type          = PFile_Type,
        Latitude           = PLatitude,
        Longitude          = PLongitude
    WHERE POE_ID = pPOE_ID;
  END IF;

  return pPOE_ID;

END;

DROP FUNCTION IF EXISTS fGetPOEAttachedXML;
CREATE FUNCTION fGetPOEAttachedXML(PTransaction_ID INT, PTransaction_Type VARCHAR(64), PPOE_Type VARCHAR(64))
  RETURNS TEXT CHARACTER SET utf8
    COLLATE utf8_unicode_ci
BEGIN
  DECLARE pXML TEXT CHARACTER SET utf8
    COLLATE utf8_unicode_ci;
  /*
    <Root>
      <Item>
        <POE_ID></POE_ID>
        <Transaction_Type></Transaction_Type>
        <POE_Type></POE_Type>
        <File_Name></File_Name>
        <File_Original_Name></File_Original_Name>
        <File_Type></File_Type>
        <Latitude></Latitude>
        <Longitude></Longitude>
      </Item>
    </Root>
  */

  SET pXML = (SELECT group_concat(
                         concat("<Item>", "<POE_ID>", ifnull(a.POE_ID, 0), "</POE_ID><Transaction_Type>",
                                ifnull(a.Transaction_Type, ''),
                                "</Transaction_Type><POE_Type>", ifnull(a.POE_Type, ''), "</POE_Type><Name>",
                                CASE
                                  WHEN ifnull(b.File_Name, '') = ''
                                    THEN "''"
                                  ELSE b.File_Name END, "</Name><File_Original_Name>", CASE
                                                                                         WHEN ifnull(b.File_Original_Name, '') = ''
                                                                                           THEN "''"
                                                                                         ELSE b.File_Original_Name END,
                                "</File_Original_Name><Type>", CASE
                                                                 WHEN ifnull(b.File_Type, '') = ''
                                                                   THEN "''"
                                                                 ELSE b.File_Type END, "</Type><Latitude>", CASE
                                                                                                              WHEN b.Latitude = ''
                                                                                                                THEN "''"
                                                                                                              ELSE ifnull(
                                                                                                                  b.Latitude,
                                                                                                                  "''") END,
                                "</Latitude><Longitude>", CASE
                                                            WHEN b.Longitude = ''
                                                              THEN "''"
                                                            ELSE ifnull(b.Longitude, "''") END, "</Longitude></Item>")
                         SEPARATOR '')
              FROM tPOEHeader a
                     INNER JOIN tPOEDetail b ON a.POE_ID = b.POE_ID
              WHERE a.Transaction_ID = PTransaction_ID
                AND a.Transaction_Type = PTransaction_Type
                AND a.POE_Type = PPOE_Type);

  SET pXML = concat("<Root>", pXML, "</Root>");

  RETURN pXML;

END;

DROP FUNCTION IF EXISTS fGetTotalPriceForSeller;
CREATE FUNCTION fGetTotalPriceForSeller(PCart_ID INT)
  RETURNS FLOAT
BEGIN
  DECLARE pPrice FLOAT DEFAULT 0;
  DECLARE _seller_gst FLOAT DEFAULT 0;

  SET _seller_gst = ifnull(cast(fGetConfigItem('SELLER_GST') AS DECIMAL(10, 2)), 0);

  #     SET pPrice = (SELECT sum(p)
  #                   FROM (
  #                          SELECT (Quantity * Given_Price) + ((Quantity * Given_Price * _seller_gst) / 100) AS p
  #                          FROM tCartItem
  #                          WHERE Cart_ID = PCart_ID) x);

  SET pPrice = (SELECT sum(p)
                FROM (
                       SELECT (Quantity * Seller_Bid_Price) +
                              ((Quantity * Seller_Bid_Price * ifnull(Seller_GST_Percentage, _seller_gst)) / 100) AS p
                       FROM tCartItem
                       WHERE Cart_ID = PCart_ID) x);

  RETURN ifnull(pPrice, 0);
END;


DROP FUNCTION if exists fGetTotalSellerPrice;
CREATE FUNCTION fGetTotalSellerPrice(PCart_ID INT)
  RETURNS FLOAT
BEGIN

  DECLARE _seller_gst FLOAT DEFAULT 0;

  SET _seller_gst = ifnull(cast(fGetConfigItem('SELLER_GST') AS DECIMAL(10, 2)), 0);

  #     RETURN (SELECT sum(x.price)
  #             FROM (
  #                    SELECT (Quantity * Given_Price) + ((Quantity * Given_Price * _seller_gst) / 100) AS price
  #                    FROM tCartItem
  #                    WHERE Cart_ID = PCart_ID) x);

  RETURN (SELECT sum(x.price)
          FROM (
                 SELECT (Quantity * Seller_Bid_Price) +
                        ((Quantity * Seller_Bid_Price * ifnull(Seller_GST_Percentage, _seller_gst)) / 100) AS price
                 FROM tCartItem
                 WHERE Cart_ID = PCart_ID) x);
END;

DROP FUNCTION IF EXISTS fGetTotalSellerQuantity;
CREATE FUNCTION fGetTotalSellerQuantity(PCart_ID INT)
  RETURNS TEXT
BEGIN
  DECLARE _qty TEXT;

  SET _qty = (SELECT group_concat(concat(Total_Quantity, '', UOM_Type) SEPARATOR ',') AS Total_Quantity
              FROM (
                     SELECT x.UOM_ID,
                            x.UOM_Type,
                            sum(Total_Quantity) AS Total_Quantity
                     FROM (
                            SELECT a.Cart_ID,
                                   f.UOM_ID,
                                   g.UOM_Type,
                                   sum(ci.Quantity)                   AS Total_Quantity,
                                   fGetTotalPriceForSeller(a.Cart_ID) AS Total_Price
                            FROM tCart a
                                   INNER JOIN tEntity b ON a.Entity_ID = b.Entity_ID
                                   INNER JOIN tCartItem ci ON a.Cart_ID = ci.Cart_ID
                                   INNER JOIN tCategory f ON ci.Category_ID = f.Category_ID
                                   INNER JOIN tUOM g ON f.UOM_ID = g.UOM_ID
                            WHERE a.Cart_ID = PCart_ID
                            GROUP BY a.Cart_ID, f.UOM_ID) x
                     GROUP BY x.UOM_ID) y);
  RETURN _qty;
END;

DROP FUNCTION IF EXISTS fGetTotalInspectedQuantity;
CREATE FUNCTION fGetTotalInspectedQuantity(PCart_ID INT)
  RETURNS TEXT
BEGIN
  DECLARE _qty TEXT;

  SET _qty = (SELECT group_concat(concat(Total_Quantity, '', UOM_Type) SEPARATOR ',') AS Total_Quantity
              FROM (
                     SELECT x.UOM_ID,
                            x.UOM_Type,
                            sum(Total_Quantity) AS Total_Quantity
                     FROM (
                            SELECT a.Cart_ID,
                                   f.UOM_ID,
                                   g.UOM_Type,
                                   sum(ifnull(ci.Inspected_Quantity, 0)) AS Total_Quantity
                            FROM tCart a
                                   INNER JOIN tEntity b ON a.Entity_ID = b.Entity_ID
                                   INNER JOIN tCartItem ci ON a.Cart_ID = ci.Cart_ID
                                   INNER JOIN tCategory f ON ci.Category_ID = f.Category_ID
                                   INNER JOIN tUOM g ON f.UOM_ID = g.UOM_ID
                            WHERE a.Cart_ID = PCart_ID
                            GROUP BY a.Cart_ID, f.UOM_ID) x
                     GROUP BY x.UOM_ID) y);
  RETURN _qty;
END;



DROP FUNCTION IF EXISTS fGetOffset;
CREATE FUNCTION fGetOffset(PPageNum INT, PNumOfRec INT) RETURNS INT
BEGIN
  DECLARE pOffset INT;
  if (PPageNum > 1) then
    set pOffset = (PPageNum - 1) * PNumOfRec ;
  else
    set pOffset = 0;
  end if;
  return pOffset;
END;

DROP FUNCTION IF EXISTS fGetTotalPages;
CREATE FUNCTION fGetTotalPages(pTotalRec INT, PNumOfRec INT) RETURNS INT
BEGIN
  DECLARE pTotalPages INT;
  if mod(pTotalRec, PNumOfRec) > 0 then
    set pTotalPages = (floor(pTotalRec / PNumOfRec)) + 1 ;
  else
    set pTotalPages = (floor(pTotalRec / PNumOfRec)) ;
  end if;
  return pTotalPages;
END;

-- DROP FUNCTION IF EXISTS fGetUsersTree;
-- CREATE FUNCTION fGetUsersTree(PUser_ID             INT, PEntity_Type VARCHAR(64), PInclure_Current_User INT,
--                               PInclude_KARO_Entity INT)
--   RETURNS TEXT
--   BEGIN
--     DECLARE pUsers TEXT DEFAULT "";
--
--     DECLARE pMyUsers TEXT DEFAULT "";
--     DECLARE pMyEntityUsers TEXT DEFAULT "";
--     DECLARE pEntityUsers TEXT DEFAULT "";
--
--     IF PInclure_Current_User IS NULL
--     THEN SET PInclure_Current_User = 1; END IF;
--     IF PInclude_KARO_Entity IS NULL
--     THEN SET PInclude_KARO_Entity = 1; END IF;
--
--     IF PInclure_Current_User = 1
--     THEN
--       SET pUsers = PUser_ID;
--     END IF;
--
--     /* Users under me */
--     SET pMyUsers = fGetHierarchyUsers(PUser_ID);
--
--     IF pMyUsers <> '' AND pMyUsers IS NOT NULL
--     THEN
--       SET pUsers = concat(pUsers, ',', pMyUsers);
--     END IF;
--
--     /* Users under entity managed my my users */
--     SET pMyEntityUsers = (SELECT group_concat(a.User_ID)
--                           FROM tUserEntity a
--                             INNER JOIN tEntity b ON a.Entity_ID = b.Entity_ID
--                           WHERE find_in_set(b.Currently_Managed_By, pMyUsers) AND b.Is_Delete = 0);
--
--     IF pMyEntityUsers <> '' AND pMyEntityUsers IS NOT NULL
--     THEN
--       SET pUsers = concat(pUsers, ',', pMyEntityUsers);
--
--       /* Add User managed by entity users */
--       SET pMyEntityUsers = (SELECT group_concat(a.User_ID)
--                             FROM tUserEntity a
--                               INNER JOIN tEntity b ON a.Entity_ID = b.Entity_ID
--                             WHERE find_in_set(b.Currently_Managed_By, pMyEntityUsers) AND b.Is_Delete = 0);
--
--       IF pMyEntityUsers <> '' AND pMyEntityUsers IS NOT NULL
--       THEN
--         SET pUsers = concat(pUsers, ',', pMyEntityUsers);
--       END IF;
--
--     END IF;
--
--     /* If Entity Type is KaRO then add managed my none */
--     IF PEntity_Type = 'ENTKARO' AND PInclude_KARO_Entity = 1
--     THEN
--       SET pEntityUsers = (SELECT group_concat(a.User_ID)
--                           FROM tUserEntity a
--                             INNER JOIN tEntity b ON a.Entity_ID = b.Entity_ID
--                             INNER JOIN tUser c ON a.User_ID = c.User_ID AND c.Is_Delete = 0
--                           WHERE b.Entity_Type <> 'ENTKARO' AND
--                                 (b.Currently_Managed_By = 0 OR b.Currently_Managed_By IS NULL));
--
--       IF pEntityUsers <> '' AND pEntityUsers IS NOT NULL
--       THEN
--         SET pUsers = concat(pUsers, ',', pEntityUsers);
--
--         /* Add User managed by entity users */
--         SET pEntityUsers = (SELECT group_concat(a.User_ID)
--                             FROM tUserEntity a
--                               INNER JOIN tEntity b ON a.Entity_ID = b.Entity_ID
--                             WHERE find_in_set(b.Currently_Managed_By, pEntityUsers) AND b.Is_Delete = 0);
--
--         IF pEntityUsers <> '' AND pEntityUsers IS NOT NULL
--         THEN
--           SET pUsers = concat(pUsers, ',', pEntityUsers);
--         END IF;
--
--       END IF;
--     END IF;
--
--     RETURN trim(BOTH ',' FROM pUsers);
--
--   END;

DROP FUNCTION IF EXISTS fGetUsersTree;
CREATE FUNCTION fGetUsersTree(PUser_ID INT, PEntity_Type VARCHAR(64), PInclure_Current_User INT,
                              PInclude_KARO_Entity INT)
  RETURNS TEXT
BEGIN

  DECLARE _entities TEXT DEFAULT "";
  DECLARE _left_node INT;
  DECLARE _right_node INT;

  (SELECT Left_Node,
          Right_Node
          INTO _left_node, _right_node
   FROM tHierarchy
   WHERE User_Or_Entity_ID = PUser_ID
     AND Type = 'USER'
   LIMIT 0, 1);

  IF PInclure_Current_User = 1
  THEN
    SET _entities = (SELECT group_concat(User_Or_Entity_ID)
                     FROM tHierarchy
                     WHERE Type = 'USER'
                       AND Left_Node >= _left_node
                       AND Right_Node <= _right_node);
  ELSE
    SET _entities = (SELECT group_concat(User_Or_Entity_ID)
                     FROM tHierarchy
                     WHERE Type = 'USER'
                       AND Left_Node > _left_node
                       AND Right_Node < _right_node);
  END IF;

  RETURN _entities;

END;


-- DROP FUNCTION IF EXISTS fGetEntityTree;
-- CREATE FUNCTION fGetEntityTree(PUser_ID             INT, PEntity_Type VARCHAR(64), PInclure_Current_User INT,
--                                PInclude_KARO_Entity INT, PTarget_Entity_Type VARCHAR(64))
--   RETURNS TEXT
--   BEGIN
--     DECLARE pEntities TEXT DEFAULT "";
--
--     DECLARE pMyOtherEntities TEXT DEFAULT "";
--     DECLARE pDefEntities TEXT DEFAULT "";
--     DECLARE pMyEntities TEXT DEFAULT "";
--
--     DECLARE pUsersTree TEXT DEFAULT '';
--
--     IF PTarget_Entity_Type = '' OR PTarget_Entity_Type = '0'
--     THEN
--       SET PTarget_Entity_Type = NULL;
--     END IF;
--
--     IF PInclure_Current_User IS NULL
--     THEN SET PInclure_Current_User = 1; END IF;
--
--     IF PInclude_KARO_Entity IS NULL
--     THEN SET PInclude_KARO_Entity = 1; END IF;
--
--     IF PInclure_Current_User = 1
--     THEN
--       SET pMyEntities = (SELECT group_concat(Entity_ID)
--                          FROM tEntity
--                          WHERE
--                            Currently_Managed_By = PUser_ID AND Entity_Type = ifnull(PTarget_Entity_Type, Entity_Type));
--
--       IF pMyEntities <> '' AND pMyEntities IS NOT NULL
--       THEN
--         SET pEntities = pMyEntities;
--
--         /* Entities managed by pMyEntities*/
--         SET pMyEntities = (SELECT group_concat(Entity_ID)
--                            FROM tEntity
--                            WHERE find_in_set(Managed_By, pMyEntities));
--
--         IF pMyEntities <> '' AND pMyEntities IS NOT NULL
--         THEN
--           SET pEntities = concat(pEntities, ',', pMyEntities);
--         END IF;
--
--       END IF;
--     END IF;
--
--     SET pUsersTree = fGetHierarchyUsers(PUser_ID);
--
--     SET pMyOtherEntities = (SELECT group_concat(Entity_ID)
--                             FROM tEntity
--                             WHERE Is_Delete = 0 AND Entity_Type = ifnull(PTarget_Entity_Type, Entity_Type) AND
--                                   find_in_set(Currently_Managed_By, pUsersTree));
--
--     IF pMyOtherEntities <> '' AND pMyOtherEntities IS NOT NULL
--     THEN
--       SET pEntities = concat(pEntities, ',', pMyOtherEntities);
--
--       /* Entities managed by pMyOtherEntities*/
--       SET pMyOtherEntities = (SELECT group_concat(Entity_ID)
--                               FROM tEntity
--                               WHERE find_in_set(Managed_By, pMyOtherEntities));
--
--       IF pMyOtherEntities <> '' AND pMyOtherEntities IS NOT NULL
--       THEN
--         SET pEntities = concat(pEntities, ',', pMyOtherEntities);
--       END IF;
--
--     END IF;
--
--     IF PEntity_Type = 'ENTKARO' AND PInclude_KARO_Entity = 1
--     THEN
--       SET pDefEntities = (SELECT group_concat(Entity_ID)
--                           FROM tEntity
--                           WHERE Is_Delete = 0 AND (Currently_Managed_By = 1 or Currently_Managed_By = 0 OR Currently_Managed_By IS NULL) AND
--                                 Entity_Type = ifnull(PTarget_Entity_Type, Entity_Type));
--
--       IF pDefEntities <> '' AND pDefEntities IS NOT NULL
--       THEN
--         SET pEntities = concat(pEntities, ',', pDefEntities);
--
--         /* Entities managed by pDefEntities*/
--         SET pDefEntities = (SELECT group_concat(Entity_ID)
--                             FROM tEntity
--                             WHERE find_in_set(Managed_By, pDefEntities));
--
--         IF pDefEntities <> '' AND pDefEntities IS NOT NULL
--         THEN
--           SET pEntities = concat(pEntities, ',', pDefEntities);
--         END IF;
--       END IF;
--     END IF;
--
--     RETURN trim(BOTH ',' FROM pEntities);
--   END;

DROP FUNCTION IF EXISTS fGetEntityTree;
CREATE FUNCTION fGetEntityTree(PUser_ID INT, PEntity_Type VARCHAR(64), PInclure_Current_User INT,
                               PInclude_KARO_Entity INT, PTarget_Entity_Type VARCHAR(64))
  RETURNS TEXT
BEGIN

  DECLARE _entities TEXT DEFAULT "";
  DECLARE _left_node INT;
  DECLARE _right_node INT;


  (SELECT Left_Node,
          Right_Node
          INTO _left_node, _right_node
   FROM tHierarchy
   WHERE User_Or_Entity_ID = PUser_ID
     AND Type = 'USER'
   LIMIT 0, 1);

  IF PInclure_Current_User = 1
  THEN
    SET _entities = (SELECT group_concat(User_Or_Entity_ID)
                     FROM tHierarchy
                     WHERE Type = 'ENTITY'
                       AND Left_Node >= _left_node
                       AND Right_Node <= _right_node);
  ELSE
    SET _entities = (SELECT group_concat(User_Or_Entity_ID)
                     FROM tHierarchy
                     WHERE Type = 'ENTITY'
                       AND Left_Node > _left_node
                       AND Right_Node < _right_node);
  END IF;

  RETURN _entities;

END;

drop function if exists fGetCountAchievedTarget;
CREATE FUNCTION fGetCountAchievedTarget(PEntityOrUser_ID INT, PIs_User INT, PParameter VARCHAR(64), PMonth_Number INT,
                                        PIs_Mine INT, PYear YEAR)
  RETURNS DECIMAL(10, 2)
BEGIN
  DECLARE pAchieved_Count DECIMAL(10, 2) DEFAULT 0;
  DECLARE pTree TEXT;
  DECLARE _target_parameter_object_type VARCHAR(1024);

  IF PMonth_Number = 0
  THEN
    SET PMonth_Number = NULL;
  END IF;

  IF PYear = '' OR PYear = 0 OR PYear IS NULL
  THEN
    SET PYear = fGetFinacialYear(PMonth_Number);
  END IF;

  IF PIs_User = 1
  THEN
    SET pTree = fGetUsersTree(PEntityOrUser_ID, NULL, 1, 1);
  ELSE
    SET pTree = fGetUsersTree(fGetPrimaryUserIdForEntity(PEntityOrUser_ID), NULL, 1, 1);
  END IF;

  SET _target_parameter_object_type = (SELECT Object_Type
                                       FROM tTargetParameters
                                       WHERE Target_Parameter_Code = PParameter);

  CASE _target_parameter_object_type
    WHEN "COLLECTION"
      THEN
        SET pAchieved_Count = ifnull((SELECT cast(sum(Quantity) AS UNSIGNED)
                                      FROM tPickupRequest a
                                             INNER JOIN tCart b ON a.Cart_ID = b.Cart_ID
                                             INNER JOIN tCartItem c ON b.Cart_ID = c.Cart_ID
                                             INNER JOIN tCategory d ON c.Category_ID = d.Category_ID
                                      WHERE d.Category_Code LIKE concat(PParameter, '%')
                                        AND find_in_set(b.User_ID, pTree)
                                        AND CASE
                                              WHEN PMonth_Number IS NULL
                                                THEN
                                                  (year(a.Requested_On) = PYear AND month(a.Requested_On) > 3) OR
                                                  (year(a.Requested_On) = PYear + 1 AND month(a.Requested_On) <= 3)
                                              ELSE
                                                CASE
                                                  WHEN PMonth_Number <= 3
                                                    THEN
                                                    (year(a.Requested_On) = PYear + 1 AND
                                                     month(a.Requested_On) = PMonth_Number)
                                                  ELSE
                                                    (year(a.Requested_On) = PYear AND
                                                     month(a.Requested_On) = PMonth_Number)
                                                  END
                                        END), 0);
    WHEN
      "ENROLLMENT"
      THEN
        SET pAchieved_Count = (SELECT count(*)
                               FROM tEntity
                               WHERE Entity_Type = PParameter
                                 AND find_in_set(Created_By, pTree)
                                 AND CASE
                                       WHEN PMonth_Number IS NULL
                                         THEN
                                           (year(Created_On) = PYear AND month(Created_On) > 3) OR
                                           (year(Created_On) = PYear + 1 AND month(Created_On) <= 3)
                                       ELSE
                                         CASE
                                           WHEN PMonth_Number <= 3
                                             THEN
                                             (year(Created_On) = PYear + 1 AND month(Created_On) = PMonth_Number)
                                           ELSE
                                             (year(Created_On) = PYear AND month(Created_On) = PMonth_Number)
                                           END
                                 END
                                 AND Is_Delete = 0);
    WHEN
      "VISIT_ENTITY_PURPOSE"
      THEN
        SET pAchieved_Count = (SELECT count(*)
                               FROM tVisit
                               WHERE find_in_set(User_ID, pTree)
                                 AND concat(Entity_Type, '-', Visit_Purpose) = PParameter
                                 AND CASE
                                       WHEN PMonth_Number IS NULL
                                         THEN
                                           (year(Visit_Date) = PYear AND month(Visit_Date) > 3) OR
                                           (year(Visit_Date) = PYear + 1 AND month(Visit_Date) <= 3)
                                       ELSE
                                         CASE
                                           WHEN PMonth_Number <= 3
                                             THEN
                                             (year(Visit_Date) = PYear + 1 AND month(Visit_Date) = PMonth_Number)
                                           ELSE
                                             (year(Visit_Date) = PYear AND month(Visit_Date) = PMonth_Number)
                                           END
                                 END);
    WHEN
      "VISIT_ENTITY"
      THEN
        SET pAchieved_Count = (SELECT count(*)
                               FROM tVisit
                               WHERE find_in_set(User_ID, pTree)
                                 AND concat('VISIT-', Entity_Type) = PParameter
                                 AND CASE
                                       WHEN PMonth_Number IS NULL
                                         THEN
                                           (YEAR(Visit_Date) = PYear AND MONTH(Visit_Date) > 3) OR
                                           (YEAR(Visit_Date) = PYear + 1 AND MONTH(Visit_Date) <= 3)
                                       ELSE
                                         CASE
                                           WHEN PMonth_Number <= 3
                                             THEN
                                             (YEAR(Visit_Date) = PYear + 1 AND MONTH(Visit_Date) = PMonth_Number)
                                           ELSE
                                             (YEAR(Visit_Date) = PYear AND MONTH(Visit_Date) = PMonth_Number)
                                           END
                                 END);

    WHEN
      "OTHERS"
      THEN
        SET pAchieved_Count = 0;
    ELSE
      SET pAchieved_Count = 0;
    END CASE;

  RETURN ifnull(pAchieved_Count, 0);
END;

DROP FUNCTION IF EXISTS fCheckTargetAchieved;
CREATE FUNCTION fCheckTargetAchieved(PEntityOrUser_ID INT, PIs_User INT, PParameter VARCHAR(64), PTarget_Value INT,
                                     PMonth_Number INT, PYear YEAR, PIs_Mine INT)
  RETURNS DECIMAL(10, 2)
BEGIN
  DECLARE pIsAchieved INT DEFAULT 0;
  DECLARE pTree TEXT;
  DECLARE pAchieved_Count DECIMAL(10, 2);
  DECLARE _target_parameter_object_type VARCHAR(1024);

  IF PMonth_Number = 0
  THEN
    SET PMonth_Number = NULL;
  END IF;

  IF PYear = '' OR PYear = 0 OR PYear IS NULL
  THEN
    SET PYear = fGetFinacialYear(PMonth_Number);
  END IF;

  IF PIs_User = 1
  THEN
    SET pTree = fGetUsersTree(PEntityOrUser_ID, NULL, 1, 1);
  ELSE
    SET pTree = fGetUsersTree(fGetPrimaryUserIdForEntity(PEntityOrUser_ID), NULL, 1, 1);
  END IF;

  SET _target_parameter_object_type = (SELECT Object_Type
                                       FROM tTargetParameters
                                       WHERE Target_Parameter_Code = PParameter);

  CASE _target_parameter_object_type
    WHEN "COLLECTION"
      THEN
        SET pAchieved_Count = ifnull((SELECT cast(sum(Quantity) AS UNSIGNED)
                                      FROM tPickupRequest a
                                             INNER JOIN tCart b ON a.Cart_ID = b.Cart_ID
                                             INNER JOIN tCartItem c ON b.Cart_ID = c.Cart_ID
                                             INNER JOIN tCategory d ON c.Category_ID = d.Category_ID
                                      WHERE d.Category_Code LIKE concat(PParameter, '%')
                                        AND find_in_set(b.User_ID, pTree)
                                        AND CASE
                                              WHEN PMonth_Number IS NULL
                                                THEN
                                                  (year(a.Requested_On) = PYear AND month(a.Requested_On) > 3) OR
                                                  (year(a.Requested_On) = PYear + 1 AND month(a.Requested_On) <= 3)
                                              ELSE
                                                CASE
                                                  WHEN PMonth_Number <= 3
                                                    THEN
                                                    (year(a.Requested_On) = PYear + 1 AND
                                                     month(a.Requested_On) = PMonth_Number)
                                                  ELSE
                                                    (year(a.Requested_On) = PYear AND
                                                     month(a.Requested_On) = PMonth_Number)
                                                  END
                                        END), 0);
    WHEN
      "ENROLLMENT"
      THEN
        SET pAchieved_Count = (SELECT count(*)
                               FROM tEntity
                               WHERE Entity_Type = PParameter
                                 AND find_in_set(Created_By, pTree)
                                 AND CASE
                                       WHEN PMonth_Number IS NULL
                                         THEN
                                           (year(Created_On) = PYear AND month(Created_On) > 3) OR
                                           (year(Created_On) = PYear + 1 AND month(Created_On) <= 3)
                                       ELSE
                                         CASE
                                           WHEN PMonth_Number <= 3
                                             THEN
                                             (year(Created_On) = PYear + 1 AND month(Created_On) = PMonth_Number)
                                           ELSE
                                             (year(Created_On) = PYear AND month(Created_On) = PMonth_Number)
                                           END
                                 END
                                 AND Is_Delete = 0);
    WHEN
      "VISIT_ENTITY_PURPOSE"
      THEN
        SET pAchieved_Count = (SELECT count(*)
                               FROM tVisit
                               WHERE find_in_set(User_ID, pTree)
                                 AND concat(Entity_Type, '-', Visit_Purpose) = PParameter
                                 AND CASE
                                       WHEN PMonth_Number IS NULL
                                         THEN
                                           (year(Visit_Date) = PYear AND month(Visit_Date) > 3) OR
                                           (year(Visit_Date) = PYear + 1 AND month(Visit_Date) <= 3)
                                       ELSE
                                         CASE
                                           WHEN PMonth_Number <= 3
                                             THEN
                                             (year(Visit_Date) = PYear + 1 AND month(Visit_Date) = PMonth_Number)
                                           ELSE
                                             (year(Visit_Date) = PYear AND month(Visit_Date) = PMonth_Number)
                                           END
                                 END);
    WHEN
      "VISIT_ENTITY"
      THEN
        SET pAchieved_Count = (SELECT count(*)
                               FROM tVisit
                               WHERE find_in_set(User_ID, pTree)
                                 AND concat('VISIT-', Entity_Type) = PParameter
                                 AND CASE
                                       WHEN PMonth_Number IS NULL
                                         THEN
                                           (YEAR(Visit_Date) = PYear AND MONTH(Visit_Date) > 3) OR
                                           (YEAR(Visit_Date) = PYear + 1 AND MONTH(Visit_Date) <= 3)
                                       ELSE
                                         CASE
                                           WHEN PMonth_Number <= 3
                                             THEN
                                             (YEAR(Visit_Date) = PYear + 1 AND MONTH(Visit_Date) = PMonth_Number)
                                           ELSE
                                             (YEAR(Visit_Date) = PYear AND MONTH(Visit_Date) = PMonth_Number)
                                           END
                                 END);

    WHEN
      "OTHERS"
      THEN
        SET pAchieved_Count = 0;
    ELSE
      SET pAchieved_Count = 0;
    END CASE;


  IF pAchieved_Count >= PTarget_Value
  THEN
    SET pIsAchieved = 1;
  END IF;

  RETURN ifnull(pIsAchieved, 0);

END;

DROP FUNCTION IF EXISTS fGetMonthlyTargetDetailForUser;
CREATE FUNCTION fGetMonthlyTargetDetailForUser(PMonth_Number INT, PYear YEAR, PUserOrEntity_ID INT, PIsUser INT)
  RETURNS TEXT
BEGIN

  /*
    <Root>
      <Target>
      <TargetParameter></TargetParameter>
      <TargetValue></TargetValue>
      </Target>
      <Target>
      <TargetParameter></TargetParameter>
      <TargetValue></TargetValue>
      </Target>
    </Root>
  */

  DECLARE _target_detail TEXT DEFAULT '';

  IF PMonth_Number = 0
  THEN
    SET PMonth_Number = NULL;
  END IF;
  IF PYear = 0 OR PYear IS NULL
  THEN
    SET PYear = year(curdate());
  END IF;

  IF PMonth_Number IS NULL
  THEN
    SET _target_detail = (SELECT group_concat(
                                     concat('<Target><TargetParameter>', x.Parameter, '</TargetParameter><TargetValue>',
                                            x.val,
                                            '</TargetValue></Target>') SEPARATOR '')
                          FROM (
                                 SELECT Parameter,
                                        sum(Target_Value) AS val
                                 FROM tTargetHeader a
                                        INNER JOIN tTargetDetail b ON a.Target_ID = b.Target_ID
                                 WHERE Month_Number IS NOT NULL
                                   AND Target_Year = PYear
                                   AND CASE
                                         WHEN PIsUser = 1
                                           THEN
                                           a.Target_To = PUserOrEntity_ID AND a.Is_User = 1
                                         ELSE
                                           a.Target_To = PUserOrEntity_ID AND a.Is_User = 0
                                   END
                                 GROUP BY Parameter) x);
  ELSE
    SET _target_detail = (SELECT group_concat(
                                     concat('<Target><TargetParameter>', b.Parameter, '</TargetParameter><TargetValue>',
                                            b.Target_Value,
                                            '</TargetValue></Target>') SEPARATOR '')
                          FROM tTargetHeader a
                                 INNER JOIN tTargetDetail b ON a.Target_ID = b.Target_ID
                          WHERE a.Target_Year = PYear
                            AND a.Month_Number = PMonth_Number
                            AND CASE
                                  WHEN PIsUser = 1
                                    THEN
                                    a.Target_To = PUserOrEntity_ID AND a.Is_User = 1
                                  ELSE
                                    a.Target_To = PUserOrEntity_ID AND a.Is_User = 0
                            END);
  END IF;
  IF _target_detail <> '' AND _target_detail IS NOT NULL
  THEN
    SET _target_detail = concat('<Root>', _target_detail, '</Root>');
  END IF;
  RETURN _target_detail;
END;

DROP FUNCTION IF EXISTS fGetAnnuallyTargetDetailForUser;
CREATE FUNCTION fGetAnnuallyTargetDetailForUser(PYear YEAR, PUserOrEntity_ID INT, PIsUser INT)
  RETURNS TEXT
BEGIN
  /*
    <Root>
      <Target>
      <TargetParameter></TargetParameter>
      <TargetValue></TargetValue>
      </Target>
      <Target>
      <TargetParameter></TargetParameter>
      <TargetValue></TargetValue>
      </Target>
    </Root>
  */

  DECLARE _target_detail TEXT DEFAULT '';

  IF PYear = 0 OR PYear IS NULL
  THEN
    SET PYear = year(curdate());
  END IF;

  SET _target_detail = (SELECT group_concat(
                                   concat('<Target><TargetParameter>', b.Parameter, '</TargetParameter><TargetValue>',
                                          b.Target_Value,
                                          '</TargetValue></Target>') SEPARATOR '')
                        FROM tTargetHeader a
                               INNER JOIN tTargetDetail b ON a.Target_ID = b.Target_ID
                        WHERE Month_Number IS NULL
                          AND Target_Year = PYear
                          AND CASE
                                WHEN PIsUser = 1
                                  THEN
                                  a.Target_To = PUserOrEntity_ID AND a.Is_User = 1
                                ELSE
                                  a.Target_To = PUserOrEntity_ID AND a.Is_User = 0
                          END);
  IF _target_detail <> '' AND _target_detail IS NOT NULL
  THEN
    SET _target_detail = concat('<Root>', _target_detail, '</Root>');
  END IF;
  RETURN _target_detail;
END;



DROP FUNCTION IF EXISTS fGetPriceRangeXML;
CREATE FUNCTION fGetPriceRangeXML(PCategory_ID INT, PState_ID INT, PCity_ID INT)
  RETURNS TEXT
BEGIN

  /*
    <Root>
      <Range>
        <CategoryPriceID>1</CategoryPriceID>
        <Lower>0</Lower>
        <Upper>100</Upper>
        <Price>18.0</Price>
      </Range>
      <Range>
        <CategoryPriceID>1</CategoryPriceID>
        <Lower>101</Lower>
        <Upper>200</Upper>
        <Price>22.0</Price>
      </Range>
      <Range>
        <CategoryPriceID>1</CategoryPriceID>
        <Lower>201</Lower>
        <Upper></Upper>
        <Price>25.50</Price>
      </Range>
    </Root>
  */

  DECLARE PPriceRangeXML TEXT DEFAULT '';

  IF exists(SELECT 1
            FROM tCategoryPrice
            WHERE Category_ID = PCategory_ID
              AND State_ID = PState_ID
              AND City_ID = PCity_ID)
  THEN
    /* Get Price range for state and city */
    SET PPriceRangeXML = (SELECT group_concat(concat("<Range><CategoryPriceID>", Category_Price_ID,
                                                     "</CategoryPriceID><Lower>", ifnull(Lower_Range, 0),
                                                     "</Lower><Upper>", ifnull(Upper_Range, 0), "</Upper><Price>",
                                                     ifnull(Price, 0), "</Price></Range>") SEPARATOR '')
                                   AS a
                          FROM tCategoryPrice
                          WHERE Category_ID = PCategory_ID
                            AND State_ID = PState_ID
                            AND City_ID = PCity_ID);
  ELSE
    IF exists(SELECT 1
              FROM tCategoryPrice
              WHERE Category_ID = PCategory_ID
                AND State_ID = PState_ID
                AND City_ID IS NULL)
    THEN
      /* Get Price range for state */
      SET PPriceRangeXML = (SELECT group_concat(concat("<Range><CategoryPriceID>", Category_Price_ID,
                                                       "</CategoryPriceID><Lower>", ifnull(Lower_Range, 0),
                                                       "</Lower><Upper>", ifnull(Upper_Range, 0), "</Upper><Price>",
                                                       ifnull(Price, 0), "</Price></Range>") SEPARATOR '')
                                     AS a
                            FROM tCategoryPrice
                            WHERE Category_ID = PCategory_ID
                              AND State_ID = PState_ID
                              AND City_ID IS NULL);
    ELSE
      /* Get default value */
      SET PPriceRangeXML = (SELECT group_concat(concat("<Range><CategoryPriceID>", Category_Price_ID,
                                                       "</CategoryPriceID><Lower>", ifnull(Lower_Range, 0),
                                                       "</Lower><Upper>", ifnull(Upper_Range, 0), "</Upper><Price>",
                                                       ifnull(Price, 0), "</Price></Range>") SEPARATOR '')
                                     AS a
                            FROM tCategoryPrice
                            WHERE Category_ID = PCategory_ID
                              AND State_ID IS NULL
                              AND City_ID IS NULL);
    END IF;
  END IF;

  RETURN concat("<Root>", PPriceRangeXML, "</Root>");
END;

DROP FUNCTION IF EXISTS fAddOrUpdateOrDeletePriceRange;
CREATE FUNCTION fAddOrUpdateOrDeletePriceRange(PCategory_ID INT,
                                               PState_ID INT,
                                               PCity_ID INT,
                                               PPrice_Range_Detail TEXT,
                                               PIsDelete INT)
  RETURNS INT
BEGIN

  /*
    PPrice_Range_Detail :
    category_price_id~lower~upper~price|category_price_id~lower~upper~price
    1~0~100~18.2§2~101~200~18.4§3~201~~18.6
  */


  DECLARE pCategory_Price_Range_Count INT DEFAULT 0;
  DECLARE pCategory_Price_Range_Counter INT DEFAULT 1;
  DECLARE pIsNew INT DEFAULT 1;

  SET pCategory_Price_Range_Count = fCountTokens(PPrice_Range_Detail, "§");

  IF NOT exists(SELECT 1
                FROM tCategoryPrice
                WHERE Category_ID = PCategory_ID)
  THEN
    SET pIsNew = 1;
  ELSE
    IF PState_ID IS NULL AND PCity_ID IS NULL
    THEN
      SET pIsNew = 0;
    ELSE
      IF PState_ID IS NOT NULL AND PCity_ID IS NULL
      THEN
        IF exists(SELECT 1
                  FROM tCategoryPrice
                  WHERE Category_ID = PCategory_ID
                    AND State_ID = PState_ID
                    AND City_ID IS NULL)
        THEN
          SET pIsNew = 0;
        END IF;
      ELSE
        IF PState_ID IS NOT NULL AND PCity_ID IS NOT NULL
        THEN
          IF exists(SELECT 1
                    FROM tCategoryPrice
                    WHERE Category_ID = PCategory_ID
                      AND State_ID = PState_ID
                      AND City_ID = PCity_ID)
          THEN
            SET pIsNew = 0;
          END IF;
        END IF;
      END IF;
    END IF;
  END IF;

  price_range_loop : WHILE (pCategory_Price_Range_Count > 0) DO
  SET @price_range_detail = SPLIT_STR(PPrice_Range_Detail, "§", pCategory_Price_Range_Counter);
  IF @price_range_detail <> '' AND @price_range_detail IS NOT NULL
  THEN
    SET @Category_price_id = cast(SPLIT_STR(@price_range_detail, "~", 1) AS UNSIGNED);
    SET @lower = cast(SPLIT_STR(@price_range_detail, "~", 2) AS UNSIGNED);
    SET @upper = cast(SPLIT_STR(@price_range_detail, "~", 3) AS UNSIGNED);
    SET @price = cast(SPLIT_STR(@price_range_detail, "~", 4) AS decimal(10, 2));

    IF @upper = 0
    THEN
      SET @upper = NULL;
    END IF;

    IF pIsNew = 1
    THEN
      INSERT INTO tCategoryPrice (Category_ID, Lower_Range, Upper_Range, Price, State_ID, City_ID)
      VALUES (PCategory_ID, @lower, @upper, @price, PState_ID, PCity_ID);
    ELSE
      UPDATE tCategoryPrice
      SET Lower_Range = ifnull(@lower, 0),
          Upper_Range = @upper,
          Price       = @price
      WHERE Category_Price_ID = @Category_price_id;
    END IF;
  END IF;
  SET pCategory_Price_Range_Count = pCategory_Price_Range_Count - 1;
  SET pCategory_Price_Range_Counter = pCategory_Price_Range_Counter + 1;
  END WHILE;

  RETURN 1;

END;

DROP FUNCTION IF EXISTS fGetEntityType;
CREATE FUNCTION fGetEntityType(PEntity_ID INT)
  RETURNS VARCHAR(64)
BEGIN
  DECLARE pEntity_Type VARCHAR(64);
  IF PEntity_ID = 0 OR PEntity_ID IS NULL
  THEN
    SET pEntity_Type = 'ENTKARO';
  ELSE
    SET pEntity_Type = (SELECT Entity_Type
                        FROM tEntity
                        WHERE Entity_ID = PEntity_ID
                        LIMIT 0, 1);
  END IF;
  RETURN pEntity_Type;
END;

DROP FUNCTION IF EXISTS fGetEntityTypeByUserOrEntity;
CREATE FUNCTION fGetEntityTypeByUserOrEntity(PUserOrEntity_ID INT, PIs_User INT)
  RETURNS VARCHAR(128)
BEGIN
  DECLARE _entity_type VARCHAR(128);
  IF PIs_User IS NULL
  THEN
    SET PIs_User = 1;
  END IF;
  IF PIs_User = 0
  THEN
    SET _entity_type = fGetEntityType(PUserOrEntity_ID);
  ELSE
    SET _entity_type = (SELECT b.Entity_Type
                        FROM tUserEntity a
                               INNER JOIN tEntity b ON a.Entity_ID = b.Entity_ID
                        WHERE a.User_ID = PUserOrEntity_ID
                        LIMIT 0, 1);
  END IF;
  RETURN _entity_type;
END;


DROP FUNCTION IF EXISTS fAddMultiplePOE;
CREATE FUNCTION fAddMultiplePOE(PTransaction_ID INT, PTransaction_Type VARCHAR(64), PPOE_Type VARCHAR(64),
                                PFile_Detail TEXT CHARACTER SET utf8
                                  COLLATE utf8_unicode_ci)
  RETURNS INT
BEGIN
  /*
    PFile_Detail :
      file1~file123~IMAGE~''~''§file1~file123~IMAGE~''~''
  */

  DECLARE _file_count INT DEFAULT 0;
  DECLARE _file_counter INT DEFAULT 1;
  DECLARE _poe_id INT DEFAULT NULL;

  SET _poe_id = (SELECT POE_ID
                 FROM tPOEHeader
                 WHERE POE_Type = PPOE_Type
                   AND Transaction_Type = PTransaction_Type
                   AND Transaction_ID = PTransaction_ID
                 LIMIT 0, 1);

  IF PFile_Detail = '' OR PFile_Detail IS NULL
  THEN
    DELETE
    FROM tPOEDetail
    WHERE POE_ID = _poe_id;

    DELETE
    FROM tPOEHeader
    WHERE POE_ID = _poe_id;
  ELSE
    /* Check if POE for transaction id not exists then create one */
    IF _poe_id = 0 OR _poe_id IS NULL
    THEN
      INSERT INTO tPOEHeader (Transaction_ID, Transaction_Type, POE_Type)
      VALUES (PTransaction_ID, PTransaction_Type, PPOE_Type);
      SET _poe_id = (SELECT last_insert_id());
    ELSE
      DELETE
      FROM tPOEDetail
      WHERE POE_ID = _poe_id;
    END IF;

    SET _file_count = fCountTokens(PFile_Detail, "§");

    files_loop : WHILE (_file_count > 0) DO
    SET @file = SPLIT_UTF(PFile_Detail, "§", _file_counter);
    IF @file = ''
    THEN
      LEAVE files_loop;
    END IF;

    SET @file_name = SPLIT_UTF(@file, "~", 1);
    SET @file_original_name = SPLIT_UTF(@file, "~", 2);
    SET @file_type = SPLIT_UTF(@file, "~", 3);
    SET @lat = SPLIT_UTF(@file, "~", 4);
    SET @long = SPLIT_UTF(@file, "~", 5);

    INSERT INTO tPOEDetail (POE_ID, File_Name, File_Original_Name, File_Type, Latitude, Longitude)
    VALUES (_poe_id, @file_name, @file_original_name, @file_type, @lat, @long);

    SET _file_count = _file_count -1;
    SET _file_counter = _file_counter +1;
    END WHILE;
  END IF;
  RETURN 1;
END;

DROP FUNCTION IF EXISTS fGetOperativeAreas;
CREATE FUNCTION fGetOperativeAreas(PEntity_ID INT)
  RETURNS TEXT
BEGIN
  /*
    <Root>
      <Item>
      <OperativeAreaID></OperativeAreaID>
      <OperativeArea></OperativeArea>
      </Item>
    <Root>
  */

  DECLARE _return TEXT DEFAULT "";

  SET _return = (SELECT group_concat(
                            concat('<Item><OperativeAreaID>', a.Operative_Area_ID, '</OperativeAreaID><OperativeArea>',
                                   b.Operative_Area,
                                   '</OperativeArea></Item>') SEPARATOR '')
                 FROM tEntityOperativeArea a
                        INNER JOIN tOperativeArea b ON a.Operative_Area_ID = b.Operative_Area_ID
                 WHERE Entity_ID = PEntity_ID);

  IF _return <> '' AND _return IS NOT NULL
  THEN
    SET _return = replace(concat('<Root>', _return, '</Root>'), '&', '&amp;');
  END IF;

  RETURN _return;
END;

DROP FUNCTION IF EXISTS fGetOperativeCities;
CREATE FUNCTION fGetOperativeCities(PEntity_ID INT)
  RETURNS TEXT
BEGIN
  /*
    <Root>
      <Item>
      <OperativeCityID></OperativeCityID>
      <CityID></CityID>
      <CityName></CityName>
      <StateID></StateID>
      <StateName></StateName>
      </Item>
    <Root>
  */

  DECLARE _return TEXT DEFAULT "";

  SET _return = (SELECT group_concat(
                            concat('<Item><OperativeCityID>', a._ID, '</OperativeCityID><CityID>', a.City_ID,
                                   '</CityID><CityName>',
                                   b.City_Name, '</CityName><StateID>', c.State_ID, '</StateID><StateName>',
                                   c.State_Name,
                                   '</StateName></Item>') SEPARATOR '')
                 FROM tEntityOperativeCity a
                        INNER JOIN tCity b ON a.City_ID = b.City_ID
                        INNER JOIN tState c ON b.State_ID = c.State_ID
                 WHERE Entity_ID = PEntity_ID);

  IF _return <> '' AND _return IS NOT NULL
  THEN
    SET _return = replace(concat('<Root>', _return, '</Root>'), '&', '&amp;');
  END IF;

  RETURN _return;
END;

DROP FUNCTION IF EXISTS fGetEntityNameForUser;
CREATE FUNCTION fGetEntityNameForUser(PUser_ID INT)
  RETURNS VARCHAR(264)
BEGIN
  RETURN (SELECT b.Entity_Name
          FROM tUserEntity a
                 INNER JOIN tEntity b ON a.Entity_ID = b.Entity_ID
          WHERE a.User_ID = PUser_ID
          LIMIT 0, 1);
END;

DROP FUNCTION IF EXISTS fGetActiveEntityCount;
CREATE FUNCTION fGetActiveEntityCount(PEntityOrUser_ID INT,
                                      PIs_User INT,
                                      PParameter VARCHAR(64),
                                      PMonth_Number INT,
                                      PYear YEAR,
                                      PIs_Mine INT)
  RETURNS INT
BEGIN

  DECLARE pActive_Count INT DEFAULT 0;
  DECLARE pTree TEXT;
  DECLARE pEntity_Type VARCHAR(64);

  IF PMonth_Number = 0
  THEN
    SET PMonth_Number = NULL;
  END IF;

  IF PIs_Mine IS NULL
  THEN
    SET PIs_Mine = 0;
  END IF;

  IF PIs_User = 1
  THEN
    SET pEntity_Type = (SELECT Entity_Type
                        FROM tUserEntity a
                               INNER JOIN tEntity b ON a.Entity_ID = b.Entity_ID
                        WHERE a.Entity_ID = PEntityOrUser_ID
                        LIMIT 0, 1);
    IF PIs_Mine = 1
    THEN
      SET pTree = PIs_User;
    ELSE
      SET pTree = fGetUsersTree(PEntityOrUser_ID, pEntity_Type, 1, 0);
    END IF;
  ELSE
    SET pTree = (SELECT group_concat(User_ID)
                 FROM tUserEntity
                 WHERE Entity_ID = PEntityOrUser_ID);

    SET @entity_users = (SELECT group_concat(b.User_ID)
                         FROM tEntity a
                                INNER JOIN tUserEntity b ON a.Entity_ID = b.Entity_ID
                         WHERE a.Managed_By = PEntityOrUser_ID);
    IF @entity_users <> '' AND @entity_users IS NOT NULL
    THEN
      SET pTree = concat(pTree, ',', @entity_users);
    END IF;
  END IF;

  SET pActive_Count = (SELECT count(*)
                       FROM tEntity
                       WHERE CASE PParameter
                               WHEN 'TGTWP'
                                 THEN Entity_Type = 'ENTWP'
                               WHEN 'TGTRS'
                                 THEN Entity_Type = 'ENTRSO'
                               WHEN 'TGTAGG'
                                 THEN Entity_Type = 'ENTAGG'
                               WHEN 'TGTBC'
                                 THEN Entity_Type = 'ENTBC'
                               WHEN 'TGTNGO'
                                 THEN Entity_Type = 'ENTNGO'
                               ELSE
                                 Entity_Type = 'ENTSCHOOL'
                         END
                         AND CASE
                               WHEN PMonth_Number IS NULL
                                 THEN
                                 year(Created_On) = PYear
                               ELSE
                                 month(Created_On) = PMonth_Number AND year(Created_On) = PYear
                         END
                         AND find_in_set(Currently_Managed_By, pTree));

  RETURN ifnull(pActive_Count, 0);
END;

DROP FUNCTION IF EXISTS fGetLogisticPartnerName;
CREATE FUNCTION fGetLogisticPartnerName(PCart_ID INT)
  RETURNS VARCHAR(1024)
BEGIN
  RETURN (SELECT User_Name
          FROM tPickupRequest a
                 INNER JOIN tUser b ON a.Logistic_Partner_User_ID = b.User_ID
          WHERE Cart_ID = PCart_ID
          limit 0,1);
END;

DROP FUNCTION IF EXISTS fGetLogisticPartnerPhone;
CREATE FUNCTION fGetLogisticPartnerPhone(PCart_ID INT)
  RETURNS BIGINT
BEGIN
  RETURN (SELECT Mobile_Number
          FROM tPickupRequest a
                 INNER JOIN tUser b ON a.Logistic_Partner_User_ID = b.User_ID
          WHERE Cart_ID = PCart_ID
          limit 0,1);
END;

DROP FUNCTION IF EXISTS fGetLogisticPartnerEntityName;
CREATE FUNCTION fGetLogisticPartnerEntityName(PCart_ID INT)
  RETURNS VARCHAR(1024)
BEGIN
  RETURN (SELECT b.Entity_Name
          FROM tPickupRequest a
                 INNER JOIN tEntity b ON a.Logistic_Partner_Entity_ID = b.Entity_ID
          WHERE a.Cart_ID = PCart_ID
          LIMIT 0, 1);
END;


DROP FUNCTION IF EXISTS fGetWorkshoAttendanceCount;
CREATE FUNCTION fGetWorkshoAttendanceCount(PSchool_ID INT)
  RETURNS TEXT
BEGIN
  /*
    <Root>
      <WorkshopType>
        <Type></Type>
        <TypeDescription></TypeDescription>
        <Teachers></Teachers>
        <Students></Students>
        <Total></Total>
      </WorkshopType>
    </Root>
  */
  DECLARE _return TEXT DEFAULT '';

  SET _return = (SELECT group_concat(val SEPARATOR '')
                 FROM (
                        SELECT concat('<WorkshopType><Type>', a.Workshop_Type, '</Type><TypeDescription>',
                                      b.Description,
                                      '</TypeDescription><Teachers>', ifnull(sum(Num_Teachers), 0),
                                      '</Teachers><Students>', ifnull(sum(Num_Students), 0), '</Students><Total>',
                                      (ifnull(sum(Num_Teachers), 0) + ifnull(sum(Num_Students), 0)),
                                      '</Total></WorkshopType>') AS val
                        FROM tWorkshop a
                               INNER JOIN tLookUp b ON a.Workshop_Type = b.LookUp_Code
                               INNER JOIN tWorkshopAttendance c
                                          ON a.Workshop_ID = c.Workshop_ID AND c.School_ID = PSchool_ID
                        GROUP BY Workshop_Type) x);

  IF _return <> '' AND _return IS NOT NULL
  THEN
    SET _return = concat('<Root>', _return, '</Root>');
  END IF;

  RETURN _return;
END;

DROP FUNCTION IF EXISTS fGetSchoolExcerciseDetail;
CREATE FUNCTION fGetSchoolExcerciseDetail(PSchool_ID INT)
  RETURNS TEXT
BEGIN

  /*
    <Root>
      <ExcerciseDetail>
        <Excercise></Excercise>
        <Activity></Activity>
        <Date></Date>
      </ExcerciseDetail>
    </Root>
  */

  DECLARE _detail TEXT DEFAULT '';

  SET _detail = (SELECT group_concat(
                            concat('<ExcerciseDetail><Excercise>', b.Exercise, '</Excercise><Activity>', c.Activity,
                                   '</Activity><Date>', ifnull(date_format(a.Created_On, '%d/%m/%Y'), "''"),
                                   '</Date></ExcerciseDetail>')
                            SEPARATOR '')
                 FROM tSchoolExcercise a
                        INNER JOIN tExercise b ON a.Excercise_ID = b.Exercise_ID
                        LEFT JOIN tActivity c ON a.Activity_ID = c.Activity_ID
                 WHERE School_ID = PSchool_ID);

  IF _detail <> '' AND _detail IS NOT NULL
  THEN
    SET _detail = concat('<Root>', _detail, '</Root>');
  END IF;

  RETURN _detail;

END;

DROP FUNCTION IF EXISTS fGetSchoolExcerciseEwasteCollected;
CREATE FUNCTION fGetSchoolExcerciseEwasteCollected(PSchool_ID INT)
  RETURNS FLOAT
BEGIN
  RETURN (SELECT ifnull(sum(Ewaste_Collected), 0)
          FROM tSchoolExcercise
          WHERE School_ID = PSchool_ID);
END;

DROP FUNCTION IF EXISTS fGetSchoolExcerciseParticipants;
CREATE FUNCTION fGetSchoolExcerciseParticipants(PSchool_ID INT)
  RETURNS TEXT
BEGIN
  /*
    <Root>
      <Excercise>
        <Teachers></Teachers>
        <Students></Students>
        <Others></Others>
      </Excercise>
    <Root>
  */

  RETURN (SELECT concat('<Root><Excercise><Teachers>', ifnull(sum(Num_Teachers), 0), '</Teachers><Students>',
                        ifnull(sum(Num_Students), 0), '</Students><Others>', ifnull(sum(Num_Outside_People), 0),
                        '</Others></Excercise></Root>')
          FROM tSchoolExcercise
          WHERE School_ID = PSchool_ID);
END;

DROP FUNCTION IF EXISTS fGetEvaluationDetail;
CREATE FUNCTION fGetEvaluationDetail(PSchool_ID INT)
  RETURNS TEXT
BEGIN

  /*
    <Root>
      <Evaluation>
        <EvaluationType></EvaluationType>
        <Rating></Rating>
      </Evaluation>
      <Evaluation>
        <EvaluationType></EvaluationType>
        <Rating></Rating>
      </Evaluation>
    </Root>
  */

  DECLARE _evaluation_detail TEXT CHARACTER SET utf8
    COLLATE utf8_unicode_ci DEFAULT "";

  SET _evaluation_detail = (SELECT group_concat(
                                       concat('<Evaluation><EvaluationType>', b.Evaluation_Type,
                                              '</EvaluationType><Rating>', b.Rating
                                         , '</Rating></Evaluation>') SEPARATOR '')
                            FROM tSchoolEvaluationHeader a
                                   INNER JOIN tSchoolEvaluationDetail b
                                              ON a.School_Evaluation_ID = b.School_Evaluation_ID
                            WHERE a.School_ID = PSchool_ID);

  IF _evaluation_detail <> '' AND _evaluation_detail IS NOT NULL
  THEN
    SET _evaluation_detail = concat('<Root>', _evaluation_detail, '</Root>');
  END IF;

  RETURN _evaluation_detail;

END;

DROP FUNCTION IF EXISTS fGetMonthlyProducerTargetDetail;
CREATE FUNCTION fGetMonthlyProducerTargetDetail(PMonth_Number INT, PYear YEAR, PUserOrEntity_ID INT, PIsUser INT)
  RETURNS TEXT
BEGIN

  /*
    <Root>
      <Target>
      <TargetParameter></TargetParameter>
      <TargetValue></TargetValue>
      </Target>
      <Target>
      <TargetParameter></TargetParameter>
      <TargetValue></TargetValue>
      </Target>
    </Root>
  */

  DECLARE _target_detail TEXT DEFAULT '';

  IF PMonth_Number = 0
  THEN
    SET PMonth_Number = NULL;
  END IF;
  IF PYear = 0 OR PYear IS NULL
  THEN
    SET PYear = year(curdate());
  END IF;

  IF PMonth_Number IS NULL
  THEN
    SET _target_detail = (SELECT group_concat(
                                     concat('<Target><TargetParameter>', x.Parameter, '</TargetParameter><TargetValue>',
                                            ifnull(x.val, 0),
                                            '</TargetValue></Target>') SEPARATOR
                                     '')
                          FROM (
                                 SELECT Parameter,
                                        sum(Target_Value) AS val
                                 FROM tProducerTargetHeader a
                                        INNER JOIN tProducerTargetDetail b
                                                   ON a.Producer_Target_ID = b.Producer_Target_ID
                                 WHERE Month_Number IS NOT NULL
                                   AND Month_Number <> 0
                                   AND Target_Year = PYear
                                   AND a.Producer_ID = PUserOrEntity_ID
                                 GROUP BY Parameter) x);
  ELSE
    SET _target_detail = (SELECT group_concat(
                                     concat('<Target><TargetParameter>', b.Parameter, '</TargetParameter><TargetValue>',
                                            b.Target_Value,
                                            '</TargetValue></Target>')
                                     SEPARATOR '')
                          FROM tProducerTargetHeader a
                                 INNER JOIN tProducerTargetDetail b
                                            ON a.Producer_Target_ID = b.Producer_Target_ID
                          WHERE a.Target_Year = PYear
                            AND a.Month_Number = PMonth_Number
                            AND a.Producer_ID = PUserOrEntity_ID);
  END IF;
  IF _target_detail <> '' AND _target_detail IS NOT NULL
  THEN
    SET _target_detail = concat('<Root>', _target_detail, '</Root>');
  END IF;
  RETURN _target_detail;
END;

DROP FUNCTION IF EXISTS fGetAnnualProducerTargetDetail;
CREATE FUNCTION fGetAnnualProducerTargetDetail(PYear YEAR, PUserOrEntity_ID INT, PIsUser INT)
  RETURNS TEXT
BEGIN
  /*
    <Root>
      <Target>
      <TargetParameter></TargetParameter>
      <TargetValue></TargetValue>
      </Target>
      <Target>
      <TargetParameter></TargetParameter>
      <TargetValue></TargetValue>
      </Target>
    </Root>
  */

  DECLARE _target_detail TEXT DEFAULT '';

  IF PYear = 0 OR PYear IS NULL
  THEN
    SET PYear = year(curdate());
  END IF;

  SET _target_detail = (SELECT group_concat(
                                   concat('<Target><TargetParameter>', b.Parameter, '</TargetParameter><TargetValue>',
                                          b.Target_Value,
                                          '</TargetValue></Target>') SEPARATOR
                                   '')
                        FROM tProducerTargetHeader a
                               INNER JOIN tProducerTargetDetail b ON a.Producer_Target_ID = b.Producer_Target_ID
                        WHERE (Month_Number = 0 OR Month_Number IS NULL)
                          AND Target_Year = PYear
                          AND a.Producer_ID = PUserOrEntity_ID);
  IF _target_detail <> '' AND _target_detail IS NOT NULL
  THEN
    SET _target_detail = concat('<Root>', _target_detail, '</Root>');
  END IF;
  RETURN _target_detail;
END;

DROP FUNCTION IF EXISTS fIsStringEmptyOrZeroOrNull;
CREATE FUNCTION fIsStringEmptyOrZeroOrNull(val TEXT CHARACTER SET utf8
  COLLATE utf8_unicode_ci)
  RETURNS BIT
BEGIN

  IF val = '' OR val IS NULL
  THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;

DROP FUNCTION IF EXISTS fIsNumberEmptyOrZeroOrNull;
CREATE FUNCTION `fIsNumberEmptyOrZeroOrNull`(val INT)
  RETURNS BIT
BEGIN
  IF val IS NULL OR val = 0 OR val = ''
  THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;

DROP FUNCTION IF EXISTS fGetActualCartPrice;
CREATE FUNCTION fGetActualCartPrice(PCart_ID INT)
  RETURNS FLOAT
BEGIN
  RETURN (SELECT sum(Cart_Price)
          FROM (
                 SELECT ifnull((Inspected_Quantity * Actual_Price) + Seller_GST, 0) AS Cart_Price
                 FROM tCartItem
                 WHERE Cart_ID = PCart_ID
               ) x);
END;


DROP FUNCTION IF EXISTS fGetTotalPaidAmmountForCart;
CREATE FUNCTION fGetTotalPaidAmmountForCart(PCart_ID INT)
  RETURNS FLOAT
BEGIN
  RETURN (SELECT sum(b.Ammount)
          FROM tSellerBill a
                 INNER JOIN tSellerBillAmount b ON a.Bill_ID = b.Bill_ID
          WHERE a.Cart_ID = PCart_ID);
END;

DROP FUNCTION IF EXISTS fGenerateBillNumber;
CREATE FUNCTION fGenerateBillNumber(PEntity_ID INT)
  RETURNS VARCHAR(1024)
BEGIN

  /*
    Expected result : BILL/NDOCC/000008 (Old)
    INV/NDOCC/000008/18072018 (New)
  */

  DECLARE _entity_name VARCHAR(1024) DEFAULT '';

  DECLARE _split_name_count INT DEFAULT 0;
  DECLARE _split_name_counter INT DEFAULT 1;

  DECLARE _name VARCHAR(1024) DEFAULT '';
  DECLARE _bill_sequence VARCHAR(1024) DEFAULT '';
  DECLARE _bill_number VARCHAR(1024) DEFAULT '';
  DECLARE _date VARCHAR(1024);

  SET _date = date_format(curdate(), '%d/%m/%Y');

  SET _entity_name = fGetEntityName(PEntity_ID);
  -- Expected result : AMB

  -- SET _entity_name = replace(_entity_name, ' ', '|');

  SET _entity_name = fStripSpecialChars(_entity_name, 0, 1, 1, 1);

  SET _split_name_count = fCountTokens(_entity_name, '|');

  IF _split_name_count > 1
  THEN
    name_loop : WHILE (_split_name_count > 0) DO
    SET @name = SPLIT_UTF(_entity_name, '|', _split_name_counter);

    IF @name <> '' AND @name IS NOT NULL
    THEN
      SET _name = concat(_name, substring(@name, 1, 1));
    END IF;

    SET _split_name_count = _split_name_count -1;
    SET _split_name_counter = _split_name_counter +1;
    END WHILE;
  ELSE
    SET _name = substring(_entity_name, 1, 3);
  END IF;

  SET _name = upper(_name);

  INSERT INTO tBillSequence VALUES (NULL);
  SET _bill_sequence = CONCAT(LPAD(LAST_INSERT_ID(), 6, '0'));

  SET _bill_number = concat('INV/', _name, '/', _bill_sequence, '/', _date);

  RETURN _bill_number;

END;

DROP FUNCTION IF EXISTS fGetConfigItem;
CREATE FUNCTION fGetConfigItem(PConfig_Item VARCHAR(1024))
  RETURNS TEXT
BEGIN
  RETURN (SELECT Configured_Value
          FROM tConfig
          WHERE Config_Item = PConfig_Item
          LIMIT 0, 1);
END;

DROP FUNCTION IF EXISTS fGetSellerGSTForItem;
CREATE FUNCTION fGetSellerGSTForItem(PCart_Item_ID INT, PGST_Percentage DECIMAL(10, 2))
  RETURNS FLOAT
BEGIN

  IF PGST_Percentage IS NULL
  THEN
    SET PGST_Percentage = ifnull(cast(fGetConfigItem('SELLER_GST') AS DECIMAL(10, 2)), 0);
  END IF;

  RETURN (SELECT (Inspected_Quantity * Actual_Price * PGST_Percentage) / 100
          FROM tCartItem
          WHERE Cart_Item_ID = PCart_Item_ID);
END;

DROP FUNCTION IF EXISTS fGetRecyclerGSTForItem;
CREATE FUNCTION fGetRecyclerGSTForItem(PCart_Item_ID INT)
  RETURNS FLOAT
BEGIN

  DECLARE _gst_percentage DECIMAL(10, 2) DEFAULT 0;

  SET _gst_percentage = ifnull(cast(fGetConfigItem('RECYCLER_GST') AS DECIMAL(10, 2)), 0);

  RETURN (SELECT (Recycler_Quantity * Actual_Price * _gst_percentage) / 100
          FROM tCartItem
          WHERE Cart_Item_ID = PCart_Item_ID);
END;

DROP FUNCTION if exists fGetPaymentToSeller;
CREATE FUNCTION fGetPaymentToSeller(PUser_ID INT, PYear INT, PMonth_Number INT, PSeller_Type VARCHAR(64))
  RETURNS FLOAT
BEGIN
  RETURN (SELECT sum(Ammount)
          FROM tSellerBill a
                 INNER JOIN tSellerBillAmount b ON a.Bill_ID = b.Bill_ID
                 INNER JOIN tCart c ON a.Cart_ID = c.Cart_ID
                 INNER JOIN tEntity d ON c.Entity_ID = d.Entity_ID
          WHERE year(b.Payment_Date) = PYear
            AND month(b.Payment_Date) = PMonth_Number
            AND d.Entity_Type = PSeller_Type);
END;



DROP FUNCTION IF EXISTS fGetTotalDispatchedQuantity;
CREATE FUNCTION fGetTotalDispatchedQuantity(PLogistic_ID INT)
  RETURNS FLOAT
BEGIN
  DECLARE _qty FLOAT DEFAULT 0;
  SET _qty = (SELECT sum(b.Quantity) AS Total_Quantity
              FROM tInvoiceHeader a
                     INNER JOIN tInvoiceDetail b ON a.Invoice_ID = b.Invoice_ID
                     INNER JOIN tDispatch c ON a.Dispatch_ID = c.Dispatch_ID
              WHERE c.Logistic_ID = PLogistic_ID);

  RETURN ifnull(_qty, 0);
END;

DROP FUNCTION IF EXISTS fGetStateNameForEntityOrUser;
CREATE FUNCTION fGetStateNameForEntityOrUser(PEntityOrUser_ID INT, PIs_User INT)
  RETURNS VARCHAR(1024)
BEGIN

  IF PIs_User = 1
  THEN
    SET PEntityOrUser_ID = (SELECT Entity_ID
                            FROM tUserEntity
                            WHERE User_ID = PEntityOrUser_ID
                            LIMIT 0, 1);
  END IF;

  RETURN (SELECT b.State_Name
          FROM tEntity a
                 INNER JOIN tState b ON a.State_ID = b.State_ID
          WHERE a.Entity_ID = PEntityOrUser_ID
          LIMIT 0, 1);

END;

DROP FUNCTION IF EXISTS fGetCityNameForEntityOrUser;
CREATE FUNCTION fGetCityNameForEntityOrUser(PEntityOrUser_ID INT, PIs_User INT)
  RETURNS VARCHAR(1024)
BEGIN
  IF PIs_User = 1
  THEN
    SET PEntityOrUser_ID = (SELECT Entity_ID
                            FROM tUserEntity
                            WHERE User_ID = PEntityOrUser_ID
                            LIMIT 0, 1);
  END IF;

  RETURN (SELECT b.City_Name
          FROM tEntity a
                 INNER JOIN tCity b ON a.City_ID = b.City_ID
          WHERE a.Entity_ID = PEntityOrUser_ID
          LIMIT 0, 1);
END;


DROP FUNCTION IF EXISTS fGetInvoiceTotalBaseAmmount;
CREATE FUNCTION fGetInvoiceTotalBaseAmmount(PLogistic_ID INT)
  RETURNS FLOAT
BEGIN
  DECLARE _ammount FLOAT DEFAULT 0;
  SET _ammount = (SELECT sum(Invoice_Base_Amount)
                  FROM tInvoiceHeader a
                         INNER JOIN tDispatch b ON a.Dispatch_ID = b.Dispatch_ID
                  WHERE b.Logistic_ID = PLogistic_ID);
  RETURN ifnull(_ammount, 0);
END;

DROP FUNCTION IF EXISTS fGetEntityIDByUser;
CREATE FUNCTION fGetEntityIDByUser(PUser_ID INT)
  RETURNS INT
BEGIN
  RETURN (SELECT Entity_ID
          FROM tUserEntity
          WHERE User_ID = PUser_ID
          LIMIT 0, 1);
END;


DROP FUNCTION IF EXISTS fGetRecyclerGSTAmmountByRate;
CREATE FUNCTION fGetRecyclerGSTAmmountByRate(PRate FLOAT)
  RETURNS FLOAT
BEGIN
  DECLARE _gst_percentage DECIMAL(10, 2) DEFAULT 0;
  DECLARE _gst_ammount FLOAT;

  SET _gst_percentage = ifnull(cast(fGetConfigItem('RECYCLER_GST') AS DECIMAL(10, 2)), 0);

  SET _gst_ammount = ((PRate * _gst_percentage) / 100);

  RETURN ifnull(_gst_ammount, 0);
END;

DROP FUNCTION IF EXISTS fGetRecyclerGSTAmmountByRateAndGST;
CREATE FUNCTION fGetRecyclerGSTAmmountByRateAndGST(PRate FLOAT, PGST FLOAT)
  RETURNS FLOAT
BEGIN
  DECLARE _gst_ammount FLOAT;

  SET _gst_ammount = ((PRate * PGST) / 100);

  RETURN ifnull(_gst_ammount, 0);
END;


DROP FUNCTION IF EXISTS fGenerateInvoice;
CREATE FUNCTION fGenerateInvoice()
  RETURNS VARCHAR(1024)
BEGIN

  DECLARE _invoice_sequence VARCHAR(1024);

  INSERT INTO tInvoiceSequence VALUES (NULL);
  SET _invoice_sequence = CONCAT(LPAD(LAST_INSERT_ID(), 6, '0'));

  RETURN concat('INV/KARO/', _invoice_sequence);

END;


DROP FUNCTION IF EXISTS fGetTotalInvoiceQuantityByCategoryAndLogistic;
CREATE FUNCTION fGetTotalInvoiceQuantityByCategoryAndLogistic(PLogistic_ID INT, PCategory_ID INT)
  RETURNS FLOAT
BEGIN
  RETURN ifnull((SELECT sum(Quantity)
                 FROM tInvoiceHeader a
                        INNER JOIN tInvoiceDetail b ON a.Invoice_ID = b.Invoice_ID
                        INNER JOIN tDispatch c ON a.Dispatch_ID = c.Dispatch_ID
                 WHERE c.Logistic_ID = PLogistic_ID
                   AND b.Category_ID = PCategory_ID), 0);
END;

DROP FUNCTION IF EXISTS fIsEntityActive;
CREATE FUNCTION fIsEntityActive(PEntity_ID INT)
  RETURNS INT(1)
BEGIN
  IF exists(SELECT *
            FROM tUserEntity a
                   INNER JOIN tUser b ON a.User_ID = b.User_ID
            WHERE b.Status = 'ACTIVE'
              AND b.Is_Delete = 0
              AND b.Is_Primary = 1
              AND a.Entity_ID = PEntity_ID)
  THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END;

DROP FUNCTION IF EXISTS fGetKaroPrimaryUserID;
CREATE FUNCTION fGetKaroPrimaryUserID()
  RETURNS INT
BEGIN
  RETURN (SELECT c.User_ID
          FROM tEntity a
                 INNER JOIN tUserEntity b ON a.Entity_ID = b.Entity_ID
                 INNER JOIN tUser c ON b.User_ID = c.User_ID
          WHERE a.Entity_Type = 'ENTKARO'
            AND c.Is_Primary = 1
          LIMIT 0, 1);
END;

DROP FUNCTION IF EXISTS fAddAttachments;
CREATE FUNCTION fAddAttachments(PObject_Type VARCHAR(1024), PTransaction_ID INT,
                                PFile_Detail TEXT CHARACTER SET utf8
                                  COLLATE utf8_unicode_ci)
  RETURNS INT
BEGIN
  /*
    PFile_Detail : File_Name~File_Original_Name~File_Title~File_Link~File_Type~File_Size~Lattitude_Longitude§File_Name~File_Original_Name~File_Title~File_Link~File_Type~File_Size~Lattitude_Longitude
  */

  DECLARE _file_count INT DEFAULT 0;
  DECLARE _file_counter INT DEFAULT 1;
  DECLARE _attachment_id INT;

  SET _attachment_id = (SELECT Attachment_ID
                        FROM tAttachmentHeader
                        WHERE Transaction_ID = PTransaction_ID
                          AND Object_Type = PObject_Type
                        LIMIT 0, 1);

  IF _attachment_id = 0 OR _attachment_id IS NULL
  THEN
    INSERT INTO tAttachmentHeader (Object_Type, Transaction_ID)
    VALUES (PObject_Type, PTransaction_ID);
    SET _attachment_id = (SELECT last_insert_id());
  ELSE
    DELETE
    FROM tAttachmentDetail
    WHERE Attachment_ID = _attachment_id;
  END IF;

  SET _file_count = fCountTokens(PFile_Detail, '§');

  file_loop : WHILE (_file_count > 0) DO
  SET @file_detail = SPLIT_UTF(PFile_Detail, '§', _file_counter);
  IF @file_detail = '' OR @file_detail IS NULL
  THEN
    LEAVE file_loop;
  END IF;

  SET @file_name = SPLIT_UTF(@file_detail, '~', 1);
  SET @file_original_name = SPLIT_UTF(@file_detail, '~', 2);
  SET @file_title = SPLIT_UTF(@file_detail, '~', 3);
  SET @file_link = SPLIT_UTF(@file_detail, '~', 4);
  SET @file_type = SPLIT_UTF(@file_detail, '~', 5);
  SET @file_size = SPLIT_UTF(@file_detail, '~', 6);
  IF @file_size = '' OR @file_size IS NULL
  THEN
    SET @file_size = 0;
  END IF;
  SET @file_latlng = SPLIT_UTF(@file_detail, '~', 7);

  INSERT INTO tAttachmentDetail (Attachment_ID, File_Name, File_Original_Name, File_Title, File_Link, File_Type,
                                 File_Size, Latitude_Longitude)
  VALUES (_attachment_id, @file_name, @file_original_name, @file_title, @file_link, @file_type,
          cast(@file_size AS UNSIGNED),
          @file_latlng);

  SET _file_count = _file_count -1;
  SET _file_counter = _file_counter +1;
  END WHILE;

  RETURN 1;
END;

DROP FUNCTION IF EXISTS fGetAttachmentXML;
CREATE FUNCTION fGetAttachmentXML(PObject_Type VARCHAR(1024), PTransaction_ID INT)
  RETURNS TEXT CHARACTER SET utf8
    COLLATE utf8_unicode_ci
BEGIN
  /*
    <Root>
      <File>
        <FileName></FileName>
        <FileOriginalName></FileOriginalName>
        <FileTitle></FileTitle>
        <FileLink></FileLink>
        <FileType></FileType>
        <FileSize></FileSize>
        <LattitudeLongitude></LattitudeLongitude>
      </File>
      <File>
        <FileName></FileName>
        <FileOriginalName></FileOriginalName>
        <FileTitle></FileTitle>
        <FileLink></FileLink>
        <FileType></FileType>
        <FileSize></FileSize>
        <LattitudeLongitude></LattitudeLongitude>
      </File>
    <Root>
  */

  DECLARE _file_xml TEXT CHARACTER SET utf8
    COLLATE utf8_unicode_ci DEFAULT '';

  SET _file_xml = (SELECT group_concat(concat(
                                           '<File><FileName>', CASE
                                                                 WHEN b.File_Name = '' OR b.File_Name IS NULL
                                                                   THEN "''"
                                                                 ELSE b.File_Name END,
                                           '</FileName><FileOriginalName>',
                                           CASE
                                             WHEN b.File_Original_Name = '' OR b.File_Original_Name IS NULL
                                               THEN "''"
                                             ELSE b.File_Original_Name END,
                                           '</FileOriginalName><FileTitle>',
                                           CASE
                                             WHEN b.File_Title = '' OR b.File_Title IS NULL
                                               THEN "''"
                                             ELSE b.File_Title END,
                                           '</FileTitle><FileLink>',
                                           CASE
                                             WHEN b.File_Link = '' OR b.File_Link IS NULL
                                               THEN "''"
                                             ELSE b.File_Link END,
                                           '</FileLink><FileType>', CASE
                                                                      WHEN b.File_Type = '' OR b.File_Type IS NULL
                                                                        THEN "''"
                                                                      ELSE b.File_Type END,
                                           '</FileType><FileSize>', b.File_Size,
                                           '</FileSize><LattitudeLongitude>',
                                           CASE
                                             WHEN b.Latitude_Longitude = '' OR b.Latitude_Longitude IS NULL
                                               THEN "''"
                                             ELSE b.Latitude_Longitude END,
                                           '</LattitudeLongitude></File>') SEPARATOR '')
                   FROM tAttachmentHeader a
                          INNER JOIN tAttachmentDetail b ON a.Attachment_ID = b.Attachment_ID
                   WHERE a.Object_Type = PObject_Type
                     AND a.Transaction_ID = PTransaction_ID);

  RETURN ifnull(concat('<Root>', _file_xml, '</Root>'), '');

END;


DROP FUNCTION IF EXISTS fDeleteAttachments;
CREATE FUNCTION fDeleteAttachments(PObject_Type VARCHAR(1024), PTransaction_ID INT)
  RETURNS INT
BEGIN
  DECLARE _attachment_id INT;
  SET _attachment_id = (SELECT Attachment_ID
                        FROM tAttachmentHeader
                        WHERE Object_Type = PObject_Type
                          AND Transaction_ID = PTransaction_ID
                        LIMIT 0, 1);

  DELETE
  FROM tAttachmentDetail
  WHERE Attachment_ID = _attachment_id;
  DELETE
  FROM tAttachmentHeader
  WHERE Attachment_ID = _attachment_id;

  RETURN 1;
END;

DROP FUNCTION IF EXISTS fAddObjectGeoLocation;
CREATE FUNCTION fAddObjectGeoLocation(PObject_Type VARCHAR(1024), PObject_ID INT, PLatitude_Longitude VARCHAR(1024))
  RETURNS INT
BEGIN
  IF exists(SELECT *
            FROM tObjectGeoLocation
            WHERE Object_Type = PObject_Type
              AND Object_ID = PObject_ID)
  THEN
    UPDATE tObjectGeoLocation
    SET Latitude_Longitude = PLatitude_Longitude
    WHERE Object_Type = PObject_Type
      AND Object_ID = PObject_ID;
  ELSE
    INSERT INTO tObjectGeoLocation (Object_Type, Object_ID, Latitude_Longitude)
    VALUES (PObject_Type, PObject_ID, PLatitude_Longitude);
  END IF;

  RETURN 1;
END;

DROP FUNCTION IF EXISTS fDeleteObjectGeoLocation;
CREATE FUNCTION fDeleteObjectGeoLocation(PObject_Type VARCHAR(1024), PObject_ID INT)
  RETURNS INT
BEGIN
  IF exists(SELECT *
            FROM tObjectGeoLocation
            WHERE Object_Type = PObject_Type
              AND Object_ID = PObject_ID)
  THEN
    DELETE
    FROM tObjectGeoLocation
    WHERE Object_Type = PObject_Type
      AND Object_ID = PObject_ID;
  END IF;

  RETURN 1;
END;

DROP FUNCTION IF EXISTS fGetWHTotalAvailableQuantity;
CREATE FUNCTION fGetWHTotalAvailableQuantity(PWH_ID INT)
  RETURNS FLOAT
BEGIN

  -- DECLARE _total_inward_quantity FLOAT;
  -- DECLARE _total_outward_quantity FLOAT;
  DECLARE _total FLOAT;

  /*
  SET _total_inward_quantity = (SELECT sum(ifnull(b.Inward_Quantity, 0))
                                FROM tWHGRNHeader a INNER JOIN tWHGRNDetail b
                                    ON a.WH_GRN_ID = b.WH_GRN_ID AND a.WH_ID = PWH_ID);

  SET _total_outward_quantity = (SELECT sum(ifnull(b.Quantity, 0))
                                 FROM tInvoiceHeader a INNER JOIN tInvoiceDetail b ON a.Invoice_ID = b.Invoice_ID
                                 WHERE a.WH_ID = PWH_ID);


  set _total = (ifnull(_total_inward_quantity, 0) - ifnull(_total_outward_quantity, 0));

  if _total < 0 THEN
    set _total = 0 ;
  END IF;

  return _total ;
  */

  SET _total = (SELECT sum(Closing_Quantity)
                FROM tWHStockTotal
                WHERE WH_ID = PWH_ID);
  IF _total < 0
  THEN
    SET _total = 0;
  END IF;

  RETURN _total;

END;

DROP FUNCTION IF EXISTS fGetTotalOutwardQuantityByCategory;
CREATE FUNCTION fGetTotalOutwardQuantityByCategory(PWH_ID INT, PCategory_ID INT)
  RETURNS FLOAT
BEGIN
  RETURN (SELECT ifnull(sum(ifnull(b.Quantity, 0)), 0)
          FROM tInvoiceHeader a
                 INNER JOIN tInvoiceDetail b ON a.Invoice_ID = b.Invoice_ID
          WHERE a.WH_ID = PWH_ID
            AND b.Category_ID = PCategory_ID);
END;

DROP FUNCTION IF EXISTS fGetTotalEventInvitees;
CREATE FUNCTION fGetTotalEventInvitees(PEvent_ID INT)
  RETURNS INT
BEGIN
  DECLARE _cnt INT;
  SET _cnt = (
    SELECT count(*)
    FROM tCalendarEvent a
           INNER JOIN tCalendarEventEntity b ON a.Event_ID = b.Event_ID AND a.Event_ID = PEvent_ID
           INNER JOIN tEntity c ON b.Entity_Type = c.Entity_Type
           INNER JOIN tUserEntity d ON c.Entity_ID = d.Entity_ID
           INNER JOIN tUser e ON d.User_ID = e.User_ID);

  RETURN ifnull(_cnt, 0);
END;

DROP FUNCTION IF EXISTS fGetAttendanceTypeForUser;
CREATE FUNCTION fGetAttendanceTypeForUser(PEvent_ID INT, PUser_ID INT)
  RETURNS INT
BEGIN
  DECLARE _attendance_type INT;

  SET _attendance_type = (SELECT Attendance_Type
                          FROM tCalendarEventAttendanceHeader a
                                 INNER JOIN tCalendarEventAttendanceDetail b
                                            ON a.Attendance_ID = b.Attendance_ID AND a.Event_ID = PEvent_ID AND
                                               b.User_ID = PUser_ID
                          LIMIT 0, 1);

  RETURN ifnull(_attendance_type, 0);
END;

DROP FUNCTION IF EXISTS fGetTotalAttendanceByType;
CREATE FUNCTION fGetTotalAttendanceByType(PEvent_ID INT, PAttendance_Type INT)
  RETURNS INT
BEGIN
  DECLARE _cnt INT DEFAULT 0;

  SET _cnt = (SELECT count(*)
              FROM tCalendarEventAttendanceHeader a
                     INNER JOIN tCalendarEventAttendanceDetail b
                                ON a.Attendance_ID = b.Attendance_ID AND a.Event_ID = PEvent_ID AND
                                   b.Attendance_Type = PAttendance_Type);

  RETURN ifnull(_cnt, 0);

END;

DROP FUNCTION IF EXISTS fUpdateWHStockDetail;
CREATE FUNCTION fUpdateWHStockDetail(PWH_ID INT, PCategory_ID INT, PClosing_Date DATE, PQuantity FLOAT, PIs_Inward INT)
  RETURNS INT
BEGIN

  DECLARE _max_date DATE;
  DECLARE _closing_quantity FLOAT DEFAULT 0;

  /* Update WH Stock Total */
  IF NOT exists(SELECT *
                FROM tWHStockTotal
                WHERE WH_ID = PWH_ID
                  AND Category_ID = PCategory_ID)
  THEN
    INSERT INTO tWHStockTotal (WH_ID, Category_ID, Opening_Date, Closing_Date, Closing_Quantity)
    VALUES (PWH_ID, PCategory_ID, PClosing_Date, PClosing_Date,
            CASE
              WHEN PIs_Inward = 1
                THEN 0 + PQuantity
              ELSE 0 - PQuantity END);
  ELSE
    UPDATE tWHStockTotal
    SET Closing_Date     = PClosing_Date,
        Closing_Quantity = (CASE
                              WHEN PIs_Inward = 1
                                THEN Closing_Quantity + PQuantity
                              ELSE Closing_Quantity - PQuantity END)
    WHERE WH_ID = PWH_ID
      AND Category_ID = PCategory_ID;
  END IF;

  /* Update WH Stock */
  IF NOT exists(SELECT *
                FROM tWHStock
                WHERE WH_ID = PWH_ID
                  AND Category_ID = PCategory_ID
                  AND Updated_Date = PClosing_Date)
  THEN
    SET _max_date = (SELECT max(Updated_Date)
                     FROM tWHStock
                     WHERE WH_ID = PWH_ID
                       AND Category_ID = PCategory_ID);
    SET _closing_quantity = (SELECT Closing_Quantity
                             FROM tWHStock
                             WHERE WH_ID = PWH_ID
                               AND Category_ID = PCategory_ID
                               AND Updated_Date = _max_date
                             LIMIT 0, 1);

    INSERT INTO tWHStock (WH_ID, Category_ID, Updated_Date, Opening_Quantity, Closing_Quantity, Inward_Quantity,
                          Outward_Quantity)
    VALUES (PWH_ID, PCategory_ID, PClosing_Date, ifnull(_closing_quantity, 0),
            CASE
              WHEN PIs_Inward = 1
                THEN
                (ifnull(_closing_quantity, 0) + PQuantity)
              ELSE
                (ifnull(_closing_quantity, 0) - PQuantity)
              END,
            (CASE
               WHEN PIs_Inward = 1
                 THEN PQuantity
               ELSE 0 END),
            (CASE
               WHEN PIs_Inward = 0
                 THEN PQuantity
               ELSE 0 END));
  ELSE
    UPDATE tWHStock
    SET Closing_Quantity = (CASE
                              WHEN PIs_Inward = 1
                                THEN Closing_Quantity + PQuantity
                              ELSE Closing_Quantity - PQuantity END),
        Inward_Quantity  = (CASE
                              WHEN PIs_Inward = 1
                                THEN Inward_Quantity + PQuantity
                              ELSE Inward_Quantity END),
        Outward_Quantity = (CASE
                              WHEN PIs_Inward = 0
                                THEN Outward_Quantity + PQuantity
                              ELSE Closing_Quantity END)
    WHERE WH_ID = PWH_ID
      AND Category_ID = PCategory_ID
      AND Updated_Date = PClosing_Date;
  END IF;

  RETURN 1;

END;

DROP FUNCTION IF EXISTS fIsDocumentUploadedForGRN;
CREATE FUNCTION fIsDocumentUploadedForGRN(PInvoice_ID INT, PConfig_Document_ID INT, PIs_Inward INT)
  RETURNS INT
BEGIN

  DECLARE _cnt INT DEFAULT 0;

  IF PIs_Inward = 1
  THEN
    SET _cnt = (SELECT count(*)
                FROM tOutwardAllocationHeader a
                       INNER JOIN tOutwardAllocationDetail b ON a.Allocation_ID = b.Allocation_ID
                       INNER JOIN tWHGRNDocumentHeader c ON b.WH_GRN_ID = c.WH_GRN_ID
                       INNER JOIN tWHGRNDocumentDetail d ON c.Document_ID = d.Document_ID
                       INNER JOIN tWHGRNDocumentConfig e ON d.Document_Configuration_ID = e.Document_Configuration_ID
                WHERE a.Invoice_ID = PInvoice_ID
                  AND d.Document_Configuration_ID = PConfig_Document_ID);
  ELSE
    SET _cnt = (SELECT count(*)
                FROM tRecyclerGRNHeader a
                       INNER JOIN tInvoiceHeader b ON a.Invoice_Number = b.Invoice_Number
                       INNER JOIN tRecyclerGRNDocumentHeader c ON a.GRN_ID = c.GRN_ID
                       INNER JOIN tRecyclerGRNDocumentDetail d ON c.Document_ID = d.Document_ID
                       INNER JOIN tRecyclerGRNDocumentConfig e
                                  ON d.Document_Configuration_ID = e.Document_Configuration_ID
                WHERE b.Invoice_ID = PInvoice_ID
                  AND d.Document_Configuration_ID = PConfig_Document_ID);
  END IF;

  IF ifnull(_cnt, 0) > 0
  THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;

END;

DROP FUNCTION IF EXISTS fGetUploadedPOECount;
CREATE FUNCTION fGetUploadedPOECount(PHandover_Or_Invoice_ID INT, PIs_Inward INT)
  RETURNS INT
BEGIN
  IF PIs_Inward = 1
  THEN
    RETURN (SELECT COUNT(*)
            FROM (
                   SELECT DISTINCT c.Document_Configuration_ID
                   FROM tWHGRNHeader a
                          INNER JOIN tWHGRNDocumentHeader b ON a.WH_GRN_ID = b.WH_GRN_ID
                          INNER JOIN tWHGRNDocumentDetail c ON b.Document_ID = c.Document_ID
                   WHERE a.Handover_ID = PHandover_Or_Invoice_ID) x);
  ELSE
    RETURN (SELECT count(*)
            FROM (
                   SELECT DISTINCT d.Document_Configuration_ID
                   FROM tInvoiceHeader a
                          INNER JOIN tRecyclerGRNHeader b ON a.Invoice_Number = b.Invoice_Number
                          INNER JOIN tRecyclerGRNDocumentHeader c ON b.GRN_ID = c.GRN_ID
                          INNER JOIN tRecyclerGRNDocumentDetail d ON c.Document_ID = d.Document_ID
                   WHERE a.Invoice_ID = PHandover_Or_Invoice_ID) x);

  END IF;
END;

DROP FUNCTION IF EXISTS fGetLookUpName;
CREATE FUNCTION fGetLookUpName(PLookUp_Code VARCHAR(1024))
  RETURNS VARCHAR(1024)
    CHARACTER SET utf8
      COLLATE utf8_unicode_ci
BEGIN
  RETURN (SELECT Description
          FROM tLookUp
          WHERE LookUp_Code = PLookUp_Code
          LIMIT 0, 1);
END;


DROP FUNCTION IF EXISTS fVerificationAssign;
CREATE FUNCTION fVerificationAssign(PTransaction_ID INT, PTransaction_Type ENUM ('INWARD', 'OUTWARD'), PAssigned_By INT,
                                    PAssigned_To INT, PStatus_ID INT, PComments TEXT CHARACTER SET utf8
    COLLATE utf8_unicode_ci)
  RETURNS INT
BEGIN

  DECLARE _verification_id INT DEFAULT NULL;
  DECLARE _datetime DATETIME DEFAULT now();

  SET _verification_id = (SELECT Verification_ID
                          FROM tVerification
                          WHERE Transaction_Type = PTransaction_Type
                            AND Transaction_ID = PTransaction_ID
                          LIMIT 0, 1);

  IF _verification_id <> 0 AND _verification_id IS NOT NULL
  THEN
    UPDATE tVerification
    SET Current_Assignee = PAssigned_To,
        Assigned_By      = PAssigned_By,
        Assigned_On      = _datetime,
        Status_ID        = PStatus_ID
    WHERE Transaction_Type = PTransaction_Type
      AND Transaction_ID = PTransaction_ID;
  ELSE
    INSERT INTO tVerification (Created_Date, Created_By, Transaction_ID, Transaction_Type, Current_Assignee,
                               Assigned_On, Assigned_By, Status_ID, Is_Completely_Verified)
    VALUES (_datetime, PAssigned_By, PTransaction_ID, PTransaction_Type, PAssigned_To, _datetime, PAssigned_By, 1, 0);
    SET _verification_id = (SELECT last_insert_id());
  END IF;

  INSERT INTO tVerificationHistory (Verification_ID, Verified_On, Created_By, Assigned_To, Status_ID, Comments)
  VALUES (_verification_id, _datetime, PAssigned_By, PAssigned_To, PStatus_ID, PComments);

  RETURN 1;
END;

DROP FUNCTION IF EXISTS fGetVerificationAssignableUser;
CREATE FUNCTION fGetVerificationAssignableUser(PEntity_Or_User_ID INT, PIs_Entity INT)
  RETURNS INT
BEGIN
  DECLARE _manager_id INT;
  DECLARE _manager_entity_type VARCHAR(64);

  declare _is_karo_user int;

  IF PIs_Entity = 0
  THEN
    SET PEntity_Or_User_ID = (SELECT Entity_ID
                              FROM tUserEntity
                              WHERE User_ID = PEntity_Or_User_ID
                              LIMIT 0, 1);
  END IF;

  SELECT CASE
           WHEN ifnull(Managed_By, 0) = 0
             THEN 1
           ELSE Managed_By END,
         CASE
           WHEN ifnull(Currently_Managed_By, 0) = 0
             THEN 1
           ELSE Currently_Managed_By END
         INTO _manager_entity_type, _manager_id
  FROM tEntity
  WHERE Entity_ID = PEntity_Or_User_ID
  LIMIT 0, 1;

  set _is_karo_user = (select count(*) from tUserEntity where User_ID = _manager_id and Entity_ID = 1 limit 0,1);

  IF _is_karo_user <= 0
  THEN
    SET _manager_id = fGetVerificationAssignableUser(_manager_id, 0);
    RETURN _manager_id;
  ELSE
    RETURN _manager_id;
  END IF;

END;

DROP FUNCTION IF EXISTS fCheckIsDocumentRequired;
CREATE FUNCTION fCheckIsDocumentRequired(PDocument_Configuration_ID INT, PType VARCHAR(64), PDate DATE)
  RETURNS INT
BEGIN
  IF exists(SELECT *
            FROM tRequiredDocumentConfig
            WHERE Document_Configuration_ID = PDocument_Configuration_ID
              AND Type = PType
              AND PDate BETWEEN ifnull(From_Date, PDate) AND ifnull(To_Date, PDate))
  THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END;

DROP FUNCTION IF EXISTS fCheckIsRequiredAllPOEUploaded;
CREATE FUNCTION fCheckIsRequiredAllPOEUploaded(PTransaction_ID INT, PType VARCHAR(64), PDate DATE,
                                               PIs_Check_Using_Handover_ID INT)
  RETURNS INT
BEGIN
  DECLARE _required_ids VARCHAR(1024) DEFAULT '';
  DECLARE _total_required_ids INT DEFAULT 0;
  DECLARE _uploaded_required_doc_count INT DEFAULT 0;

  DECLARE _is_direct INT;
  DECLARE _entity_id INT;

  IF PIs_Check_Using_Handover_ID IS NULL
  THEN
    SET PIs_Check_Using_Handover_ID = 0;
  END IF;


  IF PType = 'INWARD'
  THEN

    SET _is_direct = (SELECT CASE
                               WHEN c.Is_Direct = 2
                                 THEN 1
                               ELSE 0 END
                      FROM tWHGRNHeader a
                             INNER JOIN tItemHandover b ON a.Handover_ID = b.Handover_ID
                             INNER JOIN tPickupRequest c ON b.Cart_ID = c.Cart_ID
                      WHERE CASE
                              WHEN PIs_Check_Using_Handover_ID = 1
                                THEN
                                a.Handover_ID = PTransaction_ID
                              ELSE
                                a.WH_GRN_ID = PTransaction_ID
                              END
                      LIMIT 0, 1);

    IF _is_direct = 1
    THEN
      RETURN 1;
    END IF;

    SET _required_ids = (SELECT group_concat(Document_Configuration_ID)
                         FROM tRequiredDocumentConfig
                         WHERE Type = PType
                           AND PDate BETWEEN ifnull(From_Date, PDate) AND ifnull(To_Date, PDate));
  ELSE
    SET _entity_id = (SELECT b.Entity_ID
                      FROM tInvoiceHeader a
                             LEFT JOIN tWarehouse b ON a.WH_ID = b.WH_ID
                      WHERE a.Invoice_ID = PTransaction_ID
                      LIMIT 0, 1);
    SET _is_direct = fCheckIsSystemEntity(_entity_id);

    SET _required_ids = (SELECT group_concat(a.Document_Configuration_ID)
                         FROM tRequiredDocumentConfig a
                                INNER JOIN tRecyclerGRNDocumentConfig b
                                           ON a.Document_Configuration_ID = b.Document_Configuration_ID
                         WHERE CASE
                                 WHEN _is_direct = 1
                                   THEN
                                   1 = 1
                                 ELSE
                                   b.Is_Direct = 0
                           END
                           AND a.Type = PType
                           AND PDate BETWEEN ifnull(From_Date, PDate) AND ifnull(To_Date, PDate));

  END IF;

  IF _required_ids = '' OR _required_ids IS NULL
  THEN
    RETURN 1;
  END IF;

  SET _total_required_ids = fCountTokens(_required_ids, ',');


  IF PType = 'INWARD'
  THEN
    SET _uploaded_required_doc_count = (SELECT count(DISTINCT c.Document_Configuration_ID)
                                        FROM tWHGRNHeader a
                                               INNER JOIN tWHGRNDocumentHeader b
                                                          ON a.WH_GRN_ID = b.WH_GRN_ID
                                               INNER JOIN tWHGRNDocumentDetail c ON b.Document_ID = c.Document_ID
                                        WHERE CASE
                                                WHEN PIs_Check_Using_Handover_ID = 1
                                                  THEN
                                                  a.Handover_ID = PTransaction_ID
                                                ELSE
                                                  a.WH_GRN_ID = PTransaction_ID
                                          END
                                          AND find_in_set(c.Document_Configuration_ID, _required_ids));
  ELSE
    SET _uploaded_required_doc_count = (SELECT count(DISTINCT c.Document_Configuration_ID)
                                        FROM tRecyclerGRNHeader a
                                               INNER JOIN tRecyclerGRNDocumentHeader b
                                                          ON a.GRN_ID = b.GRN_ID
                                               INNER JOIN tWHGRNDocumentDetail c ON b.Document_ID = c.Document_ID
                                               INNER JOIN tInvoiceHeader d
                                                          ON a.Invoice_Number = d.Invoice_Number AND d.Invoice_ID = PTransaction_ID
                                        WHERE find_in_set(c.Document_Configuration_ID, _required_ids));
  END IF;

  IF _total_required_ids >= _uploaded_required_doc_count
  THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END;

DROP FUNCTION IF EXISTS fTotalPickupCount;
CREATE FUNCTION fTotalPickupCount(PTransaction_ID INT,
                                  PType ENUM ('CART', 'PR', 'HANDOVER', 'WHGRN'))
  RETURNS INT
BEGIN
  DECLARE _count INT DEFAULT 1;

  CASE WHEN PType = 'CART'
    THEN
      SET _count = (SELECT count(*)
                    FROM tPickupDetail
                    WHERE Pickup_ID IN (SELECT x.Pickup_ID
                                        FROM tPickupDetail x
                                               INNER JOIN tPickupRequest y
                                                          ON x.Pickup_Request_ID = y.Pickup_Request_ID
                                        WHERE y.Cart_ID = PTransaction_ID));
    WHEN PType = 'PR'
      THEN
        SET _count = (SELECT count(*)
                      FROM tPickupDetail
                      WHERE Pickup_ID IN (SELECT x.Pickup_ID
                                          FROM tPickupDetail x
                                          WHERE x.Pickup_Request_ID = PTransaction_ID));
    WHEN PType = 'HANDOVER'
      THEN
        SET _count = (SELECT count(*)
                      FROM tPickupDetail
                      WHERE Pickup_ID IN (SELECT x.Pickup_ID
                                          FROM tPickupDetail x
                                                 INNER JOIN tPickupRequest y
                                                            ON x.Pickup_Request_ID = y.Pickup_Request_ID
                                                 INNER JOIN tItemHandover z ON y.Cart_ID = z.Cart_ID
                                          WHERE z.Handover_ID = PTransaction_ID));
    ELSE
      SET _count = (SELECT count(*)
                    FROM tPickupDetail
                    WHERE Pickup_ID IN (SELECT x.Pickup_ID
                                        FROM tPickupDetail x
                                               INNER JOIN tPickupRequest y
                                                          ON x.Pickup_Request_ID = y.Pickup_Request_ID
                                               INNER JOIN tItemHandover z ON y.Cart_ID = z.Cart_ID
                                               INNER JOIN tWHGRNHeader w ON z.Handover_ID = w.Handover_ID
                                        WHERE w.WH_GRN_ID = PTransaction_ID));
    END CASE;

  RETURN _count;
END;

DROP FUNCTION IF EXISTS fMultiplePickedUpCount;
CREATE FUNCTION fMultiplePickedUpCount(PTransaction_ID INT,
                                       PType ENUM ('CART', 'PR', 'HANDOVER', 'WHGRN'))
  RETURNS INT
BEGIN
  DECLARE _count INT DEFAULT 1;

  CASE WHEN PType = 'CART'
    THEN
      SET _count = (SELECT count(*)
                    FROM tPickupDetail
                    WHERE Is_Handed_Over = 1
                      AND Pickup_ID IN (SELECT x.Pickup_ID
                                        FROM tPickupDetail x
                                               INNER JOIN tPickupRequest y
                                                          ON x.Pickup_Request_ID = y.Pickup_Request_ID
                                        WHERE y.Cart_ID = PTransaction_ID));
    WHEN PType = 'PR'
      THEN
        SET _count = (SELECT count(*)
                      FROM tPickupDetail
                      WHERE Is_Handed_Over = 1
                        AND Pickup_ID IN (SELECT x.Pickup_ID
                                          FROM tPickupDetail x
                                          WHERE x.Pickup_Request_ID = PTransaction_ID));
    WHEN PType = 'HANDOVER'
      THEN
        SET _count = (SELECT count(*)
                      FROM tPickupDetail
                      WHERE Is_Handed_Over = 1
                        AND Pickup_ID IN (SELECT x.Pickup_ID
                                          FROM tPickupDetail x
                                                 INNER JOIN tPickupRequest y
                                                            ON x.Pickup_Request_ID = y.Pickup_Request_ID
                                                 INNER JOIN tItemHandover z ON y.Cart_ID = z.Cart_ID
                                          WHERE z.Handover_ID = PTransaction_ID));
    ELSE
      SET _count = (SELECT count(*)
                    FROM tPickupDetail
                    WHERE Is_Handed_Over = 1
                      AND Pickup_ID IN (SELECT x.Pickup_ID
                                        FROM tPickupDetail x
                                               INNER JOIN tPickupRequest y
                                                          ON x.Pickup_Request_ID = y.Pickup_Request_ID
                                               INNER JOIN tItemHandover z ON y.Cart_ID = z.Cart_ID
                                               INNER JOIN tWHGRNHeader w
                                                          ON z.Handover_ID = w.Handover_ID
                                        WHERE w.WH_GRN_ID = PTransaction_ID));
    END CASE;

  RETURN _count;
END;

DROP FUNCTION IF EXISTS fAddSellerBill;
CREATE FUNCTION fAddSellerBill(PCart_ID INT, PBill_Number VARCHAR(1024), PBill_Date VARCHAR(24))
  RETURNS INT
BEGIN

  DECLARE _seller_bill VARCHAR(1024);
  DECLARE _entity_id INT;

  IF exists(SELECT *
            FROM tSellerBill
            WHERE Cart_ID = PCart_ID)
  THEN
    /* Update Existing */
    UPDATE tSellerBill
    SET Updated_Bill_Number = PBill_Number,
        Bill_Date           = CASE
                                WHEN PBill_Date = '' OR PBill_Date IS NULL
                                  THEN
                                  Bill_Date
                                ELSE
                                  str_to_date(PBill_Date, '%d/%m/%Y')
          END
    WHERE Cart_ID = PCart_ID;

  ELSE
    /* Add New */
    SET _entity_id = (SELECT Entity_ID
                      FROM tCart
                      WHERE Cart_ID = PCart_ID
                      LIMIT 0, 1);
    SET _seller_bill = fGenerateBillNumber(_entity_id);

    INSERT INTO tSellerBill (Bill_Date, Bill_Number, Updated_Bill_Number, Cart_ID, Status)
    VALUES (CASE
              WHEN PBill_Date = '' OR PBill_Date IS NULL
                THEN
                date_format(now(), '%Y-%m-%d')
              ELSE
                str_to_date(PBill_Date, '%d/%m/%Y')
              END,
            _seller_bill,
            PBill_Number,
            PCart_ID,
            'PENDING');

  END IF;

  RETURN 1;
END;

DROP FUNCTION IF EXISTS fUpdateGiftItemStock;
CREATE FUNCTION fUpdateGiftItemStock(
  PGift_Item_ID INT,
  PDate         DATETIME,
  PType         ENUM ('CREDIT', 'DEBIT'),
  PQuantity     DECIMAL(10, 2),
  PRemarks      TEXT CHARACTER SET utf8
                COLLATE utf8_unicode_ci
)
  RETURNS INT
  BEGIN
    /* Ledger Total */

    DECLARE _max_id INT;
    DECLARE _closing_quantity DECIMAL(10, 2);

    IF NOT exists(SELECT *
                  FROM tGiftItemLedgerTotal
                  WHERE Gift_Item_ID = PGift_Item_ID)
    THEN
      INSERT INTO tGiftItemLedgerTotal (Gift_Item_ID, Opening_Date, Closing_Date, Quantity) VALUES
        (PGift_Item_ID, date_format(PDate, '%Y-%m-%d'), date_format(PDate, '%Y-%m-%d'), PQuantity);
    ELSE
      UPDATE tGiftItemLedgerTotal
      SET Closing_Date = date_format(PDate, '%Y-%m-%d'), Quantity = CASE WHEN PType = 'CREDIT'
        THEN Quantity + PQuantity
                                                                    ELSE Quantity - PQuantity END
      WHERE Gift_Item_ID = PGift_Item_ID;
    END IF;

    IF NOT exists(SELECT *
                  FROM tGiftItemLedger
                  WHERE Gift_Item_ID = PGift_Item_ID)
    THEN
      INSERT INTO tGiftItemLedger (Gift_Item_ID, Updated_Date, Quantity, Opening_Quantity, Closing_Quantity, Type, Remarks)
      VALUES
        (PGift_Item_ID, PDate, PQuantity, 0, PQuantity, 'CREDIT', 'Initializing the stock');
    ELSE
      SET _max_id = (SELECT MAX(_ID)
                     FROM tGiftItemLedger
                     WHERE Gift_Item_ID = PGift_Item_ID);

      SET _closing_quantity = (SELECT Closing_Quantity
                               FROM tGiftItemLedger
                               WHERE _ID = _max_id
                               LIMIT 0, 1);

      INSERT INTO tGiftItemLedger (Gift_Item_ID, Updated_Date, Quantity, Opening_Quantity, Closing_Quantity, Type, Remarks)
      VALUES
        (PGift_Item_ID, PDate, PQuantity, _closing_quantity, CASE WHEN PType = 'CREDIT'
          THEN _closing_quantity + PQuantity
                                                             ELSE _closing_quantity - PQuantity END, PType, PRemarks);
    END IF;

    UPDATE tGiftItem
    SET Quantity = CASE WHEN PType = 'CREDIT'
      THEN Quantity + PQuantity
                   ELSE Quantity - PQuantity END
    WHERE Gift_Item_ID = PGift_Item_ID;

    RETURN 1;

  END;

DROP FUNCTION IF EXISTS fGetDistributedGiftItemCount;
CREATE FUNCTION fGetDistributedGiftItemCount(PGift_Item_ID INT)
  RETURNS DECIMAL(10, 2)
BEGIN
  DECLARE _sum DECIMAL(10, 2) DEFAULT 0;
  SET _sum = (SELECT sum(Gift_Quantity)
              FROM tVisitGifts
              WHERE Gift_Item_ID = PGift_Item_ID);
  RETURN ifnull(_sum, 0);

END;

DROP FUNCTION IF EXISTS fGetFirstDayOfFinancialYear;
CREATE FUNCTION fGetFirstDayOfFinancialYear()
  RETURNS VARCHAR(128)
  BEGIN
RETURN concat(fGetFinacialYearByDate(CURDATE()),'-04-01');

  END;

DROP FUNCTION IF EXISTS fGetLastDayOfFinancialYear;
CREATE FUNCTION fGetLastDayOfFinancialYear()
  RETURNS VARCHAR(128)
  BEGIN
RETURN concat(fGetFinacialYearByDate(CURDATE())+1,'-03-31');

  END;


DROP FUNCTION IF EXISTS fGetRecyclerRateByInvoiceId;
CREATE FUNCTION fGetRecyclerRateByInvoiceId(PInvoice_ID INT, PCategory_ID INT)
  RETURNS FLOAT
  BEGIN
    DECLARE _rate FLOAT;
    SET _rate = (SELECT Rate
                 FROM tRecyclerRate a INNER JOIN tInvoiceHeader b
                     ON a.Recycler_ID = b.Recycler_ID AND a.Category_ID = PCategory_ID AND b.Invoice_ID = PInvoice_ID
                 WHERE date(b.Invoice_Date) BETWEEN date(a.From_Date) AND date(a.To_Date)
                 LIMIT 0, 1);
    RETURN ifnull(_rate, 0);
  END;

DROP FUNCTION IF EXISTS fGetRecyclerGSTByInvoiceId;
CREATE FUNCTION fGetRecyclerGSTByInvoiceId(PInvoice_ID INT, PCategory_ID INT)
  RETURNS FLOAT
  BEGIN
    DECLARE _gst FLOAT;
    SET _gst = (SELECT GST
                FROM tRecyclerRate a INNER JOIN tInvoiceHeader b
                    ON a.Recycler_ID = b.Recycler_ID AND a.Category_ID = PCategory_ID AND b.Invoice_ID = PInvoice_ID
                WHERE date(b.Invoice_Date) BETWEEN date(a.From_Date) AND date(a.To_Date)
                LIMIT 0, 1);
    RETURN ifnull(_gst, 0);
  END;


DROP FUNCTION IF EXISTS fGetCollectionByZone;
CREATE FUNCTION fGetCollectionByZone(PZone_ID INT, PType INT)
  RETURNS FLOAT
  BEGIN
    RETURN (SELECT Round(sum(f.Inward_Quantity), 2) AS Quantity2
            FROM tCart a
              INNER JOIN tCartItem b ON a.Cart_ID = b.Cart_ID
              INNER JOIN tPickupRequest c ON a.Cart_ID = c.Cart_ID
              INNER JOIN tItemHandover d ON c.Cart_ID = d.Cart_ID
              INNER JOIN tWHGRNHeader e ON d.Handover_ID = e.Handover_ID
              INNER JOIN tWHGRNDetail f ON e.WH_GRN_ID = f.WH_GRN_ID AND b.Category_ID = f.Category_ID
              INNER JOIN tEntity g ON a.Entity_ID = g.Entity_ID
              INNER JOIN tCity h ON g.City_ID = h.City_ID
              INNER JOIN tState i ON g.State_ID = i.State_ID
              INNER JOIN tZone j ON i.Zone_ID = j.Zone_ID
              LEFT JOIN tSellerBill k ON a.Cart_ID = k.Cart_ID
            WHERE
              c.Finacial_Year = fGetFinacialYearByDate(CURDATE())
              AND
              CASE WHEN PType = 3
                THEN
                  MONTH(e.Transaction_Date) = MONTH(CURDATE())
              ELSE
                1 = 1
              END
              AND
              CASE WHEN PType = 1
                THEN
                  e.Transaction_Date = subdate(CURDATE(), 1)
              ELSE
                1 = 1
              END AND
              CASE WHEN PType = 2
                THEN
                  WEEK(DATE(e.Transaction_Date)) = WEEK(CURDATE())
              ELSE
                1 = 1
              END
              AND j.Zone_ID = PZone_ID);
  END;

DROP FUNCTION IF EXISTS _fGetRemainingDays;
CREATE FUNCTION _fGetRemainingDays(PYear VARCHAR(4))
  RETURNS INT
  BEGIN
    DECLARE Days INT;

    declare _date DATE ;

    set _date = str_to_date(concat(PYear+1,'-3-31'), '%Y-%m-%d') ;

    SET Days = datediff(_date,curdate());

     RETURN Days;
  END;

DROP FUNCTION IF EXISTS _fGetSeller_IDForDirectDisptach;
CREATE FUNCTION _fGetSeller_IDForDirectDisptach(PInvoice_ID INT)
  RETURNS VARCHAR(125)
  BEGIN

    return (SELECT
      e.Entity_ID
      from tOutwardAllocationHeader a
      inner join tOutwardAllocationDetail b on a.Allocation_ID = b.Allocation_ID
      INNER join tWHGRNHeader c on b.WH_GRN_ID = c.WH_GRN_ID
      inner join tItemHandover d on c.Handover_ID = d.Handover_ID
      inner join tCart e on d.Cart_ID = e.Cart_ID
      where a.Invoice_ID = PInvoice_ID
      limit 0,1) ;
  END;

DROP FUNCTION IF EXISTS _fGetSellerForDirectDisptach;
CREATE FUNCTION _fGetSellerForDirectDisptach(PInvoice_ID INT)
  RETURNS VARCHAR(125)
  BEGIN
    return (
    select fGetEntityName(Entity_ID) from tCart t
        inner join tItemHandover u on t.Cart_ID = u.Cart_ID
        inner join tWHGRNHeader v on v.Handover_ID = u.Handover_ID
        inner join tOutwardAllocationDetail w on w.WH_GRN_ID = v.WH_GRN_ID
        inner join tOutwardAllocationHeader x on x.Allocation_ID = w.Allocation_ID
        where x.Invoice_ID = PInvoice_ID limit 0,1 );
  END;

DROP FUNCTION IF EXISTS _fGetEntityByEntityName;
CREATE FUNCTION _fGetEntityByEntityName(PID INT)
  RETURNS VARCHAR(64)
  BEGIN
   RETURN (SELECT Entity_Name from tEntity WHERE Entity_ID =PID);
  END;

DROP FUNCTION IF EXISTS fGetStateNameByState_ID;
CREATE FUNCTION fGetStateNameByState_ID(PState_ID INT)
  RETURNS VARCHAR(24)
  BEGIN
    RETURN (SELECT State_Name AS State_Name
            FROM tState
            WHERE State_ID = PState_ID
    );

  END;

DROP FUNCTION IF EXISTS fGetStateNameByEntity;
CREATE FUNCTION fGetStateNameByEntity(PEntity_ID INT)
  RETURNS VARCHAR(24)
  BEGIN
    IF PEntity_ID IS NULL OR PEntity_ID = 0
    THEN
      RETURN NULL;
    ELSE
      RETURN (SELECT State_Name AS State_Name
              FROM tState a
                INNER JOIN tEntity b ON b.State_ID = a.State_ID
              WHERE b.Entity_ID = PEntity_ID
      );
    END IF;

  END;

DROP FUNCTION IF EXISTS fGetCityNameByCity_ID;
CREATE FUNCTION fGetCityNameByCity_ID(PCity_ID INT)
  RETURNS VARCHAR(24)
  BEGIN
    RETURN (SELECT City_Name AS City_Name
            FROM tCity
            WHERE City_ID = PCity_ID
    );

  END;

DROP FUNCTION IF EXISTS fGetCityNameByEntity;
CREATE FUNCTION fGetCityNameByEntity(PEntity_ID INT)
  RETURNS VARCHAR(24)
  BEGIN
    RETURN (SELECT City_Name
            FROM tCity a
              INNER JOIN tEntity b ON b.City_ID = a.City_ID
            WHERE b.Entity_ID = PEntity_ID
    );

  END;


DROP FUNCTION IF EXISTS fBillAmountGet;
CREATE FUNCTION fBillAmountGet(PBill_ID INT, PBill_Type VARCHAR(264))
  RETURNS FLOAT
  BEGIN
    DECLARE _paid_amount FLOAT DEFAULT 0;

    SET _paid_amount = (SELECT sum(Paid_Amount)
                        FROM tPaymentDetail
                        WHERE Bill_ID = PBill_ID AND Bill_Type = PBill_Type);

    IF _paid_amount IS NULL
    THEN SET _paid_amount = 0; END IF;
    RETURN _paid_amount;
  END;

DROP FUNCTION IF EXISTS fPendingBillIdsGetForEntity;
CREATE FUNCTION fPendingBillIdsGetForEntity
  (
    PEntity_ID  INT,
    PFrom_Date  DATE,
    PTo_Date    DATE,
    PSearch_Key VARCHAR(64)
  )
  RETURNS TEXT
  BEGIN
    DECLARE _bill_ids TEXT DEFAULT '';

    #     SET _bill_ids = (SELECT group_concat(x.Bill_ID)
    #                      FROM (
    #                             SELECT
    #                               a.Bill_ID,
    #                               fGetActualCartPrice(a.Cart_ID)         AS Total,
    #                               fBillAmountGet(a.Bill_ID, 'SELLERINV') AS Paid
    #                             FROM tSellerBill a
    #                               INNER JOIN tCart b ON a.Cart_ID = b.Cart_ID
    #                             WHERE b.Entity_ID = PEntity_ID
    #                                   AND
    #                                   CASE WHEN PFrom_Date IS NULL
    #                                     THEN 1 = 1
    #                                   ELSE
    #                                     date(a.Bill_Date) >= PFrom_Date
    #                                   END AND
    #                                   CASE WHEN PTo_Date IS NULL
    #                                     THEN 1 = 1
    #                                   ELSE
    #                                     date(a.Bill_Date) <= PTo_Date
    #                                   END AND
    #                                   CASE WHEN PSearch_Key = '' OR PSearch_Key IS NULL
    #                                     THEN
    #                                       1 = 1
    #                                   ELSE
    #                                     a.Updated_Bill_Number LIKE concat('%', PSearch_Key, '%')
    #                                   END
    #                           ) x
    #                      WHERE Total > Paid);

    SET _bill_ids = (
      SELECT group_concat(a.Bill_ID)
      FROM tSellerBill a
        INNER JOIN tCart b ON a.Cart_ID = b.Cart_ID
      WHERE
        a.Status = 'PENDING' AND
        b.Entity_ID = PEntity_ID
        AND
        CASE WHEN PFrom_Date IS NULL
          THEN 1 = 1
        ELSE
          date(a.Bill_Date) >= PFrom_Date
        END AND
        CASE WHEN PTo_Date IS NULL
          THEN 1 = 1
        ELSE
          date(a.Bill_Date) <= PTo_Date
        END AND
        CASE WHEN PSearch_Key = '' OR PSearch_Key IS NULL
          THEN
            1 = 1
        ELSE
          a.Updated_Bill_Number LIKE concat('%', PSearch_Key, '%')
        END
    );

    RETURN _bill_ids;
  END;


DROP FUNCTION IF EXISTS fMoveVaultSubTreeHierarchy;
CREATE FUNCTION fMoveVaultSubTreeHierarchy
  (
    PVault_ID  INT,
    PParent_ID INT
  )
  RETURNS INT
  BEGIN

    DECLARE origin_lft INT;
    DECLARE origin_rgt INT;
    DECLARE new_parent_rgt INT;

    SELECT
      Left_Node,
      Right_Node
    INTO origin_lft, origin_rgt
    FROM tVault
    WHERE Vault_ID = PVault_ID;

    IF PParent_ID = 0 OR PParent_ID IS NULL
    THEN
      SET new_parent_rgt = (SELECT Right_Node
                            FROM tVault
                            WHERE Vault_ID = 1
                            LIMIT 0, 1);
    ELSE
      SET new_parent_rgt = (SELECT Right_Node
                            FROM tVault
                            WHERE Vault_ID = PParent_ID
                            LIMIT 0, 1);
    END IF;

    UPDATE tVault
    SET Left_Node =
    Left_Node + CASE WHEN new_parent_rgt < origin_lft
      THEN
        CASE
        WHEN Left_Node BETWEEN origin_lft AND origin_rgt
          THEN new_parent_rgt - origin_lft
        WHEN Left_Node BETWEEN new_parent_rgt AND origin_lft - 1
          THEN origin_rgt - origin_lft + 1
        ELSE 0 END
                WHEN new_parent_rgt > origin_rgt
                  THEN
                    CASE WHEN Left_Node BETWEEN origin_lft AND origin_rgt
                      THEN
                        new_parent_rgt - origin_rgt - 1
                    WHEN Left_Node BETWEEN origin_rgt + 1 AND new_parent_rgt - 1
                      THEN
                        origin_lft - origin_rgt - 1
                    ELSE 0 END
                ELSE
                  0 END,
      Right_Node  =
      Right_Node + CASE WHEN new_parent_rgt < origin_lft
        THEN
          CASE
          WHEN Right_Node BETWEEN origin_lft AND origin_rgt
            THEN
              new_parent_rgt - origin_lft
          WHEN Right_Node BETWEEN new_parent_rgt AND origin_lft - 1
            THEN origin_rgt - origin_lft + 1
          ELSE 0 END
                   WHEN new_parent_rgt > origin_rgt
                     THEN
                       CASE
                       WHEN Right_Node BETWEEN origin_lft AND origin_rgt
                         THEN new_parent_rgt - origin_rgt - 1
                       WHEN Right_Node BETWEEN origin_rgt + 1 AND new_parent_rgt - 1
                         THEN
                           origin_lft - origin_rgt - 1
                       ELSE
                         0 END
                   ELSE 0 END;
    RETURN 1;
  END;

$$
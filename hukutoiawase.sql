SELECT 費目, 出金額 FROM 帳簿
 WHERE 出金額 = (SELECT MAX(出金額) FROM 帳簿)

UPDATE 帳簿集計
   SET 平均 = (SELECT AVG(出金額))
                FROM 帳簿アーカイブ
               WHERE 出金額 > 0
                 AND 費目 = '食費'
 WHERE 費目 = '食費'

SELECT 日付, メモ, 出金額,
       (SELECT 合計 FROM 帳簿集計
         WHERE 費目 = '食費') AS 過去合計額
  FROM 帳簿アーカイブ
 WHERE 費目 = '食費'

SELECT * FROM 帳簿
 WHERE 費目 IN ('食費', '水道光熱費')
 もしくは
 WHERE 費目 IN (SELECT DISTINCT 費目 FROM 帳簿)

 SELECT * FROM 帳簿
  WHERE 費目 = '食費'
    AND 出金額 < ANY(SELECT 出金額 FROM 帳簿アーカイブ
    	             WHERE 費目 = '食費')

SELECT * FROM 帳簿アーカイブ
 WHERE 費目 IN (SELECT 費目 FROM 帳簿
 				WHERE 費目 IS NOT NULL)

SELECT * FROM 帳簿アーカイブ
 WHERE 費目 IN (SELECT COALESCE(費目, '不明') FROM 帳簿)

SELECT SUM(SUB, 出金額) AS 合計出金額
  FROM (SELECT 日付, 費目, 出金額
          FROM 帳簿
         UNION
        SELECT 日付, 費目, 出金額
          FROM 帳簿アーカイブ
         WHERE 日付 >= '2020/11/01'
           AND 日付 <= '2020/11/30') AS SUB

INSERT INTO 帳簿集計(費目, 合計, 平均, 回数)
SELECT 費目, SUM(出金額), AVG(出金額), 0
  FROM 帳簿
 WHERE 出金額 > 0
 GROUP BY 費目

SELECT 費目, 合計 FROM 帳簿集計
 WHERE EXISTS (SELECT * FROM 帳簿
    	        WHERE 帳簿.費目 = 帳簿集計.費目)
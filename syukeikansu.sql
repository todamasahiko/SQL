SELECT
　　SUM(出金額) AS 合計出金額,
　　MAX(出金額) AS 最大出金額,
　　MIN(出金額) AS 最小出金額,
　　AVG(出金額) AS 平均出金額
  FROM 帳簿

SELECT
  COUNT(*) AS 食費の行数
  COUNT(出金額) AS 食費の行数
  FROM 帳簿
 WHERE 費目 = '食費'

SELECT AVG(COALESCE(出金額, 0)) AS 平均出金額
  FROM 帳簿
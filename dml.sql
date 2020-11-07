SELECT 費目 AS item, 入金額 AS receive, 出金額 AS pay --別名に書き換え
  FROM 帳簿 AS books
 WHERE 費目 = '給料'

UPDATE 帳簿 --UPDATE文
   SET 入金額 = 777
 WHERE 日付 = '2020/11/06' --WHERE句なしは全更新

DELETE --DELETE文
  FROM 帳簿
 WHERE 日付 = '2020/11/06'  --WHERE句なしは全削除

INSERT INTO 帳簿 --INSERT文
            (費目, 日付, 出金額)
     VALUES ('通信費', '2020/11/06', 7777)

INSERT INTO 帳簿
     VALUES ('2020/11/06', '通信費', '携帯電話', 0, 7777) --列指定省略の場合はテーブル列順にすべて記述

DELETE
  FROM 帳簿
 WHERE 出金額 > 0 --条件式（真偽）しか指定できない

SELECT *
  FROM 帳簿
 WHERE 出金額 IS NULL --IS NULL

SELECT * FROM 帳簿
 WHERE メモ LIKE '%11月%' --11月前後を含む

SELECT * FROM 帳簿
 WHERE メモ LIKE '%111$%'
ESCAPE '$' --ESCAPE句

SELECT * FROM 帳簿
 WHERE 出金額 BETWEEN 111 AND 3333 --BETWEEN演算子

SELECT * FROM 帳簿
 WHERE 費目 IN ('食費', '家賃') --

SELECT * FROM 帳簿
 WHERE 費目 NOT IN ('食費', '家賃') --NOT IN演算子

UPDATE 買い物リスト
　 SET 金額 = 7777
 WHERE 品物 = '福袋'
   AND 店名 = 'Z' --AND演算子
 WHERE NOT 店名 = 'Z' --NOT演算子Z

SELECT *
  FROM 買い物リスト
 WHERE 店名 = 'A' --条件式1
    OR 店名 = 'B' --条件式2
   AND ジャンル = 'おもちゃ' --条件式3
    OR ジャンル = 'PC' --条件式4

SELECT *
  FROM 買い物リスト
 WHERE (店名 = 'A'         --条件式1
    OR 店名 = 'B')     --条件式2
   AND (ジャンル = 'おもちゃ'  --条件式3
    OR ジャンル = 'PC')      --条件式4

DELETE
  FROM 社員
 WHERE 社員番号 = '20201106'  --主キー

SELECT DISTINCT 費目 --DISTINCT句
  FROM 帳簿

SELECT * FROM 帳簿
     ORDER BY 日付 DESC --ORDER BY句

SELECT * FROM 帳簿
     ORDER BY 入金額 DESC, 出金額 ASC

SELECT * FROM 帳簿
     ORDER BY 1 DESC, 2 ASC --列番号の指定

SELECT 費目. 出金額 FROM 帳簿
 ORDER BY 出金額 DESC
OFFSET 0 ROWS --OFFSET句
 FETCH NEXT 3 ROWS ONLY --FETCH句


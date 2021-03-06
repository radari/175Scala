Top n from each group

Below is the example of getting top 3 products from each product_category_id in table products
Note the same query is not accepted in SparkSQL.


select product_id, product_category_id, product_price
from 
(
   select product_id, product_category_id, product_price,
      (@num:=if(@group = product_category_id, @num +1, if(@group := product_category_id, 1, 1))) row_number 
  from products t
  CROSS JOIN (select @num:=0, @group:=null) c
  order by product_category_id, product_price desc, product_id
) as x 
where x.row_number <= 3;

+------------+---------------------+---------------+
| product_id | product_category_id | product_price |
+------------+---------------------+---------------+
|         16 |                   2 |        299.99 |
|         11 |                   2 |        209.99 |
|          5 |                   2 |        199.99 |
|         40 |                   3 |        199.99 |
|         32 |                   3 |        189.99 |
|         35 |                   3 |        159.99 |
|         66 |                   4 |       1799.99 |
|         60 |                   4 |        999.99 |
|         71 |                   4 |        349.98 |
|         74 |                   5 |        499.99 |
|         96 |                   5 |        299.99 |
|         79 |                   5 |        209.99 |
|        117 |                   6 |        399.99 |
|        106 |                   6 |        299.99 |
|        100 |                   6 |        199.99 |
|        127 |                   7 |        329.99 |
|        137 |                   7 |        299.99 |
|        144 |                   7 |        249.99 |
|        162 |                   8 |        399.99 |
|        153 |                   8 |        299.99 |
|        148 |                   8 |        199.99 |
|        185 |                   9 |        499.99 |
|        181 |                   9 |        399.99 |
|        169 |                   9 |        299.98 |
|        208 |                  10 |       1999.99 |
|        199 |                  10 |       1799.99 |
|        197 |                  10 |        999.99 |
|        229 |                  11 |        799.99 |
|        226 |                  11 |        599.99 |
|        225 |                  11 |        499.99 |
|        262 |                  12 |        179.99 |
|        255 |                  12 |        139.99 |
|        260 |                  12 |        119.99 |
|        268 |                  13 |        199.99 |
|        281 |                  13 |         99.99 |
|        265 |                  13 |         79.99 |
|        320 |                  15 |           100 |
|        322 |                  15 |         81.99 |
|        325 |                  15 |            79 |
|        346 |                  16 |        349.99 |
|        343 |                  16 |        299.99 |
|        345 |                  16 |        249.99 |
|        371 |                  17 |        399.99 |
|        364 |                  17 |        299.99 |
|        366 |                  17 |        299.99 |
|        382 |                  18 |        189.99 |
|        390 |                  18 |        139.99 |
|        399 |                  18 |        139.99 |
|        407 |                  19 |        189.99 |
|        425 |                  19 |        149.99 |
|        417 |                  19 |        139.99 |
|        450 |                  20 |        249.99 |
|        452 |                  20 |        169.99 |
|        437 |                  20 |        139.99 |
|        458 |                  21 |        139.99 |
|        453 |                  21 |         99.99 |
|        463 |                  21 |         99.99 |
|        496 |                  22 |       1799.99 |
|        488 |                  22 |        999.99 |
|        481 |                  22 |        179.98 |
|        516 |                  24 |        229.99 |
|        508 |                  24 |        189.99 |
|        513 |                  24 |        159.99 |
|        545 |                  25 |        229.99 |
|        534 |                  25 |        189.99 |
|        536 |                  25 |        179.98 |
|        566 |                  26 |            90 |
|        569 |                  26 |            90 |
|        560 |                  26 |            85 |
|        590 |                  27 |            90 |
|        593 |                  27 |            90 |
|        584 |                  27 |            85 |
|        625 |                  29 |        199.99 |
|        629 |                  29 |        169.99 |
|        623 |                  29 |        149.99 |
|        663 |                  30 |        139.99 |
|        664 |                  30 |        139.99 |
|        665 |                  30 |        139.99 |
|        685 |                  31 |        899.99 |
|        676 |                  31 |           899 |
|        675 |                  31 |           799 |
|        694 |                  32 |        999.99 |
|        695 |                  32 |        999.99 |
|        698 |                  32 |        699.99 |
|        739 |                  33 |        169.99 |
|        740 |                  33 |        169.99 |
|        718 |                  33 |        139.99 |
|        743 |                  34 |        169.99 |
|        744 |                  34 |        169.99 |
|        745 |                  34 |        149.99 |
|        766 |                  35 |        299.99 |
|        768 |                  35 |        299.99 |
|        773 |                  35 |        249.99 |
|        791 |                  36 |         24.99 |
|        794 |                  36 |         24.99 |
|        806 |                  36 |         24.99 |
|        817 |                  37 |         51.99 |
|        819 |                  37 |         51.99 |
|        821 |                  37 |         51.99 |
|        860 |                  38 |        599.99 |
|        300 |                  38 |        449.99 |
|        307 |                  38 |        449.99 |
|        861 |                  39 |        199.99 |
|        862 |                  39 |        179.99 |
|        880 |                  39 |        139.99 |
|        885 |                  40 |         24.99 |
|        886 |                  40 |         24.99 |
|        887 |                  40 |         24.99 |
|        601 |                  41 |        399.99 |
|        606 |                  41 |        299.99 |
|        607 |                  41 |        249.99 |
|        933 |                  42 |        179.99 |
|        935 |                  42 |        169.99 |
|        937 |                  42 |        169.99 |
|        953 |                  43 |        449.99 |
|        944 |                  43 |        399.99 |
|        955 |                  43 |        399.99 |
|        978 |                  44 |        399.99 |
|        983 |                  44 |        249.99 |
|        966 |                  44 |        199.99 |
|       1009 |                  45 |        599.99 |
|        987 |                  45 |        399.99 |
|        995 |                  45 |        399.99 |
|       1016 |                  46 |        549.99 |
|       1020 |                  46 |        549.99 |
|       1011 |                  46 |        499.99 |
|       1048 |                  47 |       1099.99 |
|       1054 |                  47 |        699.99 |
|       1035 |                  47 |        499.99 |
|       1069 |                  48 |        799.99 |
|       1067 |                  48 |        549.99 |
|       1074 |                  48 |        549.99 |
|       1084 |                  49 |        399.99 |
|       1104 |                  49 |        399.99 |
|       1085 |                  49 |        349.99 |
|       1116 |                  50 |           130 |
|       1117 |                  50 |           130 |
|       1118 |                  50 |           130 |
|       1136 |                  51 |        219.99 |
|       1138 |                  51 |        219.99 |
|       1139 |                  51 |        219.99 |
|       1154 |                  52 |           170 |
|       1156 |                  52 |           170 |
|       1157 |                  52 |           170 |
|       1182 |                  53 |        199.99 |
|       1192 |                  53 |        199.99 |
|       1193 |                  53 |        199.99 |
|       1214 |                  54 |        299.99 |
|       1216 |                  54 |        299.99 |
|       1210 |                  54 |        199.99 |
|       1226 |                  55 |            85 |
|       1227 |                  55 |            85 |
|       1235 |                  55 |            85 |
|       1256 |                  56 |        159.99 |
|       1259 |                  56 |        159.99 |
|       1250 |                  56 |            90 |
|       1279 |                  57 |        189.99 |
|       1297 |                  57 |        174.99 |
|       1281 |                  57 |        159.99 |
|       1319 |                  58 |           241 |
|       1299 |                  58 |           194 |
|       1302 |                  58 |           130 |
|       1323 |                  59 |           100 |
|       1330 |                  59 |           100 |
|       1331 |                  59 |           100 |
+------------+---------------------+---------------+

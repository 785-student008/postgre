-- select * from employee;
-- select emp_name, birthday, sal from employee;
-- select emp_name as 従業員名, birthday as 生年月日, sal as 給与, cast(sal * 12 as int) as 年収 from employee;
-- select '担当者 ' || emp_name ||' の誕生日は ' || birthday || '　です' from employee;
-- select emp_name, to_char(birthday, 'Day, month, YYYY' ) from employee;
-- select emp_name, to_char(sal, '9G999G999D99') from employee;
-- select emp_name, birthday, sal, comm, sal + coalesce(comm,0) from employee;
-- select '担当者 ' || emp_name ||' の歴は ' || cast(cast(birthday 'YYYY' as int) - cast(hiredate 'YYYY' as int)) || '　年です' from employee;
-- select emp_name, gender from employee;
-- select emp_name,
--     case
--         when gender = 1 then '男性'
--                   else '女性'
--     end
-- from employee;
-- select emp_name,
--     case
--         when gender = 1 then '男性'
--                   else '女性'
--     end as 性別
-- from employee;
-- select emp_name, birthday, sal, comm,
--     case
--         when comm is null then sal
--                         else sal + comm

--     end as 月収
-- from employee;
-- select * from employee order by gender,sal desc;

-- select *
-- from employee
-- order by sal desc
-- limit 3
-- offset 1;


-- ============実習=============
-- １，productをすべて参照
-- select * from product;

-- ２，商品表productから商品名（prod_name）と単価、割引率を出す
-- select prod_name, cost, discount from product;

-- ３、2に加えて（cost * discount）の割引価格を出す
-- select prod_name, cost, discount, 
-- cast(cost * discount as NUMERIC)
-- as 割引価格
-- from product;

-- ４，discountがnullのレコードには１を代入して表示
--  select prod_name, cost, discount, 
--     case discount is null then cost
--                              else cast(cost * discount as NUMERIC)

--     end
-- as 割引価格
-- from product;

-- 条件で絞込（WHERE文）
-- select 
--     emp_name, 
--     sal 
-- from employee
-- where sal > 2000 or sal == 2000;

-- select
--     emp_name,
--     sal
-- from employee
-- where gender = 2
-- ;

-- select
--     emp_name,
--     sal
-- from employee
-- where emp_name = '安部 弘江'
-- ;

-- SELECT
--     emp_name,
--     sal,
--     birthday
-- from employee
-- where birthday >= '1980-01-01'
-- ;

-- select
--     emp_name,
--     sal
-- from employee
-- where between sal 2000 and 3000
-- -- 2000以上3000以下
-- ;

-- select 
--     emp_name,
--     emp_id,
--     sal
-- from employee
-- where emp_id in(2,4,7) -- 配列にしてる
-- ;

-- select 
--     emp_name, 
--     sal
--     gender
-- from employee
-- where sal >=2000 or gender = 2
-- ;

-- select
--     emp_name,
--     sal,
--     gender
-- from employee
-- where
--     (sal >= 2000 and sal <= 3000) or gender = 2
-- ;

-- select
--     emp_name,
--     sal
-- from employee
-- where sal between 2000 and 2500
-- ;

-- select * from customer
-- where address like '%大阪市%';

-- SELECT * from customer
-- where address not like '東京都%';

-- select * from customer
-- where cust_name like '_田%子';

-- select * from employee
-- where comm is not null;

-- 実習WHERE句=================================
-- １，productからcostが20000円以上を表示
-- select * from product
-- where cost >= 20000;

-- ２，customerからFAXがNULLであるcust_idとcust_nameを表示
-- select 
--     cust_id,
--     cust_name
-- from customer
-- where fax is null;

-- ３，salesからpsales_noが110番台のsales_no、psales_no
-- select
--     sales_no,
--     psales_no,
--     prod_id,
--     price
-- from sales
-- where psales_no between 110 and 119
-- order by price desc;

-- ６，customerの電話番号03,06始まり以外
-- select
--     cust_id,
--     cust_name,
--     tel
-- from customer
-- where tel not like '03%' and '06%'
-- ;
-- ==========================================

-- select count(*) from employee;

-- select
--     count(*),
--     sum(sal),
--     count(comm),
--     count(*) - count(comm)--commがnullのひと
-- from employee;

-- select
--     dept_id,
--     count(*),
--     sum(sal),
--     avg(sal),
--     min(sal),
--     max(sal)
-- from employee
-- group by dept_id
-- order by dept_id
-- ;

-- select
--     gender,
--     count(*)
-- from employee
-- group by gender
-- order by gender
-- ;

-- select
--     dept_id,
--     gender,
--     count(*),
--     avg(sal)
-- from employee
-- group by dept_id,gender
-- order by dept_id,gender
-- ;

select
    dept_id,
    sum(sal),
    avg(sal),
    min(sal),
    max(sal)
from employee
group by dept_id
    having sum(sal) <= 5000--グループの条件
order by dept_id
;
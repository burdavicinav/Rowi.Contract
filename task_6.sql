-- 6
with client_inn_content
as
(
select
	id_client,
  	nameclient,
  	inn,
  	inn_len,
  	inn_on_check,
  	1 as num,
	cast(substring(inn_on_check, 1, 1) as int) as digit
FROM
	v_client_inn_details
union all
select
	id_client,
  	nameclient,
  	inn,
  	inn_len,
  	inn_on_check,
  	num + 1,
	cast(substring(inn_on_check, num + 1, 1) as int)
FROM
	client_inn_content
WHERE
  	num + 1 <= len(inn_on_check)
)
SELECT
  id_client,
  nameclient,
  inn,
  iif(
    inn_len = 10 and digit_10 = sum_10 OR
    inn_len = 12 and digit_11 = sum_11 and digit_12 = sum_12, 1, 0) 
    	as inn_is_correct
FROM
  (
  SELECT
      id_client,
      nameclient,
      inn,
      inn_len,
      sum_10 % iif(sum_10 % 11 > 9, 10, 11) as sum_10,
      sum_11 % iif(sum_11 % 11 > 9, 10, 11) as sum_11,
      sum_12 % iif(sum_12 % 11 > 9, 10, 11) as sum_12,
      digit_10,
      digit_11,
      digit_12
  FROM
    (
    SELECT
        id_client,
        nameclient,
        inn,
        inn_len,
        sum(digit * coalesce(val, 0)) as sum_10,
        sum(digit * coalesce(val1, 0)) as sum_11,
        sum(digit * coalesce(val2, 0)) as sum_12,
        max(iif(num = 10, digit, -1)) as digit_10,
        max(iif(num = 11, digit, -1)) as digit_11,
        max(iif(num = 12, digit, -1)) as digit_12
    FROM
        client_inn_content c
        left JOIN
        inn_weight_10 w10
        ON
            w10.id = c.num
        left JOIN
        inn_weight_12 w12
        ON
            w12.id = c.num
    group BY
        id_client,
        nameclient,
        inn,
        inn_len
    ) t1
  ) t2
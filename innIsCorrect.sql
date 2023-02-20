create function innIsCorrect(@inn char(16))
returns int
AS
BEGIN

	-- объявление переменной для результата корректности
	declare @isCorrect int = -1
    
    -- предварительная обработка входных данных
    set @inn = case
                when len(trim(@inn)) not in (10, 12) or trim(@inn) like '%[^0-9]%'
                then '0' else trim(@inn)
              end;
              
	-- алгоритм    
    with inn_content
    as
    (
    select
        @inn as inn,
        len(@inn) as inn_len,
        @inn as inn_on_check,
        1 as num,
        cast(substring(@inn, 1, 1) as int) as digit
    union all
    select
        inn,
        inn_len,
        inn_on_check,
        num + 1,
        cast(substring(inn_on_check, num + 1, 1) as int)
    FROM
        inn_content
    WHERE
        num + 1 <= len(inn_on_check)
    )
    SELECT
      @isCorrect =
        iif(
          inn_len = 10 and digit_10 = sum_10 OR
          inn_len = 12 and digit_11 = sum_11 and digit_12 = sum_12, 1, 0) 
    FROM
      (
      SELECT
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
            inn,
            inn_len,
            sum(digit * coalesce(val, 0)) as sum_10,
            sum(digit * coalesce(val1, 0)) as sum_11,
            sum(digit * coalesce(val2, 0)) as sum_12,
            max(iif(num = 10, digit, -1)) as digit_10,
            max(iif(num = 11, digit, -1)) as digit_11,
            max(iif(num = 12, digit, -1)) as digit_12
        FROM
            inn_content c
            left JOIN
            inn_weight_10 w10
            ON
                w10.id = c.num
            left JOIN
            inn_weight_12 w12
            ON
                w12.id = c.num
        group BY
            inn,
            inn_len
        ) t1
      ) t2
	
	return @isCorrect
    
end;
-- 1
SELECT distinct
	cl.id_client,
    cl.inn,
    cl.nameclient
FROM
	contract c
    JOIN
    client cl
    ON
      cl.id_client = c.id_client
WHERE
	c.stat = 0;
  
-- 2
SELECT
	cl.id_client,
    cl.inn,
    cl.nameclient
FROM
	contract c
    JOIN
    client cl
    ON
      cl.id_client = c.id_client
group BY
	cl.id_client,
    cl.inn,
    cl.nameclient
HAVING
  count(distinct c.id_type) > 3;
  
-- 3
SELECT
	c.id_type,
    count(distinct cl.id_client) as cnt
FROM
	contract c
    JOIN
    client cl
    ON
      cl.id_client = c.id_client
WHERE
	c.stat = 0
group BY
	c.id_type;
    
-- 4
SELECT
  id_type,
  stat,
  coalesce(sum(case when descr is null then 1 else 0 end), 0) as cnt
FROM
	contract
group BY
  id_type,
  stat;
  
-- 5
SELECT
	cl.nameclient,
    c.number,
    c.stat,
    c.value_contract,
	coalesce(sum(cm.value_commission) / c.value_contract * 100, 0) as tax_calc
FROM
    contract c
    left JOIN
    commission cm
    ON
    	cm.id_contract = c.id_contract
    JOIN
    client cl
    ON
    	cl.id_client = c.id_client
group BY
    c.id_contract,
	cl.nameclient,
    c.number,
    c.stat,
    c.value_contract;
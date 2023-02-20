-- клиенты
create table client (
  id_client integer primary key,
  inn varchar(16) not null,
  nameclient varchar(30) not null
  );
  
-- типы договоров
create table contract_type (
  id integer primary key,
  name varchar(30) not null
  );
  
-- договоры
create table contract (
  id_contract integer primary key,
  id_type integer not null references contract_type(id),
  id_client integer not null references client(id_client),
  stat integer not null default 0,
  value_contract decimal(18,6) not null,
  number varchar(30) not null,
  descr varchar(255),
  
  check(stat in (0,1)),
  check(value_contract > 0)
  );

-- комиссии по договору
create table commission (
  id_commission integer primary key,
  id_contract integer not null references contract(id_contract),
  date_begin date,
  date_end date,
  value_commission decimal(18,6) not null,
  
  check(value_commission > 0)
  );
  
-- веса для алгоритма 10-х ИНН
create table inn_weight_10 (
	id integer primary key,
  	val integer not null
);

-- веса для алгоритма 12-х ИНН
create table inn_weight_12 (
	id integer primary key,
  	val1 integer not null,
  	val2 integer not null
);

-- вспомогательное представление для задачи с ИНН
create view v_client_inn_details
as
select
  id_client,
  nameclient,
  inn,
  len(trim(inn)) as inn_len,
  case
  	when len(trim(inn)) not in (10, 12) or trim(inn) like '%[^0-9]%'
    then '0' else trim(inn)
  end as inn_on_check
from
  client;
insert into client (id_client, inn, nameclient)
values (1, '263516479611', 'client_1');

insert into client (id_client, inn, nameclient)
values (2, '3323423423', 'client_2');

insert into client (id_client, inn, nameclient)
values (3, '443fs21233', 'client_3');

insert into client (id_client, inn, nameclient)
values (4, '1234567890', 'client_4');

insert into client (id_client, inn, nameclient)
values (5, '3803300254', 'client_5');

insert into client (id_client, inn, nameclient)
values (6, '3a', 'client_6');

insert into client (id_client, inn, nameclient)
values (7, '9912233122', 'client_7');

insert into client (id_client, inn, nameclient)
values (8, 'test', 'client_8');

insert into client (id_client, inn, nameclient)
values (9, '1234567891234567', 'client_9');

insert into client (id_client, inn, nameclient)
values (10, '7743013902', 'client_10');

insert into client (id_client, inn, nameclient)
values (11, '7743013901', 'client_11');

insert into client (id_client, inn, nameclient)
values (12, '1231231230', 'client_12');

insert into client (id_client, inn, nameclient)
values (13, '047163242364', 'client_13');

insert into client (id_client, inn, nameclient)
values (14, '664859480742', 'client_14');

insert into client (id_client, inn, nameclient)
values (15, '702260521576', 'client_15');

insert into client (id_client, inn, nameclient)
values (16, '146480427663 ', 'client_16');

insert into client (id_client, inn, nameclient)
values (17, '    358709091718', 'client_17');

insert into client (id_client, inn, nameclient)
values (18, '494267039420', 'client_18');

insert into client (id_client, inn, nameclient)
values (19, '89797781134', 'client_19');

insert into client (id_client, inn, nameclient)
values (20, '4112068321251', 'client_20');

insert into contract_type (id, name)
values (1, 'type_1');

insert into contract_type (id, name)
values (2, 'type_2');

insert into contract_type (id, name)
values (3, 'type_3');

insert into contract_type (id, name)
values (4, 'type_4');

insert into contract_type (id, name)
values (5, 'type_5');

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  1, 1, 1, 0, 10000, '1' 
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  2, 2, 1, 0, 15000, '2' 
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  3, 3, 1, 1, 35000, '3'
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  4, 4, 1, 0, 3000, '4'  
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  5, 1, 2, 1, 150000, '5'  
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  6, 2, 2, 1, 210000, '6'  
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  7, 3, 2, 1, 250000, '7'
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  8, 4, 2, 0, 1000000, '8'
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  9, 5, 3, 1, 1400000, '9'
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  10, 5, 3, 0, 70000, '10'
);


insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number
)
values (
  11, 5, 3, 0, 150000, '11'
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number, descr
)
values (
  12, 1, 4, 1, 10000, '11', 'test1'
);

insert into contract (
  id_contract, id_type, id_client, stat, value_contract, number, descr
)
values (
  13, 3, 4, 0, 110000, '13', 'test2'
);

insert into commission (
  id_commission, id_contract, date_begin, date_end, value_commission
)
values (
  1, 1, '01.01.2023', '05.01.2023', 500
);

insert into commission (
  id_commission, id_contract, date_begin, date_end, value_commission
)
values (
  2, 1, '01.02.2023', '03.02.2023', 1599
);

insert into commission (
  id_commission, id_contract, date_begin, date_end, value_commission
)
values (
  3, 1, '01.03.2023', '03.03.2023', 199
);

insert into inn_weight_10 (id, val) values (1, 2);
insert into inn_weight_10 (id, val) values (2, 4);
insert into inn_weight_10 (id, val) values (3, 10);
insert into inn_weight_10 (id, val) values (4, 3);
insert into inn_weight_10 (id, val) values (5, 5);
insert into inn_weight_10 (id, val) values (6, 9);
insert into inn_weight_10 (id, val) values (7, 4);
insert into inn_weight_10 (id, val) values (8, 6);
insert into inn_weight_10 (id, val) values (9, 8);
insert into inn_weight_10 (id, val) values (10, 0);

insert into inn_weight_12 (id, val1, val2) values (1, 7, 3);
insert into inn_weight_12 (id, val1, val2) values (2, 2, 7);
insert into inn_weight_12 (id, val1, val2) values (3, 4, 2);
insert into inn_weight_12 (id, val1, val2) values (4, 10, 4);
insert into inn_weight_12 (id, val1, val2) values (5, 3, 10);
insert into inn_weight_12 (id, val1, val2) values (6, 5, 3);
insert into inn_weight_12 (id, val1, val2) values (7, 9, 5);
insert into inn_weight_12 (id, val1, val2) values (8, 4, 9);
insert into inn_weight_12 (id, val1, val2) values (9, 6, 4);
insert into inn_weight_12 (id, val1, val2) values (10, 8, 6);
insert into inn_weight_12 (id, val1, val2) values (11, 0, 8);
insert into inn_weight_12 (id, val1, val2) values (12, 0, 0);
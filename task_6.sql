/*
6) Необходимо написать SQL код, проверяющий корректность
ИНН клиента по контрольному ключу.
*/
select
  id_client,
  nameclient,
  inn,
  dbo.innIsCorrect(inn)
from
  client;
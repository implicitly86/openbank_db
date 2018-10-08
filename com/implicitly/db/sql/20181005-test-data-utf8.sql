
-- добавление роли Администратор
insert into "role" values (nextval('sq_role'), 'admin');

-- добавление тестового пользователя (логин / пароль - test_user1 / test) --
insert into "customer" values (nextval('sq_customer'), 'Иван', 'Иванов', 'Иванович', 'г.Уфа, пр. Октября, 11-123', '89225005050', 'ivanov@openbank.com');
insert into "account" values (nextval('sq_account'), '4276000011112222', '1000.0', currval('sq_customer'));
insert into "account" values (nextval('sq_account'), '4276000011113333', '2000.0', currval('sq_customer'));
insert into "user" values (nextval('sq_user'), 'test_user1', '$2a$04$jtxLDiWLMxZnk.XPb91/fOWM6mmAubcM9C1sK2wOttxq.R.lP3ZTu', currval('sq_customer'));
insert into "user_role" values (nextval('sq_user_role'), currval('sq_user'), currval('sq_role'));

-- добавление тестового пользователя (логин / пароль - test_user2 / test) --
insert into "customer" values (nextval('sq_customer'), 'Петр', 'Петров', 'Петрович', 'г.Уфа, пр. Ленина, 1-16', '89221110000', 'petrov@openbank.com');
insert into "account" values (nextval('sq_account'), '4276000000001111', '100.0', currval('sq_customer'));
insert into "account" values (nextval('sq_account'), '4276000000002222', '200.0', currval('sq_customer'));
insert into "user" values (nextval('sq_user'), 'test_user2', '$2a$04$jtxLDiWLMxZnk.XPb91/fOWM6mmAubcM9C1sK2wOttxq.R.lP3ZTu', currval('sq_customer'));
insert into "user_role" values (nextval('sq_user_role'), currval('sq_user'), currval('sq_role'));

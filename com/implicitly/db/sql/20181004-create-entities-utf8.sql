
-- клиент --
create sequence sq_customer minvalue 1 maxvalue 9223372036854775807 increment by 1 start with 1;
create table "customer" (
  id                  bigint        constraint customer__id not null,
  first_name          varchar(256)  constraint customer__first_name not null,
  last_name           varchar(256)  constraint customer__last_name not null,
  middle_name         varchar(256),
  address             varchar(256),
  phone               varchar(256),
  email               varchar(256),
  constraint pk_customer primary key (id)
);
comment on table "customer" is 'Клиент';
comment on column "customer".id is 'Идентификатор клиента';
comment on column "customer".first_name is 'Имя клиента';
comment on column "customer".last_name is 'Фамилия клиента';
comment on column "customer".middle_name is 'Отчество клиента';
comment on column "customer".address is 'Адрес клиента';
comment on column "customer".phone is 'Телефон клиента';
comment on column "customer".email is 'Почта клиента';

-- банковский счет --
create sequence sq_account minvalue 1 maxvalue 9223372036854775807 increment by 1 start with 1;
create table "account" (
  id                  bigint            constraint account__id not null,
  "number"            varchar(256)      constraint account__number not null,
  balance             double precision  constraint account__balance not null,
  customer_id         bigint            constraint user__customer_id not null,
  constraint pk_account primary key (id, "number")
);
comment on table "account" is 'Банковский счет';
comment on column "account".id is 'Идентификатор счета';
comment on column "account"."number" is 'Номер счета';
comment on column "account".balance is 'Баланс';
comment on column "account".customer_id is 'Идентификатор клиента';
alter table "account" add constraint fk_account__customer foreign key (customer_id) references "customer" (id);

-- пользователь --
create sequence sq_user minvalue 1 maxvalue 9223372036854775807 increment by 1 start with 1;
create table "user" (
  id                 bigint        constraint user__id not null,
  name               varchar(256)  constraint user__name not null,
  password           varchar(256)  constraint user__password not null,
  customer_id        bigint        constraint user__customer_id not null,
  constraint pk_user primary key (id)
);
comment on table "user" is 'Пользователь';
comment on column "user".id is 'Идентификатор пользователя';
comment on column "user".name is 'Имя пользователя';
comment on column "user".password is 'Пароль пользователя';
comment on column "user".customer_id is 'Идентификатор клиента';
alter table "user" add constraint fk_user__customer foreign key (customer_id) references "customer" (id);

-- роль пользователя --
create sequence sq_role minvalue 1 maxvalue 9223372036854775807 increment by 1 start with 1;
create table "role" (
  id                 bigint        constraint role__id not null,
  name               varchar(256)  constraint role__name not null,
  constraint pk_role primary key (id)
);
comment on table "role" is 'Роль пользователя';
comment on column "role".id is 'Идентификатор роли';
comment on column "role".name is 'Название роли';

-- связь пользователя с ролью --
create sequence sq_user_role minvalue 1 maxvalue 9223372036854775807 increment by 1 start with 1;
create table "user_role" (
  id                 bigint        constraint user_role__id not null,
  user_id            bigint        constraint user_role__user_id not null,
  role_id            bigint        constraint user_role__role_id not null,
  constraint pk_user_role primary key (id)
);
comment on table "user_role" is 'Связь пользователя с ролью';
comment on column "user_role".id is 'Идентификатор связи';
comment on column "user_role".user_id is 'Идентификатор пользователя';
comment on column "user_role".role_id is 'Идентификатор роли';
alter table user_role add constraint fk_user_role__user foreign key (user_id) references "user" (id);
alter table user_role add constraint fk_user_role__role foreign key (role_id) references "role" (id);

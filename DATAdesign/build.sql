CREATE TABLE ROLES (
  role_id             numeric(5),
  role_name           varchar(15),
  constraint pk_roles primary key (role_id)
);
CREATE TABLE SOS (
  so_id               numeric(5),
  so_name             varchar(20),
  constraint pk_sos primary key (so_id)
);
CREATE TABLE USERS (
  user_user           varchar(20),
  user_name           varchar(30),
  user_email          varchar(50),
  user_date           date,
  user_role           numeric(5),
  user_urlimage       varchar(50),
  constraint pk_users primary key (user_user),
  constraint fk_roles foreign key (user_role) references roles (role_id),
  constraint username check (user_name is not null),
  constraint initcapname check (user_name=initcap(user_name))
);
CREATE TABLE HOSTS (
  host_ip             varchar(15),
  host_name           varchar(30),
  host_so             numeric(5),
  constraint pk_hosts primary key (host_ip),
  constraint fk_sos foreign key (host_so) references sos (so_id)
);
CREATE TABLE BACKUPS (
  backup_user         varchar(20),
  backup_host         varchar(15),
  backup_label        varchar(40),
  backup_description  varchar(80),
  backup_action       varchar(15) default 'Automatica',
  backup_date         timestamp default now(), -- current_timestamp
  constraint pk_backups primary key (backup_date),
  constraint fk_users foreign key (backup_user) references users (user_user),
  constraint fk_hosts foreign key (backup_host) references hosts (host_ip),
  constraint fix_action check (backup_action in ('Automatica','Manual'))
);

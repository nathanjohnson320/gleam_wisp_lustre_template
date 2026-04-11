-- migrate:up
create table items (
  id varchar(64) primary key not null,
  title varchar(255) not null,
  status varchar(255) not null,
  inserted_at timestamp not null,
  updated_at timestamp not null
);

-- migrate:down
drop table items;


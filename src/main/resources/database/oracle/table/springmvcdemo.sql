------------------------------------------------
-- Export file for user SPRINGMVCDEMO@ORCL    --
-- Created by XiboLee on 2016/12/10, 14:52:57 --
------------------------------------------------

set define off
spool springmvcdemo.log

prompt
prompt Creating table USERS
prompt ====================
prompt
create table USERS
(
  id         NUMBER(16) not null,
  nickname   VARCHAR2(200),
  password   VARCHAR2(100),
  first_name VARCHAR2(100),
  last_name  VARCHAR2(100)
)
;
comment on table USERS
  is '用户表';
comment on column USERS.id
  is '用户ID';
comment on column USERS.nickname
  is '昵称';
comment on column USERS.password
  is '密码';
comment on column USERS.first_name
  is '名字';
comment on column USERS.last_name
  is '姓氏';
alter table USERS
  add constraint PK_USERS primary key (ID);

prompt
prompt Creating table BLOGS
prompt ====================
prompt
create table BLOGS
(
  id       NUMBER(16) not null,
  title    VARCHAR2(500),
  content  VARCHAR2(3000),
  user_id  NUMBER(16),
  pub_date VARCHAR2(14)
)
;
comment on table BLOGS
  is '博文表';
comment on column BLOGS.id
  is '博文ID';
comment on column BLOGS.title
  is '标题';
comment on column BLOGS.content
  is '内容';
comment on column BLOGS.user_id
  is '用户ID';
comment on column BLOGS.pub_date
  is '推送时间';
create index IDX_BLOG_USER_ID on BLOGS (USER_ID);
alter table BLOGS
  add constraint PK_BLOG primary key (ID);
alter table BLOGS
  add constraint FK_BLOG_USERS_ID foreign key (USER_ID)
  references USERS (ID);


spool off

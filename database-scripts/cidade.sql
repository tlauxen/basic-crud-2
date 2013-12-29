create sequence cidade_seq;

create table cidade (
	id bigint not null,
	idestado bigint not null,
	nome varchar(100) not null
);

alter table cidade add constraint cidade_pk primary key (id);

alter table cidade add constraint cid_est_fk foreign key (idestado) references estado (id);
create index cid_est_fk_ix on cidade(idestado);

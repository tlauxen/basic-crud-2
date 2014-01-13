create sequence feriado_seq;

create table feriado (
	id bigint not null,
	tpabrangencia char(1) not null,
	idpais bigint not null,
	idcidade bigint,
	tpperiodo char(1) not null,
	nome varchar(100) not null,
	mes int,
	dia int,
	data date
);

alter table feriado add constraint feriado_pk primary key (id);

alter table feriado add constraint fer_pai_fk foreign key (idpais) references pais (id);
create index fer_pai_fk_ix on feriado(idpais);

alter table feriado add constraint fer_cid_fk foreign key (idcidade) references cidade (id);
create index fer_cid_fk_ix on feriado(idcidade);

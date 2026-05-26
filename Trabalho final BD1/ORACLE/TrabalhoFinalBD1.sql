DROP TABLE ASSISTE CASCADE CONSTRAINTS;
DROP TABLE DISPOSITIVO CASCADE CONSTRAINTS;
DROP TABLE PAGAMENTO CASCADE CONSTRAINTS;
DROP TABLE PERFIL CASCADE CONSTRAINTS;
DROP TABLE CONTA CASCADE CONSTRAINTS;
DROP TABLE CLASSIFICACAO CASCADE CONSTRAINTS;
DROP TABLE ATUAM CASCADE CONSTRAINTS;
DROP TABLE SERIE CASCADE CONSTRAINTS;
DROP TABLE FILME CASCADE CONSTRAINTS;
DROP TABLE CONTEUDO CASCADE CONSTRAINTS;
DROP TABLE PLANO CASCADE CONSTRAINTS;
DROP TABLE GENERO CASCADE CONSTRAINTS;
DROP TABLE ELENCO CASCADE CONSTRAINTS;
DROP TABLE DIRETOR CASCADE CONSTRAINTS;


create table DIRETOR(
	cod NUMBER(9),
    nome VARCHAR2(120) NOT NULL,
    nacionalidade VARCHAR2(100) NOT NULL,
    anoInicio DATE,
    constraint pk_diretor primary key(cod)
);

create table ELENCO(
	id NUMBER(9),
    nome VARCHAR2(120) NOT NULL,
    constraint pk_elenco primary key(id)
);

create table GENERO(
	cod NUMBER(9),
    nome VARCHAR2(120) NOT NULL,
    constraint pk_genero primary key(cod)
);

create table PLANO(
	cod NUMBER(9), 
    tipoPlano VARCHAR2(120) NOT NULL,
    statu VARCHAR2(8) NOT NULL,
    valorMensal NUMBER(8,2) NOT NULL,
    valorAnual NUMBER(8,2) NOT NULL,
    constraint pk_plano primary key(cod)
);

create table CONTEUDO(
	cod NUMBER(9),
    classificaEtaria varchar2(5) NOT NULL,
    duracaoMin NUMBER(3) NOT NULL,
    anoLancamento DATE NOT NULL,
    titulo varchar2(120) NOT NULL,
    descricao varchar(4000) NOT NULL,
    tipo NUMBER(2) CHECK(tipo in (1, 2)) NOT NULL,
    diretorCod NUMBER(9),
    constraint pk_conteudo primary key(cod),
    constraint fk_conteudo_diretor foreign key(diretorCod) references Diretor(cod)
);

create table FILME(
	premio varchar2(120) NOT NULL,
    conteudoCod NUMBER(9),
    constraint pk_filme primary key(conteudoCod),
    constraint fk_filme_conteudo foreign key(conteudoCod) references Conteudo(cod)
);

create table SERIE(
	numTemporadas NUMBER(4) NOT NULL,
    numEpisodios NUMBER(4) NOT NULL,
    conteudoCod NUMBER(9),
    constraint pk_serie primary key(conteudoCod),
    constraint fk_serie_conteudo foreign key(conteudoCod) references Conteudo(cod)
);

create table ATUAM(
	elencoId NUMBER(9),
    conteudoCod NUMBER(9),
    constraint fk_atuam_elenco foreign key(elencoId) references Elenco(id),
    constraint fk_atuam_conteudo foreign key(conteudoCod) references Conteudo(cod)
);

create table CLASSIFICACAO(
	generoCod NUMBER(9),
    conteudoCod NUMBER(9),
    constraint fk_classificacao_genero foreign key(generoCod) references Genero(cod),
    constraint fk_classificacao_conteudo foreign key(conteudoCod) references Conteudo(cod)
);

create table CONTA(
	cpf VARCHAR2(14),
    email VARCHAR2(120) NOT NULL,
    senha varchar2(128) NOT NULL,
    status varchar2(8) NOT NULL,
    nome VARCHAR2(120) NOT NULL,
    dataNascimento DATE NOT NULL,
    telefoneFixo VARCHAR2(30),
    telefoneCelular VARCHAR2(30),
    pais VARCHAR2(30) NOT NULL,
    cep VARCHAR2(11) NOT NULL,
    numCasa NUMBER(6) NOT NULL,
    cidade VARCHAR2(90) NOT NULL,
    bairro VARCHAR2(90) NOT NULL,
    nomeRua VARCHAR2(100) NOT NULL,
    planoCod NUMBER(9),
    constraint pk_conta primary key(cpf),
    constraint fk_conta_plano foreign key(planoCod) references Plano(cod)
);

CREATE TABLE PERFIL (
    nome VARCHAR2(120),
    classificacao VARCHAR2(5) NOT NULL,
    foto_perfil BLOB NOT NULL, 
    data_criaçao DATE NOT NULL, 
    contaCpf VARCHAR2(14),
    CONSTRAINT pk_perfil PRIMARY KEY(nome),
    CONSTRAINT fk_perfil_cpf FOREIGN KEY (contaCpf) references CONTA(cpf)
);

CREATE TABLE ASSISTE (
    perfilNome VARCHAR2(120),
    conteudoCod NUMBER(9),
    hora TIMESTAMP, -- valor para teste '2025-11-27 14:35:22'
    data DATE,
    nota NUMBER(3,2) NOT NULL,
    CONSTRAINT pk_assite PRIMARY KEY(perfilNome, conteudoCod),
    CONSTRAINT fk_assite_perfil FOREIGN KEY (perfilNome) references PERFIL(nome),
    CONSTRAINT fk_assiste_conteudo FOREIGN KEY (conteudoCod) REFERENCES CONTEUDO(cod)
);

CREATE TABLE DISPOSITIVO (
    id NUMBER(15),
    tipo_dipositivo VARCHAR2(120) NOT NULL,
    sistema_peracional VARCHAR2(120) NOT NULL,
    perfilNome VARCHAR2(120),
    CONSTRAINT pk_dispositivo PRIMARY KEY (id),
    CONSTRAINT fk_dipositvos_perfil FOREIGN KEY (perfilNome) REFERENCES PERFIL(nome)
);

CREATE TABLE PAGAMENTO (
    id NUMBER(15), 
    tipo_pagamento VARCHAR2(120) NOT NULL,
    valor NUMBER(6,2) NOT NULL, 
    data DATE NOT NULL, 
    vencimento DATE NOT NULL, 
    contaCpf VARCHAR2(14),
    CONSTRAINT pk_pagamento PRIMARY KEY (id),
    CONSTRAINT fk_pagamento_conta FOREIGN KEY (contaCpf) REFERENCES CONTA(cpf)
);







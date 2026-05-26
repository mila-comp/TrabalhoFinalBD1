create database tf;

CREATE TABLE DIRETOR(
    cod INT,
    nome VARCHAR(120) NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL,
    anoInicio DATE,
    PRIMARY KEY(cod)
);

CREATE TABLE ELENCO(
    id INT,
    nome VARCHAR(120) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE GENERO(
    cod INT,
    nome VARCHAR(120) NOT NULL,
    PRIMARY KEY(cod)
);

CREATE TABLE PLANO(
    cod INT,
    tipoPlano VARCHAR(120) NOT NULL,
    statu VARCHAR(8) NOT NULL,
    valorMensal DECIMAL(8,2) NOT NULL,
    valorAnual DECIMAL(8,2) NOT NULL,
    PRIMARY KEY(cod)
);

CREATE TABLE CONTEUDO(
    cod INT,
    classificaEtaria VARCHAR(5) NOT NULL,
    duracaoMin INT NOT NULL,
    anoLancamento DATE NOT NULL,
    titulo VARCHAR(120) NOT NULL,
    descricao VARCHAR(4000) NOT NULL,
    tipo INT CHECK(tipo IN (1,2)),
    diretorCod INT,
    PRIMARY KEY(cod),
    FOREIGN KEY(diretorCod) REFERENCES DIRETOR(cod)
);

CREATE TABLE FILME(
    premio VARCHAR(120) NOT NULL,
    conteudoCod INT,
    PRIMARY KEY(conteudoCod),
    FOREIGN KEY(conteudoCod) REFERENCES CONTEUDO(cod)
);

CREATE TABLE SERIE(
    numTemporadas INT NOT NULL,
    numEpisodios INT NOT NULL,
    conteudoCod INT,
    PRIMARY KEY(conteudoCod),
    FOREIGN KEY(conteudoCod) REFERENCES CONTEUDO(cod)
);

CREATE TABLE ATUAM(
    elencoId INT,
    conteudoCod INT,
    FOREIGN KEY(elencoId) REFERENCES ELENCO(id),
    FOREIGN KEY(conteudoCod) REFERENCES CONTEUDO(cod)
);

CREATE TABLE CLASSIFICACAO(
    generoCod INT,
    conteudoCod INT,
    FOREIGN KEY(generoCod) REFERENCES GENERO(cod),
    FOREIGN KEY(conteudoCod) REFERENCES CONTEUDO(cod)
);

CREATE TABLE CONTA(
    cpf VARCHAR(14),
    email VARCHAR(120) NOT NULL,
    senha VARCHAR(128) NOT NULL,
    status VARCHAR(8) NOT NULL,
    nome VARCHAR(120) NOT NULL,
    dataNascimento DATE NOT NULL,
    telefoneFixo VARCHAR(30),
    telefoneCelular VARCHAR(30),
    pais VARCHAR(30) NOT NULL,
    cep VARCHAR(11) NOT NULL,
    numCasa INT NOT NULL,
    cidade VARCHAR(90) NOT NULL,
    bairro VARCHAR(90) NOT NULL,
    nomeRua VARCHAR(100) NOT NULL,
    planoCod INT,
    PRIMARY KEY(cpf),
    FOREIGN KEY(planoCod) REFERENCES PLANO(cod)
);

CREATE TABLE PERFIL (
    nome VARCHAR(120),
    classificacao VARCHAR(5) NOT NULL,
    foto_perfil BLOB NOT NULL,
    data_criacao DATE NOT NULL,
    contaCpf VARCHAR(14),
    PRIMARY KEY(nome),
    FOREIGN KEY (contaCpf) REFERENCES CONTA(cpf)
);

CREATE TABLE ASSISTE (
    perfilNome VARCHAR(120),
    conteudoCod INT,
    hora TIMESTAMP,
    data DATE,
    nota DECIMAL(3,2) NOT NULL,
    PRIMARY KEY(perfilNome, conteudoCod),
    FOREIGN KEY (perfilNome) REFERENCES PERFIL(nome),
    FOREIGN KEY (conteudoCod) REFERENCES CONTEUDO(cod)
);

CREATE TABLE DISPOSITIVO (
    id INT,
    tipo_dispositivo VARCHAR(120) NOT NULL,
    sistema_operacional VARCHAR(120) NOT NULL,
    perfilNome VARCHAR(120),
    PRIMARY KEY (id),
    FOREIGN KEY (perfilNome) REFERENCES PERFIL(nome)
);

CREATE TABLE PAGAMENTO (
    id INT,
    tipo_pagamento VARCHAR(120) NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    data DATE NOT NULL,
    vencimento DATE NOT NULL,
    contaCpf VARCHAR(14),
    PRIMARY KEY (id),
    FOREIGN KEY (contaCpf) REFERENCES CONTA(cpf)
);



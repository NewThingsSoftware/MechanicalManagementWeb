--DROP TABLE "PECA_USADA";
--DROP TABLE "PECA";
--DROP TABLE "ORDEM_SERVICO";
--DROP TABLE "MECANICO";
--DROP TABLE "VEICULO";
--DROP TABLE "CLIENTES";

CREATE TABLE "CLIENTES"
        ("COD_CLIENTE" INT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
        "NOME" VARCHAR(150),
        "CPF" VARCHAR(15),
        "RG" VARCHAR(13));

CREATE TABLE "VEICULO"
        ("COD_VEICULO" INT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
        "PLACA" VARCHAR(8),
        "MARCA" VARCHAR(150),
        "MODELO" VARCHAR (150),
        "COD_CLIENTE_FK" INT NOT NULL,
        FOREIGN KEY ("COD_CLIENTE_FK") REFERENCES "CLIENTES" ("COD_CLIENTE"));

CREATE TABLE "MECANICO"
        ("COD_MECANICO" INT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
        "NOME" VARCHAR(150),
        "CPF" VARCHAR(15),
        "RG" VARCHAR(13));

CREATE TABLE "ORDEM_SERVICO"
        ("COD_ORDEM_SERVICO" INT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
        "DATA" DATE,
        "DESCRICAO" VARCHAR(150),
        "VALOR_MAO_OBRA" DOUBLE,
        "COD_VEICULO_FK" INT NOT NULL,
        "COD_MECANICO_FK" INT NOT NULL,
        FOREIGN KEY ("COD_VEICULO_FK") REFERENCES "VEICULO" ("COD_VEICULO"),
        FOREIGN KEY ("COD_MECANICO_FK") REFERENCES "MECANICO" ("COD_MECANICO"));

CREATE TABLE "PECA"
        ("COD_PECA" INT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
        "DESCRICAO" VARCHAR(150),
        "PRECO_COMPRA" DOUBLE,
        "PRECO_VENDA" DOUBLE);

CREATE TABLE "PECA_USADA"
        ("COD_PECA_USADA" INT NOT NULL PRIMARY KEY
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
        "COD_ORDEM_SERVICO_FK" INT NOT NULL,
        "COD_PECA_FK" INT NOT NULL,
        "QUANTIDADE" INT,
        FOREIGN KEY ("COD_ORDEM_SERVICO_FK") REFERENCES "ORDEM_SERVICO" ("COD_ORDEM_SERVICO"),
        FOREIGN KEY ("COD_PECA_FK") REFERENCES "PECA" ("COD_PECA"));


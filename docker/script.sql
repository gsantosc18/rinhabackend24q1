-- Coloque scripts iniciais aqui
CREATE TABLE clientes(
id serial primary key,
nome varchar(100),
limite int
);

CREATE TABLE transacoes(
id serial primary key,
id_cliente int not null,
valor int,
decricao varchar(10),
constraint fk_transacoes_clientes
foreign key (id_cliente)
references clientes(id)
);

DO $$
BEGIN
  INSERT INTO clientes (nome, limite)
  VALUES
    ('o barato sai caro', 1000 * 100),
    ('zan corp ltda', 800 * 100),
    ('les cruders', 10000 * 100),
    ('padaria joia de cocaia', 100000 * 100),
    ('kid mais', 5000 * 100);
END; $$
-- EX 1

SELECT Nome_Cliente 
FROM hotel.cliente
ORDER BY Nome_Cliente DESC;

-- EX 2

SELECT Numero_Quarto 
FROM Quarto
WHERE Sigla_Hotel = "RM";

-- EX3

-- Indique qual o comando SELECT que permite listar todos os dados do cliente cujo nome:
-- Começa por “C”
-- Termina em “E”
-- Tem pelo menos um “A”
-- A segunda letra é um “A”
-- A penúltima ou antepenúltima letra é um “N”
-- Contenha um “A”, mas NÃO COMEÇE por “A”
-- Contenha um “A” que não seja a primeira letra (ex: exclui o António mas contempla a Ana)

SELECT * FROM hotel.cliente
WHERE Nome_CLIENTE LIKE "C%";

SELECT * FROM hotel.cliente
WHERE Nome_CLIENTE LIKE "%E";

SELECT * FROM hotel.cliente
WHERE Nome_CLIENTE LIKE "%A%";

SELECT * FROM hotel.cliente
WHERE Nome_CLIENTE LIKE "_A%";

SELECT * FROM hotel.cliente
WHERE Nome_CLIENTE LIKE "%N__" OR  Nome_CLIENTE LIKE "%N_";

SELECT * FROM hotel.cliente
WHERE Nome_CLIENTE LIKE "%A%" AND  Nome_Cliente NOT LIKE "A%";

-- EX 4

SELECT Count(Designacao) as "# Hoteis" FROM hotel.hotel;

-- EX 5  

SELECT Count(Numero_Quarto), Sum(Numero_Camas)
FROM hotel.quarto
WHERE Sigla_Hotel = "MJ";

-- EX 6 

SELECT Nome_Cliente 
FROM hotel.cliente, hotel.individual
WHERE cliente.Numero_Cliente = individual.Numero_Cliente;
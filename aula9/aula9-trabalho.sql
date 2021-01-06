
-- 1. Listar toda a informação dos livros existentes, ordenada por título.

SELECT * FROM Livro 
ORDER BY titulo;

-- 2. Listar as editoras existentes.

SELECT DISTINCT editora FROM Livro;


-- 3. Listar o título dos livros da Editora “Difel”

SELECT Titulo
FROM Livro
WHERE Editora="Difel";

-- 4. Listar o título, editora, edição e ID dos autores de todos os livros, ordenada por título

SELECT titulo, editora, edicao, IDAutor
FROM Livro as l, autoria as a
WHERE l.IDLivro=a.IDLivro
ORDER BY Titulo;

-- 5. Listar os títulos dos livros do Gabriel Garcia Marquez.

SELECT l.titulo
FROM Livro as l, autoria as a
WHERE l.IDLivro=a.IDLivro AND
IDAutor="Marquez";

-- 6. Indicar o número de livros existentes. (R:_69) 

SELECT count(Titulo) as TotalLivros
FROM Livro;

-- 7. Indicar o número de livros existentes com edição desconhecida. (R:_9) 

SELECT count(Titulo) as TotalLivros
FROM Livro
WHERE edicao IS null;

-- 8. Listar, para cada editora, o número máximo de edições existentes num livro dessa editora

SELECT Editora, MAX(Edicao)
FROM livro
GROUP BY editora;

-- 9. Listar o título de todos os livros, indicando o número de autores que escreveram o livro.

SELECT l.titulo, COUNT(a.IDAutor) as NumAutores
FROM livro as l, autoria as a
WHERE l.IDLivro = a.IDLivro
GROUP BY l.titulo;

-- 10. Listar, para cada editora, o número máximo de edições existentes num livro dessa editora. Apenas considerar editoras cujo valor máximo de edições é maior que 5.

SELECT Editora, MAX(Edicao) as MaxEdicao
FROM livro as l, autoria as a
GROUP BY editora
HAVING MaxEdicao > 5;   

-- 11. Listar, para cada nome de autor, o total de livros por ele editados.

SELECT autor.nome, COUNT(autoria.idlivro) AS NumeroLivros
FROM Autor, Autoria
WHERE autor.idautor = autoria.idautor 
GROUP BY autor.nome
UNION 
SELECT autor.nome , 0 FROM Autor WHERE NOT EXISTS
( SELECT autoria.idautor FROM autoria WHERE autoria.idautor =
autor.idautor);
-- Outra maneira
SELECT nome, count(IDLivro) as TotalLivros
FROM autor LEFT JOIN autoria ON autor.IDAutor = autoria.IDAutor
GROUP BY autor.Nome;

-- 12. Listar ordenadamente os nomes dos autores que não têm livros escritos
SELECT nome
FROM autor LEFT JOIN autoria ON autor.IDAutor = autoria.IDAutor
GROUP BY autor.Nome
HAVING COUNT(IDLivro)  = 0;


-- 13. Listar os nomes dos autores com mais livros, indicando o número de livros

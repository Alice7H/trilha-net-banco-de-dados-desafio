/*
	As consultas estão de acordo o objetivo, ou seja, com o retorno das imagens.
	Alguns enunciados dos exercícios não especificaram os campos que deveriam ser buscados. São eles os exercícios 2, 3, 4, 5, 6.
	O exercício 7 não ordena pela duração em ordem decrescente, mas sim pela quantidade, de acordo com a imagem de resolução.
	Os campos "Id" e "Gênero" não foram citados no enunciado dos exercícios 8 e 9, mas estão presentes na busca, conforme as imagens.
*/

-- 1- Buscar o nome e ano dos filmes
SELECT Nome, Ano FROM Filmes

-- 2- Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano, Duracao FROM Filmes ORDER BY Ano

-- 3- Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao FROM Filmes WHERE Nome = 'De volta para o futuro'

-- 4- Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao FROM Filmes WHERE Ano = 1997

-- 5- Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, Ano, Duracao FROM Filmes WHERE Ano > 2000

-- 6- Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome, Ano, Duracao FROM Filmes WHERE Duracao > 100 AND Duracao < 150 ORDER BY Duracao

-- 7- Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, COUNT(1) AS Quantidade FROM Filmes GROUP BY Ano ORDER BY Quantidade DESC

-- 8- Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT * FROM Atores WHERE Genero = 'M'

-- 9- Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT * FROM Atores WHERE Genero = 'F' ORDER BY PrimeiroNome

-- 10- Buscar o nome do filme e o gênero
SELECT f.Nome, g.genero FROM Filmes AS f
INNER JOIN FilmesGenero AS fg ON fg.IdFilme = f.Id
INNER JOIN Generos AS g ON g.Id = fg.IdGenero

-- 11- Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT f.Nome, g.genero FROM Filmes AS f
INNER JOIN FilmesGenero AS fg ON fg.IdFilme = f.Id
INNER JOIN Generos AS g ON g.Id = fg.IdGenero
WHERE g.Genero = 'Mistério'

-- 12- Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT f.Nome, a.PrimeiroNome, a.UltimoNome, ef.Papel
FROM Filmes AS f
INNER JOIN ElencoFilme AS ef ON ef.IdFilme = f.Id
INNER JOIN Atores AS a ON a.Id = ef.IdAtor

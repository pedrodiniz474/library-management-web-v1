DROP DATABASE BibliotecaWeb;


CREATE DATABASE BibliotecaWeb;
USE BibliotecaWeb;

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(150),
    editora VARCHAR(150),
    isbn VARCHAR(20),
    genero VARCHAR(80),
    ano_publicacao INT,
    numero_paginas INT,
    idioma VARCHAR(50),
    preco DOUBLE,
    quantidade INT,
    status ENUM('DISPONIVEL','EMPRESTADO','INATIVO') NOT NULL
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150),
    senha VARCHAR(255),
    tipo ENUM('ADMIN','USER') NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_livro) REFERENCES livros(id)
);

CREATE TABLE estantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genero VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO estantes (genero) VALUES
('Ficcao'),
('Romance'),
('Terror'),
('Aventura');


-- usuarios admin e usuario comum
INSERT INTO usuarios (nome, email, senha, tipo, ativo)
VALUES ('Admin', 'admin@gmail.com', SHA2('1234', 256), 'ADMIN', true);

INSERT INTO usuarios (nome, email, senha, tipo, ativo)
VALUES ('Pedro', 'pedro@gmail.com', SHA2('1234', 256), 'USER', true);

-- Ficção
INSERT INTO livros (titulo, autor, editora, isbn, genero, ano_publicacao, numero_paginas, idioma, preco, quantidade, status)
VALUES ('O Senhor dos Anéis', 'J.R.R. Tolkien', 'HarperCollins', '978-0261102354', 'Ficcao', 1954, 1178, 'Português', 89.90, 3, 'DISPONIVEL');

INSERT INTO livros (titulo, autor, editora, isbn, genero, ano_publicacao, numero_paginas, idioma, preco, quantidade, status)
VALUES ('Duna', 'Frank Herbert', 'Aleph', '978-8576572077', 'Ficcao', 1965, 680, 'Português', 74.90, 2, 'DISPONIVEL');

-- Romance
INSERT INTO livros (titulo, autor, editora, isbn, genero, ano_publicacao, numero_paginas, idioma, preco, quantidade, status)
VALUES ('Orgulho e Preconceito', 'Jane Austen', 'Penguin', '978-0141439518', 'Romance', 1813, 432, 'Português', 49.90, 4, 'DISPONIVEL');

INSERT INTO livros (titulo, autor, editora, isbn, genero, ano_publicacao, numero_paginas, idioma, preco, quantidade, status)
VALUES ('A Culpa é das Estrelas', 'John Green', 'Intrínseca', '978-8580572445', 'Romance', 2012, 288, 'Português', 44.90, 3, 'DISPONIVEL');

-- Terror
INSERT INTO livros (titulo, autor, editora, isbn, genero, ano_publicacao, numero_paginas, idioma, preco, quantidade, status)
VALUES ('It - A Coisa', 'Stephen King', 'Suma', '978-8555340000', 'Terror', 1986, 1104, 'Português', 79.90, 2, 'DISPONIVEL');

INSERT INTO livros (titulo, autor, editora, isbn, genero, ano_publicacao, numero_paginas, idioma, preco, quantidade, status)
VALUES ('O Iluminado', 'Stephen King', 'Suma', '978-8555340017', 'Terror', 1977, 512, 'Português', 59.90, 3, 'DISPONIVEL');

-- Aventura
INSERT INTO livros (titulo, autor, editora, isbn, genero, ano_publicacao, numero_paginas, idioma, preco, quantidade, status)
VALUES ('Moby Dick', 'Herman Melville', 'Penguin', '978-0142437247', 'Aventura', 1851, 720, 'Português', 54.90, 2, 'DISPONIVEL');

INSERT INTO livros (titulo, autor, editora, isbn, genero, ano_publicacao, numero_paginas, idioma, preco, quantidade, status)
VALUES ('As Aventuras de Tom Sawyer', 'Mark Twain', 'Martin Claret', '978-8572328494', 'Aventura', 1876, 256, 'Português', 39.90, 4, 'DISPONIVEL');

-- rodar safe update pra conseguir modificar
SET SQL_SAFE_UPDATES = 0;

-- esse comando vai fazer funcionar a quantidade la no nosso site é importante rodar
UPDATE livros SET status = 'DISPONIVEL' WHERE quantidade > 0;
UPDATE livros SET status = 'EMPRESTADO' WHERE quantidade = 0;


SELECT * from usuarios;
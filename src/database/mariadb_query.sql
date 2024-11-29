/*
*           MariaDB Initialization Queries
*/
-- database and user creation
CREATE DATABASE library DEFAULT CHARACTER SET = 'latin1';
CREATE USER librarian IDENTIFIED BY 'babel';
GRANT ALL PRIVILEGES ON library.* to 'librarian';
-- tables creation
USE library;
CREATE TABLE Livros (id INT AUTO_INCREMENT PRIMARY KEY,isbn13 CHAR(13) UNIQUE NOT NULL,Editoras_id INT NOT NULL,titulo VARCHAR(255) NOT NULL,subtitulo VARCHAR(255),idioma CHAR(4) NOT NULL,lancamento DATE NOT NULL,descricao TEXT);
CREATE TABLE Editoras (id INT AUTO_INCREMENT PRIMARY KEY,cnpj CHAR(14) NOT NULL UNIQUE,razao_social VARCHAR(255) UNIQUE NOT NULL,nome VARCHAR(255) NOT NULL,fundacao DATE NOT NULL);
CREATE TABLE Editoras_enderecos (id INT AUTO_INCREMENT PRIMARY KEY,Editoras_id INT NOT NULL,cep CHAR(8) NOT NULL,logradouro VARCHAR(255) NOT NULL,numero VARCHAR(255) NOT NULL,complemento VARCHAR(255),bairro VARCHAR(255) NOT NULL,cidade VARCHAR(255) NOT NULL,estado CHAR(2) NOT NULL);
CREATE TABLE Editoras_contatos (id INT AUTO_INCREMENT PRIMARY KEY,Enderecos_id INT NOT NULL,nome VARCHAR(255) NOT NULL,ddd CHAR(2) NOT NULL,numero VARCHAR(9) NOT NULL,email VARCHAR(255));
CREATE TABLE Tag (Generos_id INT NOT NULL,Livros_id INT NOT NULL);
CREATE TABLE Generos (id INT AUTO_INCREMENT PRIMARY KEY,nome VARCHAR(255) NOT NULL,descricao TEXT NOT NULL);
CREATE TABLE Autoria (Livros_id INT NOT NULL,Autores_id INT NOT NULL);
CREATE TABLE Autores (id INT AUTO_INCREMENT PRIMARY KEY,cpf CHAR(11) UNIQUE NOT NULL,nome VARCHAR(255) NOT NULL,pseudonimo VARCHAR(255),email VARCHAR(255));
CREATE TABLE Caracteristicas_fisicas (Livros_id INT AUTO_INCREMENT PRIMARY KEY,altura VARCHAR(3) NOT NULL,largura VARCHAR(3) NOT NULL,comprimento VARCHAR(3) NOT NULL,paginas VARCHAR(6) NOT NULL,capa_dura BOOLEAN NOT NULL);
-- adding foreign keys
ALTER TABLE Livros ADD CONSTRAINT FOREIGN KEY (Editoras_id) REFERENCES Editoras (id) ON UPDATE  NO ACTION  ON DELETE  CASCADE;
ALTER TABLE Editoras_enderecos ADD CONSTRAINT FOREIGN KEY (Editoras_id) REFERENCES Editoras (id) ON UPDATE  NO ACTION  ON DELETE  CASCADE;
ALTER TABLE Editoras_contatos ADD CONSTRAINT FOREIGN KEY (Enderecos_id) REFERENCES Editoras_enderecos (id) ON UPDATE  NO ACTION  ON DELETE  CASCADE;
ALTER TABLE Tag ADD CONSTRAINT FOREIGN KEY (Generos_id) REFERENCES Generos (id) ON UPDATE  NO ACTION  ON DELETE  CASCADE;
ALTER TABLE Tag ADD CONSTRAINT FOREIGN KEY (Livros_id) REFERENCES Livros (id) ON UPDATE  NO ACTION  ON DELETE  CASCADE;
ALTER TABLE Autoria ADD CONSTRAINT FOREIGN KEY (Livros_id) REFERENCES Livros (id) ON UPDATE  NO ACTION  ON DELETE  CASCADE;
ALTER TABLE Autoria ADD CONSTRAINT FOREIGN KEY (Autores_id) REFERENCES Autores (id) ON UPDATE  NO ACTION  ON DELETE  CASCADE;
ALTER TABLE Caracteristicas_fisicas ADD CONSTRAINT FOREIGN KEY (Livros_id) REFERENCES Livros (id) ON UPDATE  NO ACTION  ON DELETE  CASCADE;
/*
*           Populating Database
*/
--  Gêneros
INSERT INTO Generos (nome,descricao) VALUE ('Medieval','Lorem ipsum dolor sit amet,consectetur adipiscing elit. Vivamus facilisis semper venenatis. In hac habitasse platea dictumst. Class aptent taciti sociosqu ad litora torquent per conubia nostra,per inceptos himenaeos. Nunc sit amet odio erat. Praesent pellentesque nunc eu magna elementum vulputate. Praesent varius gravida purus,vitae accumsan dolor faucibus vel. Morbi congue sapien ac semper venenatis. Etiam scelerisque eros sem,in finibus dui.');
INSERT INTO Generos (nome,descricao) VALUE ('Épico','Lorem ipsum dolor sit amet,consectetur adipiscing elit. Ut quis lacinia lorem. Nunc ut felis a libero consectetur laoreet congue vel enim. Vivamus fermentum quam justo,ut congue ex aliquet ac. Cras ullamcorper erat massa,quis lobortis ante eleifend a.');
INSERT INTO Generos (nome,descricao) VALUE ('Político','Lorem ipsum dolor sit amet,consectetur adipiscing elit. Ut ultrices ornare purus id euismod. In hac habitasse platea dictumst. Vestibulum quis nunc nulla. Curabitur vehicula lobortis neque maximus viverra. Nullam dignissim a ante ut suscipit. Vestibulum mi mi,mollis eget lacus et,efficitur eleifend enim. Proin dictum purus blandit leo euismod,eu mollis tortor sodales. Nulla facilisi. Nullam vel ligula interdum,consequat nunc in,sollicitudin dui. Vivamus ac arcu lectus. Duis vitae.');
INSERT INTO Generos (nome,descricao) VALUE ('Fantasia','Lorem ipsum dolor sit amet,consectetur adipiscing elit. Aenean dignissim dui eget.');
INSERT INTO Generos (nome,descricao) VALUE ('Dramático','Lorem ipsum dolor sit amet,consectetur adipiscing elit. Mauris eu odio dapibus enim rutrum molestie. Nulla aliquet erat nec elit dictum,id fringilla nunc ultrices. In finibus quis nisi id euismod. Donec venenatis.');
--  As Crõnicas de Gelo e Fogo
INSERT INTO Editoras (cnpj,razao_social,nome,fundacao) VALUE ('90375049000111','Editora Suma LTDA','Suma','1985-08-21');
INSERT INTO Editoras_enderecos (Editoras_id,cep,logradouro,numero,bairro,cidade,estado) VALUE (1,'90660230','Rua Antônio Ribeiro','87','Santo Antônio','Porto Alegre','RS');
INSERT INTO Editoras_contatos (Enderecos_id,nome,ddd,numero) VALUE (1,'Telefone Fixo','51','30598715');
INSERT INTO Autores (cpf,nome,pseudonimo,email) VALUE('','','','');
-- Volume 1
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('',,'','','','XXXX-XX-XX','');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (,'','','','',);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (,);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (,);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (,);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (,);
--  Harry Potter
INSERT INTO Editoras (cnpj,razao_social,nome,fundacao) VALUE ('42444703000159','Editora Rocco LTDA','Rocco','1975-03-12');
INSERT INTO Editoras_enderecos (Editoras_id,cep,logradouro,numero,complemento,bairro,cidade,estado) VALUE (2,'20021280','Rua do Passeio','38','Passeio Corporate - Torre 1,11º andar','Centro','Rio de Janeiro','RJ');
INSERT INTO Editoras_contatos (Enderecos_id,nome,ddd,numero,email) VALUE (2,'Telefone Fixo','21','35252000','rocco@rocco.com.br');
INSERT INTO Autores (cpf,nome,pseudonimo,email) VALUE('','','','');
--  Volume 1
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('',,'','','','XXXX-XX-XX','');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (,'','','','',);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (,);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (,);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (,);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (,);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (,);
--  Senhor dos Anéis
INSERT INTO Editoras (cnpj,razao_social,nome,fundacao) VALUE ('22520538000160','Casa dos Livros Editora LTDA','Harper Collins Brasil','2015-04-14');
INSERT INTO Editoras_enderecos (Editoras_id,cep,logradouro,numero,complemento,bairro,cidade,estado) VALUE (3,'25215365','Estrada do Rosario','135','Lt 13 Qd 05','Jardim Primavera','Duque de Caxias','RJ');
INSERT INTO Editoras_contatos (Enderecos_id,nome,ddd,numero,email) VALUE (3,'Telefone Fixo','21','31751030','faleconosco@harpercollins.com.br');
INSERT INTO Autores (cpf,nome,pseudonimo,email) VALUE('','','','');
--  Volume 1
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('',,'','','','XXXX-XX-XX','');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (,'','','','',);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (,);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (,);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (,);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (,);
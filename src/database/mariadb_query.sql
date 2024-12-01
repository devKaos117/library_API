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
INSERT INTO Autores (cpf,nome,pseudonimo,email) VALUE('86822845704','George Raymond Richard Martin','G.R.R.M.','loremipsum@georgerrmartin.com');
-- Volume 1
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788556510785',1,'As Crônicas de Gelo e Fogo','A Guerra dos Tronos','ptBR','2019-03-25','A guerra dos tronos é o primeiro livro da série best-seller internacional As Crônicas de Gelo e Fogo, que deu origem à adaptação de sucesso da HBO, Game of Thrones.\nO verão pode durar décadas. O inverno, toda uma vida. E a guerra dos tronos começou. Como Guardião do Norte, lorde Eddard Stark não fica feliz quando o rei Robert o proclama a nova Mão do Rei. Sua honra o obriga a aceitar o cargo e deixar seu posto em Winterfell para rumar para a corte, onde os homens fazem o que lhes convém, não o que devem... e onde um inimigo morto é algo a ser admirado.\nLonge de casa e com a família dividida, Eddard se vê cada vez mais enredado nas intrigas mortais de Porto Real, sem saber que perigos ainda maiores espreitam a distância.\nNas florestas ao norte de Winterfell, forças sobrenaturais se espalham por trás da Muralha que protege a região. E, nas Cidades Livres, o jovem Rei Dragão exilado na Rebelião de Robert planeja sua vingança e deseja recuperar sua herança de família: o Trono de Ferro de Westeros.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (1,'228','32','156','592',0);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (1,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (1,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (1,3);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (1,4);
-- Volume 2
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788556510792',1,'As Crônicas de Gelo e Fogo','A Fúria dos Reis','ptBR','2019-09-20',' Nesta emocionante sequência de A guerra dos tronos , George R. R. Martin cria uma obra incomparável. A fúria dos reis nos transporta para um mundo de festas e vinganças, feitiçaria e disputas, diferente de tudo que já foi feito.\nUm cometa da cor de fogo e sangue corta os céus. E, da antiga cidadela de Pedra do Dragão às costas áridas de Winterfell, reina o caos.\nEm A fúria dos reis , seis facções disputam o controle de uma terra dividida e o direito de ocupar o Trono de Ferro de Westeros – e estão dispostos a encarar tempestades, levantes e guerras para isso.\nNesta história, irmão trama contra irmão e os mortos se levantam para caminhar pela noite. Aqui, uma princesa se disfarça de menino órfão, um cavaleiro se prepara para encarar uma pérfida feiticeira e bárbaros descem das Montanhas da Lua para saquear os campos.\nEm um contexto de incesto e fratricídio, alquimia e assassinato, a vitória será dos homens e mulheres que possuírem o mais frio aço... e o mais frio coração. Pois, quando se desperta a fúria dos reis, a terra inteira treme.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (2,'230','30','160','648',0);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (2,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (2,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (2,3);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (2,4);
-- Volume 3
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788556510808',1,'As Crônicas de Gelo e Fogo','A Tormenta de Espadas','ptBR','2019-09-20','Este é o terceiro volume da série As Crônicas de Gelo e Fogo, que inclui A guerra dos tronos e A fúria dos reis . Já considerada um clássico, a obra emocionante de George R. R. Martin é um dos maiores feitos da literatura fantástica de todos os tempos.\nO futuro de Westeros está em jogo, e ninguém descansará até que os Sete Reinos tenham explodido em uma verdadeira tormenta de espadas.\nDos cinco pretendentes ao trono, um está morto e outro caiu em desgraça, e ainda assim a guerra continua em toda sua fúria, enquanto alianças são feitas e desfeitas. Joffrey, da Casa Lannister, ocupa o Trono de Ferro, como o instável governante dos Sete Reinos, ao passo que seu rival mais amargo, lorde Stannis, jaz derrotado e enfeitiçado pelas promessas da Mulher Vermelha.\nO jovem Robb, da Casa Stark, ainda comanda o Norte, contudo, e planeja sua batalha contra os Lannister, mesmo que sua irmã seja refém deles em Porto Real. Enquanto isso, Daenerys Targaryen atravessa um continente deixando um rastro de sangue a caminho de Westeros, levando consigo os três únicos dragões existentes em todo o mundo.\nEnquanto forças opostas avançam para uma gigantesca batalha final, um exército de selvagens chega dos confins da civilização. Em seu rastro vem uma horda de terríveis criaturas místicas – os Outros: um batalhão de mortos-vivos cujos corpos são imparáveis.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (3,'230','38','158','832',0);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (3,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (3,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (3,3);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (3,4);
-- Volume 4
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788556510884',1,'As Crônicas de Gelo e Fogo','O Festim dos Corvos','ptBR','2019-11-11','O festim dos corvos é o quarto livro da monumental saga de fantasia As Crônicas de Gelo e Fogo, sucesso internacional que deu origem a Game of Thrones. Neste livro, Martin coloca um reino dilacerado à beira da paz... só para ser lançado de novo rumo ao terror e à destruição.\nHá séculos os sete grandes reinos de Westeros se enfrentam em amargas disputas, batalhas e traições. Agora, com Joffrey Baratheon e Robb Stark fora da jogada e lordes insignificantes competindo pelas Ilhas de Ferro, a guerra que devorou o continente parece ter finalmente chegado ao fim.\nNo entanto, como após todo grande conflito, não demora para que os sobreviventes, os bandidos, os renegados e os carniceiros avancem para disputar o espólio dos mortos. Por toda Westeros os lordes se agitam, formando alianças e fazendo planos, enquanto nomes conhecidos e desconhecidos se apresentam para tomar parte das danças políticas.\nTodos precisam lançar mão de suas habilidades e poderes para encarar os tempos de terror que se aproximam. Nobres e plebeus, soldados e feiticeiros, assassinos e saqueadores devem arriscar suas fortunas... e suas vidas, pois em um festim de corvos, muitos são os convidados ... e poucos os sobreviventes.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (4,'230','26','160','608',0);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (4,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (4,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (4,3);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (4,4);
-- Volume 5
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788556510907',1,'As Crônicas de Gelo e Fogo','A Dança dos Dragões','ptBR','2020-03-25','A dança dos dragões é o quinto livro da saga As Crônicas de Gelo e Fogo, dando continuidade à trama de O festim dos corvos e trazendo personagens novos e conhecidos em disputas acirradas por um reino à beira da ruína.\nÉ outono em Westeros, e a Guerra dos Cinco Reis parece finalmente entrar na reta final. Stannis Baratheon se instala no Norte e jura conquistar o apoio dos senhores da região para continuar sua luta pelo trono, embora seja atrapalhado pela invasão de homens de ferro em grande parte da costa.\nNa Muralha, Jon Snow é eleito o Senhor Comandante da Patrulha da Noite, mas inimigos o cercam de todos os lados, tanto na Patrulha quanto para além da Muralha. Enquanto isso, Tyrion Lannister atravessa o Mar Estreito rumo a Pentos, sem objetivos definidos, sem aliados e cada vez mais sem opções.\nNa Baía dos Escravos, Daenerys Targaryen conquista a cidade de Meereen e decide ficar e governá-la, praticando as habilidades de liderança que serão tão necessárias quando partir para Westeros. No entanto, sua presença já foi notada por muitos senhores nos Sete Reinos, e das Ilhas de Ferro e de Dorne, de Vilavelha e das Cidades Livres, emissários estão a caminho, querendo se unir à sua causa e, se possível, usá-la para os próprios fins.\nEm todos os cantos conflitos ganham vida e traições vêm daqueles mais próximos. Guerreiros, selvagens, nobres e escravos, todos têm pela frente um longo inverno, enquanto destino, ambição e política ditam o ritmo da dança mais perigosa de todas.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (5,'229','40','160','824',0);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (5,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (5,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (5,3);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (5,4);
--  Harry Potter
INSERT INTO Editoras (cnpj,razao_social,nome,fundacao) VALUE ('42444703000159','Editora Rocco LTDA','Rocco','1975-03-12');
INSERT INTO Editoras_enderecos (Editoras_id,cep,logradouro,numero,complemento,bairro,cidade,estado) VALUE (2,'20021280','Rua do Passeio','38','Passeio Corporate - Torre 1,11º andar','Centro','Rio de Janeiro','RJ');
INSERT INTO Editoras_contatos (Enderecos_id,nome,ddd,numero,email) VALUE (2,'Telefone Fixo','21','35252000','rocco@rocco.com.br');
INSERT INTO Autores (cpf,nome,pseudonimo,email) VALUE('22637743603','Joanne Rowling','J.K. Rowling','loremipsum@jkrowling.com');
--  Volume 1
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788532530783',2,'Harry Potter','e a Pedra Filosofal','ptBR','2017-08-19','Harry Potter é um garoto cujos pais, feiticeiros, foram assassinados por um poderosíssimo bruxo quando ele ainda era um bebê. Ele foi levado, então, para a casa dos tios que nada tinham a ver com o sobrenatural. Pelo contrário. Até os 10 anos, Harry foi uma espécie de gata borralheira: maltratado pelos tios, herdava roupas velhas do primo gorducho, tinha óculos remendados e era tratado como um estorvo. No dia de seu aniversário de 11 anos, entretanto, ele parece deslizar por um buraco sem fundo, como o de Alice no país das maravilhas, que o conduz a um mundo mágico. Descobre sua verdadeira história e seu destino: ser um aprendiz de feiticeiro até o dia em que terá que enfrentar a pior força do mal, o homem que assassinou seus pais. O menino de olhos verde, magricela e desengonçado, tão habituado à rejeição, descobre, também, que é um herói no universo dos magos. Potter fica sabendo que é a única pessoa a ter sobrevivido a um ataque do tal bruxo do mal e essa é a causa da marca em forma de raio que ele carrega na testa. Ele não é um garoto qualquer, ele sequer é um feiticeiro qualquer ele é Harry Potter, símbolo de poder, resistência e um líder natural entre os sobrenaturais. A fábula, recheada de fantasmas, paredes que falam, caldeirões, sapos, unicórnios, dragões e gigantes, não é, entretanto, apenas um passatempo.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (6,'230','18','160','208',1);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (6,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (6,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (6,4);
--  Volume 2
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788532530790',2,'Harry Potter','e a Câmara Secreta','ptBR','2017-08-19','Depois de férias aborrecidas na casa dos tios trouxas, está na hora de Harry Potter voltar a estudar. Coisas acontecem, no entanto, para dificultar o regresso de Harry. Persistente e astuto, o herói não se deixa intimidar pelos obstáculos e, com a ajuda dos fiéis amigos Weasley, começa o ano letivo na Escola de Magia e Bruxaria de Hogwarts. As novidades não são poucas. Novos colegas, novos professores, muitas e boas descobertas e um grande e perigosos desafio. Alguém ou alguma coisa ameaça a segurança e a tranquilidade dos membros de Hogwarts.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (7,'230','18','160','224',1);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (7,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (7,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (7,4);
--  Volume 3
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788532530806',2,'Harry Potter','e o Prisioneiro de Azkaban','ptBR','2017-08-19','As aulas estão de volta à Hogwarts e Harry Potter não vê a hora de embarcar no expresso a vapor que o levará de volta à escola de bruxaria. Mais uma vez suas férias na rua dos Alfeneiros foi triste e solitária. Com muita ação, humor e magia, Harry Potter e o prisioneiro de Azkaban traz de volta o gigante atrapalhado Rúbeo Hagrid, o sábio diretor Alvo Dumbledore, a exigente professora de transformação Minerva MacGonagall e o novo mestre Lupin, que guarda grandes surpresas para Harry.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (8,'230','20','160','288',1);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (8,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (8,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (8,4);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (8,5);
--  Volume 4
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788532530813',2,'Harry Potter','e o Cálice de Fogo','ptBR','2017-08-19','Nesta aventura, o feiticeiro cresceu e está com 14 anos. O início do ano letivo de Harry Potter reserva muitas emoções, mágicas, e acontecimentos inesperados, além de um novo torneio em que os alunos de Hogwarts terão de demonstrar todas as habilidade mágicas e nãomágicas que vêm adquirindo ao longo de suas vidas. Harry é escolhido pelo Cálice de Fogo para competir como um dos campeões de Hogwarts, tendo ao lado seus fiéis amigos. Muitos desafios, feitiços, poções e confusões estão reservados para Harry. Além disso, ele terá que lidar ainda com os problemas comuns da adolescência amor, amizade, aceitação e rejeição.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (9,'230','32','154','480',1);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (9,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (9,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (9,4);
--  Volume 5
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788532530820',2,'Harry Potter','e a Ordem da Fênix','ptBR','2017-08-19','Harry não é mais um garoto. Aos 15 anos, continua sofrendo a rejeição dos Dursdley, sua estranha família no mundo dos trouxas. Também continua contando com Rony Weasley e Hermione Granger, seus melhores amigos em Hogwarts, para levar adiante suas investigações e aventuras. Mas o bruxinho começa a sentir e descobrir coisas novas, como o primeiro amor e a sexualidade. Nos volumes anteriores, J. K. Rowling mostrou como Harry foi transformado em celebridade no mundo da magia por ter derrotado, ainda bebê, Voldemort, o todopoderoso bruxo das trevas que assassinou seus pais. Neste quinto livro da saga, o protagonista, numa crise típica da adolescência, tem ataques de mau humor com a perseguição da imprensa, que o segue por todos os lugares e chega a inventar declarações que nunca deu. Harry vai enfrentar as investidas de Voldemort sem a proteção de Dumbledore, já que o diretor de Hogwarts é afastado da escola. E vai ser sem a ajuda de seu protetor que o jovem herói enfrentará descobertas sobre a personalidade controversa de seu pai, Tiago Potter, e a morte de alguém muito próximo.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (10,'230','40','164','640',1);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (10,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (10,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (10,4);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (10,5);
--  Volume 6
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788532530837',2,'Harry Potter','e o Enigma do Príncipe','ptBR','2017-08-19','Harry Potter e o enigma do príncipe dá continuidade à saga do jovem bruxo Harry Potter a partir do ponto em que o livro anterior parou o momento em que fica provado que o poder de Voldemort e dos Comensais da Morte, seus seguidores, cresce mais a cada dia, em meio à batalha entre o bem e o mal. A onda de terror provocada pelo Lorde das Trevas estaria afetando, até mesmo, o mundo dos trouxas (nãobruxos), e sendo agravada pela ação dos dementadores, criaturas mágicas aterrorizantes que sugam a esperança e a felicidade das pessoas. Harry, que acabou de completar 16 anos, parte rumo ao sexto ano na Escola de Magia e Bruxaria de Hogwarts, animado e ao mesmo tempo apreensivo com a perspectiva de ter aulas particulares com o professor Dumbledore, o diretor da escola e o bruxo mais respeitado em toda comunidade mágica. Harry, longe de ser aquele menino magricela que vivia no quarto debaixo da escada na casa dos tios trouxas, é um dos principais nomes entre aqueles que lutam contra Voldemort, e se vê cada vez mais isolado à medida que os rumores de que ele é O Eleito o único capaz de derrotar o Lorde das Trevas, se espalham pelo mundo dos bruxos. Dois atentados contra a vida de estudantes, a certeza de Harry quanto ao envolvimento de Draco Malfoy com os Comensais da Morte e o comportamento de Snape, suspeito como sempre, adicionam ainda mais tensão ao já inquietante período. Apesar de tudo isso, Harry e os amigos são adolescentes típicos dividem tarefas escolares e dormitórios bagunçados, correm das aulas para os treinos de quadribol, e namoram.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (11,'230','30','158','432',1);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (11,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (11,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (11,4);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (11,5);
--  Volume 7
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788532530844',2,'Harry Potter','e as Relíquias da Morte','ptBR','2017-08-19','Harry Potter e as relíquias da morte, de J.K. Rowling, é o sétimo e último livro da série. Voldemorte está cada vez mais forte e Harry Potter precisa encontrar e aniquilar as Horcruxes para enfraquecer o lorde e poder enfrentálo. Nessa busca desenfreada, contando apenas com os amigos Rony e Hermione, Harry descobre as Relíquias da Morte, que serão úteis na batalha do bem contra o mal.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (12,'230','34','154','512',1);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (12,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (12,2);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (12,4);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (12,5);
--  Senhor dos Anéis
INSERT INTO Editoras (cnpj,razao_social,nome,fundacao) VALUE ('22520538000160','Casa dos Livros Editora LTDA','Harper Collins Brasil','2015-04-14');
INSERT INTO Editoras_enderecos (Editoras_id,cep,logradouro,numero,complemento,bairro,cidade,estado) VALUE (3,'25215365','Estrada do Rosario','135','Lt 13 Qd 05','Jardim Primavera','Duque de Caxias','RJ');
INSERT INTO Editoras_contatos (Enderecos_id,nome,ddd,numero,email) VALUE (3,'Telefone Fixo','21','31751030','faleconosco@harpercollins.com.br');
INSERT INTO Autores (cpf,nome,pseudonimo,email) VALUE('49651536853','John Ronald Reuel Tolkien','J.R.R. Tolkien','died_before_emails@loremipsum.com');
--  Volume 1
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788595084759',3,'O Senhor dos Anéis','A Sociedade do Anel','ptBR','2019-11-25','O volume inicial de O Senhor dos Anéis, lançado originalmente em julho de 1954, foi o primeiro grande épico de fantasia moderno, conquistando milhões de leitores e se tornando o padrão de referência para todas as outras obras do gênero até hoje. A imaginação prodigiosa de J.R.R. Tolkien e seu conhecimento profundo das antigas mitologias da Europa permitiram que ele criasse um universo tão complexo e convincente quanto o mundo real.\nA Sociedade do Anel começa no Condado, a região rural do oeste da Terra-média onde vivem os diminutos e pacatos hobbits. Bilbo Bolseiro, um dos raros aventureiros desse povo, cujas peripécias foram contadas em O Hobbit, resolve ir embora do Condado e deixa sua considerável herança nas mãos de seu jovem parente Frodo.\nO mais importante legado de Bilbo é o anel mágico que costumava usar para se tornar invisível. No entanto, o mago Gandalf, companheiro de aventuras do velho hobbit, revela a Frodo que o objeto é o Um Anel, a raiz do poder demoníaco de Sauron, o Senhor Sombrio, que deseja escravizar todos os povos da Terra-média. A única maneira de eliminar a ameaça de Sauron é destruir o Um Anel nas entranhas da própria montanha de fogo onde foi forjado.\nA revelação faz com que Frodo e seus companheiros hobbits Sam, Merry e Pippin deixem a segurança do Condado e iniciem uma perigosa jornada rumo ao leste. Ao lado de representantes dos outros Povos Livres que resistem ao Senhor Sombrio, eles formam a Sociedade do Anel.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (13,'214','34','142','576',1);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (13,3);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (13,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (13,4);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (13,5);
--  Volume 2
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788595084766',3,'O Senhor dos Anéis','As Duas Torres','ptBR','2019-11-25','O segundo volume de O Senhor dos Anéis, mais importante épico de fantasia moderno, narra os caminhos separados seguidos pelos membros da Sociedade do Anel em sua luta para deter Sauron, o Senhor Sombrio da terra de Mordor, e destruir o Um Anel, no qual está contida a maior parte do poder do tirano demoníaco imaginado por J.R.R. Tolkien.\nUm ataque-surpresa pôs fim à jornada conjunta da Sociedade do Anel. De um lado, o trio formado pelo elfo Legolas, pelo anão Gimli e por Aragorn, herdeiro da realeza dos Homens, tenta resgatar os jovens hobbits Merry e Pippin, capturados por guerreiros-órquicos. A busca pelos companheiros perdidos levará os três a confrontar os cavaleiros do reino de Rohan e o mago renegado Saruman, que também deseja o Um Anel para si.\nEnquanto isso, do outro lado das montanhas, Frodo e Sam buscam uma maneira de entrar em Mordor e chegar até a montanha onde o Anel foi forjado, único lugar onde é possível destruí-lo. Para isso, acabam recebendo a ajuda de seu mais improvável aliado: Gollum, a criatura que chegou a ter o Anel sob seu poder durante centenas de anos e que ainda é devorada, em corpo e alma, pelo desejo de voltar a possuí-lo.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (14,'214','28','142','464',1);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (14,3);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (14,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (14,4);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (14,5);
--  Volume 3
INSERT INTO Livros (isbn13,Editoras_id,titulo,subtitulo,idioma,lancamento,descricao) VALUE('9788595084773',3,'O Senhor dos Anéis','O Retorno do Rei','ptBR','2019-11-25','A guerra entre os Povos Livres da Terra-média e Sauron, o Senhor Sombrio da terra de Mordor, chega a seu clímax neste terceiro volume do romance O Senhor dos Anéis. As batalhas grandiosas que estão prestes a acontecer, no entanto, são apenas o pano de fundo para o verdadeiro drama: a missão quase suicida dos hobbits Frodo e Sam, que tentam destruir o Um Anel, fonte do poder de Sauron, infiltrando-se no coração do território do Inimigo.\nEm O Retorno do Rei, acompanhamos o mago Gandalf e o hobbit Pippin em sua visita à a majestosa cidade de Minas Tirith, que já foi o principal baluarte dos Homens contra a ameaça de Sauron, mas que está prestes a sucumbir diante da força avassaladora do Senhor Sombrio. Outros membros da Sociedade do Anel se juntam a Aragorn, herdeiro da longa linhagem dos reis de Minas Tirith, na tentativa de evitar que a antiga capital do reino de Gondor seja destruída.\nNas fronteiras de Mordor, Sam resgata Frodo, e os dois hobbits partem para o último estágio de sua jornada rumo ao Monte da Perdição, uma jornada que testará os limites do corpo e da mente dos pequenos heróis. O livro inclui ainda numerosos apêndices, nos quais Tolkien explora detalhes da história, das línguas, dos alfabetos e até dos calendários de seu mundo ficcional.');
INSERT INTO Caracteristicas_fisicas (Livros_id,altura,largura,comprimento,paginas,capa_dura) VALUE (15,'214','34','138','528',1);
INSERT INTO Autoria (Livros_id,Autores_id) VALUE (15,3);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (15,1);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (15,4);
INSERT INTO Tag (Livros_id,Generos_id) VALUE (15,5);

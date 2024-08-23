create database recuperacao; 
use recuperacao;

create table cidade(id int(2) primary key auto_increment, nome varchar(60));
select * from cidade;

create table estado(id int(2) primary key auto_increment, nome varchar(2));
 select * from estado;
 
create table equipe(id int(2) primary key auto_increment, nome varchar(100), ano_fundacao int(4),cidade varchar(100),  estadio varchar(100));
select * from equipe
where nome like '%Barcelona%';


create table jogador(

idJogador int(2) primary key auto_increment,
    nome varchar(100),
    data_nascimento date,
    posicao varchar(50),
    idEquipe INT(2),
    constraint fk_equipe foreign key (idEquipe) references equipe(id)

);
select * from jogador;
 
create table competicao (
idCompeticao int(2) primary key auto_increment,
    nome varchar(100),
    ano int(4),
    tipo varchar(50),
    premio varchar(100)

);
 select * from competicao;
 
create table partida (
    idPartida int(2) primary key auto_increment,
    data date,
    hora time,
    idCompeticao int(2),
    idEquipe_Casa int(2),
    idEquipe_Visitante int(2),
    placar_Equipe_Casa int,
    placar_Equipe_Visitante int,
    constraint fk_competicao foreign key (idCompeticao) references competicao(idCompeticao),
    constraint fk_equipe_casa foreign key (idEquipe_casa) references equipe(id),
    constraint fk_equipe_visitante foreign key (idEquipe_visitante) references equipe(id)
);
select * from partida
where data between '2024-08-25' and '2024-08-27';

 
create table desempenho (
    idDesempenho int(2) primary key auto_increment,
    idJogador int(2),
    idPartida int(2),
    gols int,
    assistencias int,
    cartoes_amarelos int,
    cartoes_vermelhos int,
    constraint fk_jogador foreign key (idJogador) references jogador(idJogador),
    constraint fk_partida foreign key (idPartida) references partida(idPartida)
);
select * from desempenho;

-- Filtrar partidas onde a soma dos placares é maior que 3
select *, (placar_Equipe_Casa + placar_Equipe_Visitante) as total_placar
from partida
where (placar_Equipe_Casa + placar_Equipe_Visitante) > 3;

-- Filtrar equipes cujo nome contém 'Barcelona'
select * from equipe
where nome like '%Barcelona%';


-- -------------------------------------------------------------------------------------------------
INSERT INTO cidade (nome) VALUES ('São Paulo');
INSERT INTO cidade (nome) VALUES ('Campinas');
INSERT INTO cidade (nome) VALUES ('Poços de Caldas');
INSERT INTO cidade (nome) VALUES ('Andradas');
INSERT INTO cidade (nome) VALUES ('Rio de Janeiro');

INSERT INTO estado (nome) VALUES ('SP');
INSERT INTO estado (nome) VALUES ('MG');
INSERT INTO estado (nome) VALUES ('RJ');
INSERT INTO estado (nome) VALUES ('ES');
INSERT INTO estado (nome) VALUES ('MS');

INSERT INTO equipe (nome, ano_fundacao, cidade, estadio) VALUES ('FC Barcelona', 1899, 'Barcelona', 'Camp Nou');
INSERT INTO equipe (nome, ano_fundacao, cidade, estadio) VALUES ('Real Madrid', 1902, 'Madrid', 'Santiago Bernabéu');
INSERT INTO equipe (nome, ano_fundacao, cidade, estadio) VALUES ('Manchester United', 1878, 'Manchester', 'Old Trafford');
INSERT INTO equipe (nome, ano_fundacao, cidade, estadio) VALUES ('Juventus', 1897, 'Turin', 'Allianz Stadium');

INSERT INTO jogador (nome, data_nascimento, posicao, idEquipe) VALUES ('Lionel Messi', '1987-06-24', 'Atacante', 1);
INSERT INTO jogador (nome, data_nascimento, posicao, idEquipe) VALUES ('Cristiano Ronaldo', '1985-02-05', 'Atacante', 2);
INSERT INTO jogador (nome, data_nascimento, posicao, idEquipe) VALUES ('Paul Pogba', '1993-03-15', 'Meio-campo', 3);
INSERT INTO jogador (nome, data_nascimento, posicao, idEquipe) VALUES ('Paulo Dybala', '1993-11-15', 'Atacante', 4);

INSERT INTO competicao (nome, ano, tipo, premio) VALUES ('La Liga', 2024, 'Campeonato Nacional', 'Troféu La Liga');
INSERT INTO competicao (nome, ano, tipo, premio) VALUES ('Champions League', 2024, 'Copa Internacional', 'Troféu Champions League');
INSERT INTO competicao (nome, ano, tipo, premio) VALUES ('Premier League', 2024, 'Campeonato Nacional', 'Troféu Premier League');
INSERT INTO competicao (nome, ano, tipo, premio) VALUES ('Serie A', 2024, 'Campeonato Nacional', 'Troféu Serie A');

INSERT INTO partida (data, hora, idCompeticao, idEquipe_Casa, idEquipe_Visitante, placar_Equipe_Casa, placar_Equipe_Visitante) VALUES ('2024-08-25', '16:00:00', 1, 1, 2, 2, 1);
INSERT INTO partida (data, hora, idCompeticao, idEquipe_Casa, idEquipe_Visitante, placar_Equipe_Casa, placar_Equipe_Visitante) VALUES ('2024-08-26', '20:00:00', 2, 3, 4, 1, 3);
INSERT INTO partida (data, hora, idCompeticao, idEquipe_Casa, idEquipe_Visitante, placar_Equipe_Casa, placar_Equipe_Visitante) VALUES ('2024-08-27', '18:00:00', 3, 1, 3, 2, 2);
INSERT INTO partida (data, hora, idCompeticao, idEquipe_Casa, idEquipe_Visitante, placar_Equipe_Casa, placar_Equipe_Visitante) VALUES ('2024-08-28', '15:00:00', 4, 2, 4, 1, 0);

INSERT INTO desempenho (idJogador, idPartida, gols, assistencias, cartoes_amarelos, cartoes_vermelhos) VALUES (1, 1, 1, 0, 0, 0);
INSERT INTO desempenho (idJogador, idPartida, gols, assistencias, cartoes_amarelos, cartoes_vermelhos) VALUES (2, 2, 2, 1, 0, 0);
INSERT INTO desempenho (idJogador, idPartida, gols, assistencias, cartoes_amarelos, cartoes_vermelhos) VALUES (3, 3, 0, 1, 1, 0);
INSERT INTO desempenho (idJogador, idPartida, gols, assistencias, cartoes_amarelos, cartoes_vermelhos) VALUES (4, 4, 1, 0, 0, 0);



create table Autor 
(
    IDAutor              varchar(15) not null,
    Nome                 varchar(50),
    Nacionalidade        varchar(25),
    primary key (IDAutor)
);

create table Autoria 
(
    IDLivro              integer       not null,
    IDAutor              varchar(15)   not null,
    primary key (IDLivro, IDAutor)
);

create  index AUTORIA_FK on Autoria (
IDLivro ASC
);

create  index AUTORIA_FK2 on Autoria (
IDAutor ASC
);

create table Livro 
(
    IDLivro              integer    not null,
    Titulo               varchar(100),
    Editora              varchar(30),
    Edicao               integer,
    Ano                  integer    not null,
    primary key (IDLivro)
);

alter table Autoria
   add foreign key FK_AUTORIA_AUTORIA_AUTOR (IDAutor)
      references Autor (IDAutor)
      on update restrict
      on delete restrict;

alter table Autoria
   add foreign key FK_AUTORIA_AUTORIA_LIVRO (IDLivro)
      references Livro (IDLivro)
      on update restrict
      on delete restrict;


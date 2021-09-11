CREATE TABLE Docente 
(
    ID_DOCENTE NUMERIC PRIMARY KEY NOT NULL,
    Nome_Docente VARCHAR2(45)NOT NULL,       
    Genero_Docente VARCHAR2(10)NOT NULL,
    Idade_Docente NUMERIC(3)NOT NULL,
    Titulacao_Docente VARCHAR2(10)NOT NULL
    
); 


CREATE TABLE Datas_Posses 
(
    Id_Data NUMERIC PRIMARY KEY NOT NULL,
    Data_entrada DATE,
    Data_saida DATE
);

CREATE TABLE posse 
(
    ID_Posse NUMERIC PRIMARY KEY NOT NULL,
    fk_Docente_Id_Docente NUMERIC,
    fk_datas_posses_Id_Data NUMERIC,
    FOREIGN KEY (fk_Docente_Id_Docente) REFERENCES Docente (Id_Docente),
    FOREIGN KEY (fk_datas_posses_Id_Data) REFERENCES datas_posses (Id_Data)
);


CREATE TABLE Area_conhecimento (
    Id_Area NUMERIC PRIMARY KEY NOT NULL,
    Nome_Area VARCHAR2(50)NOT NULL,
    Categoria_Area VARCHAR2(20)NOT NULL,
    fk_Docente_Id_Docente NUMERIC,
    FOREIGN KEY (fk_Docente_Id_Docente) REFERENCES Docente (Id_Docente)
);


CREATE TABLE Midias_sociais (
    Id_Midia NUMERIC PRIMARY KEY NOT NULL,
    Endereco_Midia VARCHAR(100)NOT NULL,
    fk_Docente_Id_Docente NUMERIC,
    FOREIGN KEY (fk_Docente_Id_Docente) REFERENCES Docente (Id_Docente)
);

CREATE TABLE Login (
    Id_Login NUMERIC PRIMARY KEY NOT NULL,
    Ip_Login VARCHAR2(50) NOT NULL,
    Status_Login VARCHAR(15) NOT NULL
);

CREATE TABLE Atividades 
(
    Id_Atividade NUMERIC PRIMARY KEY NOT NULL,
    fk_Login_Id_Login NUMERIC,
    fk_Docente_Id_Docente NUMERIC,
    FOREIGN KEY (fk_Login_Id_Login)REFERENCES Login (Id_Login),
    FOREIGN KEY (fk_Docente_Id_Docente) REFERENCES Docente (Id_Docente)
);

CREATE TABLE Revistas_e_congressos (
    Id_Participacoes NUMERIC PRIMARY KEY NOT NULL,
    Congresso_Nacional NUMERIC,
    Congresso_internacional NUMERIC,
    Revistas_Nacionais NUMERIC,
    Revistas_Internacionais NUMERIC
);

CREATE TABLE Leciona_Congressos_revista 
(
    Id_Leciona NUMERIC PRIMARY KEY NOT NULL,
    fk_id_Participações NUMERIC,
    fk_Docente_Id_Docente NUMERIC,
    FOREIGN KEY (fk_id_Participações) REFERENCES Revistas_e_congressos (Id_Participacoes),
    FOREIGN KEY (fk_Docente_Id_Docente) REFERENCES Docente (Id_Docente)
);


CREATE TABLE Categoria (
    Id_Categoria NUMERIC PRIMARY KEY,
    Nome_Categoria VARCHAR2(20),
    Relevancia_Categoria VARCHAR2(5)    
   );

CREATE TABLE Artigo (
    Id_Artigo NUMERIC PRIMARY KEY,
    Nome_Artigo VARCHAR2(50),
    Tipo_Artigo VARCHAR2(30),
    Data_Publicacao DATE,
    Descricao_Artigo VARCHAR2(60),
    fk_Categoria_Id NUMERIC,
    FOREIGN KEY (fk_Categoria_Id)   REFERENCES Categoria (Id_Categoria)    
   );


CREATE TABLE Publicação (
    Id_Publicação NUMERIC PRIMARY KEY,
    Nome_Docentes VARCHAR2(100),
    fk_Artigo_Id NUMERIC,
    fk_Docente_Id NUMERIC,   
    FOREIGN KEY (fk_Artigo_Id)   REFERENCES Artigo (Id_Artigo),
    FOREIGN KEY (fk_Docente_Id)   REFERENCES Docente (Id_Docente)    
   );
   
   






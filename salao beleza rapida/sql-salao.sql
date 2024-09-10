CREATE TABLE Usuario (
    id_usuario INTEGER,
    telefone CHARACTER,
    cpf CHARACTER,
    senha CHARACTER,
    email CHARACTER,
    data_hora DATETIME,
    id_cadastro INTEGER,
    id_usuario_cliente INTEGER,
    id_usuario_administrador INTEGER,
    PRIMARY KEY (id_usuario, id_usuario_cliente, id_usuario_administrador)
);

CREATE TABLE Feedback (
    id_usuario_cliente INTEGER,
    data_hora DATETIME,
    id_comentario INTEGER,
    comentario CHARACTER,
    fk_Usuario_id_usuario INTEGER,
    fk_Usuario_id_usuario_cliente INTEGER,
    fk_Usuario_id_usuario_administrador INTEGER,
    PRIMARY KEY (id_usuario_cliente, id_comentario)
);

CREATE TABLE Servico (
    id_servico INTEGER PRIMARY KEY,
    id_usuario_cliente INTEGER,
    id_usuario_administrador INTEGER
);

CREATE TABLE Lista_de_Servicos (
    id_item_servico INTEGER PRIMARY KEY
);

CREATE TABLE Lista_servicos (
    id_servico INTEGER,
    id_item_servico INTEGER,
    fk_Lista_de_Servicos_id_item_servico INTEGER,
    fk_Servico_id_servico INTEGER,
    PRIMARY KEY (id_servico, id_item_servico)
);

CREATE TABLE Usuario_Servico (
    fk_Usuario_id_usuario INTEGER,
    fk_Usuario_id_usuario_cliente INTEGER,
    fk_Usuario_id_usuario_administrador INTEGER,
    fk_Servico_id_servico INTEGER
);

CREATE TABLE Agenda_Servico_Usuario (
    fk_Servico_id_servico INTEGER,
    fk_Usuario_id_usuario INTEGER,
    fk_Usuario_id_usuario_cliente INTEGER,
    fk_Usuario_id_usuario_administrador INTEGER
);
 
ALTER TABLE Feedback ADD CONSTRAINT FK_Feedback_2
    FOREIGN KEY (fk_Usuario_id_usuario, fk_Usuario_id_usuario_cliente, fk_Usuario_id_usuario_administrador)
    REFERENCES Usuario (id_usuario, id_usuario_cliente, id_usuario_administrador)
    ON DELETE CASCADE;
 
ALTER TABLE Lista_servicos ADD CONSTRAINT FK_Lista_servicos_2
    FOREIGN KEY (fk_Lista_de_Servicos_id_item_servico)
    REFERENCES Lista_de_Servicos (id_item_servico);
 
ALTER TABLE Lista_servicos ADD CONSTRAINT FK_Lista_servicos_3
    FOREIGN KEY (fk_Servico_id_servico)
    REFERENCES Servico (id_servico);
 
ALTER TABLE Usuario_Servico ADD CONSTRAINT FK_Usuario_Servico_1
    FOREIGN KEY (fk_Usuario_id_usuario, fk_Usuario_id_usuario_cliente, fk_Usuario_id_usuario_administrador)
    REFERENCES Usuario (id_usuario, id_usuario_cliente, id_usuario_administrador)
    ON DELETE RESTRICT;
 
ALTER TABLE Usuario_Servico ADD CONSTRAINT FK_Usuario_Servico_2
    FOREIGN KEY (fk_Servico_id_servico)
    REFERENCES Servico (id_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE Agenda_Servico_Usuario ADD CONSTRAINT FK_Agenda_Servico_Usuario_1
    FOREIGN KEY (fk_Servico_id_servico)
    REFERENCES Servico (id_servico)
    ON DELETE NO ACTION;
 
ALTER TABLE Agenda_Servico_Usuario ADD CONSTRAINT FK_Agenda_Servico_Usuario_2
    FOREIGN KEY (fk_Usuario_id_usuario, fk_Usuario_id_usuario_cliente, fk_Usuario_id_usuario_administrador)
    REFERENCES Usuario (id_usuario, id_usuario_cliente, id_usuario_administrador)
    ON DELETE RESTRICT;
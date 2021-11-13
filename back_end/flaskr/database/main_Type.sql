create table Type
(
    TypeName char(8) not null
        primary key,
    Category char(8)
);

INSERT INTO Type (TypeName, Category) VALUES ('???', null);
INSERT INTO Type (TypeName, Category) VALUES ('Bug', 'Physical');
INSERT INTO Type (TypeName, Category) VALUES ('Dark', 'Special');
INSERT INTO Type (TypeName, Category) VALUES ('Dragon', 'Special');
INSERT INTO Type (TypeName, Category) VALUES ('Electric', 'Special');
INSERT INTO Type (TypeName, Category) VALUES ('Fighting', 'Physical');
INSERT INTO Type (TypeName, Category) VALUES ('Fire', 'Special');
INSERT INTO Type (TypeName, Category) VALUES ('Flying', 'Physical');
INSERT INTO Type (TypeName, Category) VALUES ('Ghost', 'Physical');
INSERT INTO Type (TypeName, Category) VALUES ('Grass', 'Special');
INSERT INTO Type (TypeName, Category) VALUES ('Ground', 'Physical');
INSERT INTO Type (TypeName, Category) VALUES ('Ice', 'Special');
INSERT INTO Type (TypeName, Category) VALUES ('Normal', 'Physical');
INSERT INTO Type (TypeName, Category) VALUES ('Poison', 'Physical');
INSERT INTO Type (TypeName, Category) VALUES ('Psychic', 'Special');
INSERT INTO Type (TypeName, Category) VALUES ('Rock', 'Physical');
INSERT INTO Type (TypeName, Category) VALUES ('Steel', 'Physical');
INSERT INTO Type (TypeName, Category) VALUES ('Water', 'Special');
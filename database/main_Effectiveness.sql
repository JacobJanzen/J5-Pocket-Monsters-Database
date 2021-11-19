create table Effectiveness
(
    Attacker char(8) not null
        references Type,
    Defender char(8) not null
        references Type,
    Quality  Float not null,
    primary key (Attacker, Defender)
);

INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Fire', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Grass', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Rock', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Steel', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('???', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Dark', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Fighting', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Fire', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Flying', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Ghost', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Grass', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Poison', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Psychic', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Rock', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Steel', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Bug', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Dark', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Fighting', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Fire', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Ghost', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Grass', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Psychic', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Rock', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Steel', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dark', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Dragon', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Fire', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Grass', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Rock', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Steel', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Dragon', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Dragon', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Electric', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Fire', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Flying', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Grass', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Ground', 0);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Rock', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Steel', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Electric', 'Water', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Bug', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Dark', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Fire', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Flying', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Ghost', 0);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Grass', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Ice', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Normal', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Poison', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Psychic', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Rock', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Steel', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fighting', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Bug', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Dragon', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Fire', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Grass', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Ice', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Rock', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Steel', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Fire', 'Water', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Bug', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Electric', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Fighting', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Fire', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Grass', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Rock', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Steel', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Flying', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Dark', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Fire', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Ghost', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Grass', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Normal', 0);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Psychic', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Rock', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Steel', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ghost', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Bug', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Dragon', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Fire', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Flying', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Grass', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Ground', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Poison', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Rock', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Steel', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Grass', 'Water', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Bug', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Electric', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Fire', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Flying', 0);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Grass', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Poison', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Rock', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Steel', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ground', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Dragon', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Fire', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Flying', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Grass', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Ground', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Ice', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Rock', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Steel', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Ice', 'Water', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Fire', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Ghost', 0);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Grass', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Rock', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Steel', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Normal', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Fire', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Ghost', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Grass', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Ground', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Poison', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Rock', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Steel', 0);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Poison', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Dark', 0);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Fighting', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Fire', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Grass', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Poison', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Psychic', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Rock', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Steel', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Psychic', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Bug', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Fighting', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Fire', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Flying', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Grass', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Ground', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Ice', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Rock', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Steel', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Rock', 'Water', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Dragon', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Electric', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Fire', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Grass', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Ground', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Ice', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Rock', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Steel', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Steel', 'Water', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', '???', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Bug', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Dark', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Dragon', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Electric', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Fighting', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Fire', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Flying', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Ghost', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Grass', 0.5);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Ground', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Ice', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Normal', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Poison', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Psychic', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Rock', 2);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Steel', 1);
INSERT INTO Effectiveness (Attacker, Defender, Quality) VALUES ('Water', 'Water', 0.5);

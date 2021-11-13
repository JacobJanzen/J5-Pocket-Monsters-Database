create table HM
(
    MoveName char(16) not null
        primary key
        references Move
            on delete cascade,
    Number   integer
);

INSERT INTO HM (MoveName, Number) VALUES ('Cut', 1);
INSERT INTO HM (MoveName, Number) VALUES ('Dive', 8);
INSERT INTO HM (MoveName, Number) VALUES ('Flash', 5);
INSERT INTO HM (MoveName, Number) VALUES ('Fly', 2);
INSERT INTO HM (MoveName, Number) VALUES ('Rock Smash', 6);
INSERT INTO HM (MoveName, Number) VALUES ('Strength', 4);
INSERT INTO HM (MoveName, Number) VALUES ('Surf', 3);
INSERT INTO HM (MoveName, Number) VALUES ('Waterfall', 7);
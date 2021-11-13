create table TM
(
    MoveName char(16) not null
        primary key
        references Move
            on delete cascade,
    Number   integer
);

INSERT INTO TM (MoveName, Number) VALUES ('Aerial Ace', 40);
INSERT INTO TM (MoveName, Number) VALUES ('Attract', 45);
INSERT INTO TM (MoveName, Number) VALUES ('Blizzard', 14);
INSERT INTO TM (MoveName, Number) VALUES ('Brick Break', 31);
INSERT INTO TM (MoveName, Number) VALUES ('Bulk Up', 8);
INSERT INTO TM (MoveName, Number) VALUES ('Bullet Seed', 9);
INSERT INTO TM (MoveName, Number) VALUES ('Calm Mind', 4);
INSERT INTO TM (MoveName, Number) VALUES ('Dig', 28);
INSERT INTO TM (MoveName, Number) VALUES ('Double Team', 32);
INSERT INTO TM (MoveName, Number) VALUES ('Dragon Claw', 2);
INSERT INTO TM (MoveName, Number) VALUES ('Earthquake', 26);
INSERT INTO TM (MoveName, Number) VALUES ('Facade', 42);
INSERT INTO TM (MoveName, Number) VALUES ('Fire Blast', 38);
INSERT INTO TM (MoveName, Number) VALUES ('Flamethrower', 35);
INSERT INTO TM (MoveName, Number) VALUES ('Focus Punch', 1);
INSERT INTO TM (MoveName, Number) VALUES ('Frustration', 21);
INSERT INTO TM (MoveName, Number) VALUES ('Giga Drain', 19);
INSERT INTO TM (MoveName, Number) VALUES ('Hail', 7);
INSERT INTO TM (MoveName, Number) VALUES ('Hidden Power', 10);
INSERT INTO TM (MoveName, Number) VALUES ('Hyper Beam', 15);
INSERT INTO TM (MoveName, Number) VALUES ('Ice Beam', 13);
INSERT INTO TM (MoveName, Number) VALUES ('Iron Tail', 23);
INSERT INTO TM (MoveName, Number) VALUES ('Light Screen', 16);
INSERT INTO TM (MoveName, Number) VALUES ('Overheat', 50);
INSERT INTO TM (MoveName, Number) VALUES ('Protect', 17);
INSERT INTO TM (MoveName, Number) VALUES ('Psychic', 29);
INSERT INTO TM (MoveName, Number) VALUES ('Rain Dance', 18);
INSERT INTO TM (MoveName, Number) VALUES ('Reflect', 33);
INSERT INTO TM (MoveName, Number) VALUES ('Rest', 44);
INSERT INTO TM (MoveName, Number) VALUES ('Return', 27);
INSERT INTO TM (MoveName, Number) VALUES ('Roar', 5);
INSERT INTO TM (MoveName, Number) VALUES ('Rock Tomb', 39);
INSERT INTO TM (MoveName, Number) VALUES ('Safeguard', 20);
INSERT INTO TM (MoveName, Number) VALUES ('Sandstorm', 37);
INSERT INTO TM (MoveName, Number) VALUES ('Secret Power', 43);
INSERT INTO TM (MoveName, Number) VALUES ('Shadow Ball', 30);
INSERT INTO TM (MoveName, Number) VALUES ('Shock Wave', 34);
INSERT INTO TM (MoveName, Number) VALUES ('Skill Swap', 48);
INSERT INTO TM (MoveName, Number) VALUES ('Sludge Bomb', 36);
INSERT INTO TM (MoveName, Number) VALUES ('Snatch', 49);
INSERT INTO TM (MoveName, Number) VALUES ('Solar Beam', 22);
INSERT INTO TM (MoveName, Number) VALUES ('Steel Wing', 47);
INSERT INTO TM (MoveName, Number) VALUES ('Sunny Day', 11);
INSERT INTO TM (MoveName, Number) VALUES ('Taunt', 12);
INSERT INTO TM (MoveName, Number) VALUES ('Thief', 46);
INSERT INTO TM (MoveName, Number) VALUES ('Thunder', 25);
INSERT INTO TM (MoveName, Number) VALUES ('Thunderbolt', 24);
INSERT INTO TM (MoveName, Number) VALUES ('Torment', 41);
INSERT INTO TM (MoveName, Number) VALUES ('Toxic', 6);
INSERT INTO TM (MoveName, Number) VALUES ('Water Pulse', 3);
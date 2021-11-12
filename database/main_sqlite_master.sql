create table sqlite_master
(
    type     text,
    name     text,
    tbl_name text,
    rootpage int,
    sql      text
);

INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Pokemon', 'Pokemon', 2, 'CREATE TABLE "Pokemon"(
        "Dex" integer not null check ("Dex" > 0),
        "PokemonName" char(16),
        "From" integer,
        "evoMethod" char(32),
        "Height" float check ("Height" >= 0),
        "Weight" float check ("Weight" >= 0),
        "ExpYield" integer check ("ExpYield" >= 0),
        "HP" integer check ("HP" > 0),
        "Atk" integer check ("Atk" > 0),
        "Def" integer check ("Def" > 0),
        "SpA" integer check ("SpA" > 0),
        "SpD" integer check ("SpD" > 0),
        "Spe" integer check ("Spe" > 0),
        "LevRate" char(16),
        "HatchTime" integer,
        "CatchRate" integer,
        "MalePercent" float,
        foreign key("From") references "Pokemon"("Dex"),
        primary key("Dex")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Abilities', 'Abilities', 3, 'CREATE TABLE "Abilities"(
        "Dex" integer not null check ("Dex" > 0),
        "Ability" char(16) not null,
        foreign key("Dex") references "Pokemon"("Dex") ON DELETE CASCADE,
        primary key("Dex","Ability")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_Abilities_1', 'Abilities', 4, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'EggGroups', 'EggGroups', 5, 'CREATE TABLE "EggGroups"(
        "Dex" integer not null check ("Dex" > 0),
        "GroupName" char(16) not null,
        foreign key("Dex") references "Pokemon"("Dex") ON DELETE CASCADE,
        primary key("Dex", "GroupName")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_EggGroups_1', 'EggGroups', 6, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Type', 'Type', 7, 'CREATE TABLE "Type"(
        "TypeName" char(8) not null,
        "Category" char(8),
        primary key("TypeName")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_Type_1', 'Type', 8, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Move', 'Move', 9, 'CREATE TABLE "Move"(
        "MoveName" char(16) not null,
        "Accuracy" integer,
        "Power" integer,
        "PP" integer,
        "Status" smallint,
        "TypeName" char(8),
        foreign key("TypeName") references "Type"("TypeName"),
        primary key("MoveName")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_Move_1', 'Move', 10, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'TM', 'TM', 11, 'CREATE TABLE "TM"(
        "MoveName" char(16) not null,
        "Number" integer,
        foreign key("MoveName") references "Move"("MoveName") ON DELETE CASCADE,
        primary key("MoveName")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_TM_1', 'TM', 12, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'HM', 'HM', 13, 'CREATE TABLE "HM"(
        "MoveName" char(16) not null,
        "Number" integer,
        foreign key("MoveName") references "Move"("MoveName") ON DELETE CASCADE,
        primary key("MoveName")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_HM_1', 'HM', 14, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Location', 'Location', 15, 'CREATE TABLE "Location"(
        "LocationName" char(32) not null,
        primary key("LocationName")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_Location_1', 'Location', 16, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Trainer', 'Trainer', 17, 'CREATE TABLE "Trainer"(
        "TID" integer not null check ("TID" > -1),
        "TrainerName" char(16),
        "TrainerClass" char(16),
        primary key("TID")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Team', 'Team', 18, 'CREATE TABLE "Team"(
        "TeamID" integer not null,
        "TID" integer not null check ("TID" > -1),
        "Reward" integer,
        foreign key("TID") references "Trainer"("TID") ON DELETE CASCADE,
        primary key("TeamID","TID")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_Team_1', 'Team', 19, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'TeamMember', 'TeamMember', 20, 'CREATE TABLE "TeamMember"(
        "Dex" integer not null check ("Dex" > 0),
        "MemberID" integer not null,
        "TeamID" integer not null,
        "TID" integer not null check ("TID" > -1),
        "Level" smallint,
        "Gender" char(8),
        foreign key("Dex") references "Pokemon"("Dex"),
        foreign key("TeamID","TID") references "Team"("TeamID","TID"),
        primary key("Dex","MemberID","TeamID","TID")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_TeamMember_1', 'TeamMember', 21, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'FoundAt', 'FoundAt', 22, 'CREATE TABLE "FoundAt"(
        "Dex" integer not null check ("Dex" > 0),
        "LocationName" char(32) not null,
        "Encounter" char(16) not null,
        "Min" integer check ("Min" > 0 and "Min" < 101),
        "Max" integer check ("Max" > 0 and "Max" < 101),
        "Rate" integer,
        foreign key("Dex") references "Pokemon"("Dex"),
        foreign key("LocationName") references "Location"("LocationName"),
        primary key("Dex","LocationName","Encounter")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_FoundAt_1', 'FoundAt', 23, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'FoughtAt', 'FoughtAt', 26, 'CREATE TABLE "FoughtAt"(
        "TID" integer not null check ("TID" > -1),
        "LocationName" char(32) not null,
        foreign key("TID") references "Trainer"("TID"),
        foreign key("LocationName") references "Location"("LocationName"),
        primary key("TID","LocationName")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_FoughtAt_1', 'FoughtAt', 27, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'HasTypes', 'HasTypes', 28, 'CREATE TABLE "HasTypes"(
        "Dex" integer not null check ("Dex" > 0),
        "TypeName" char(8) not null,
        foreign key("Dex") references "Pokemon"("Dex"),
        foreign key("TypeName") references "Type"("TypeName"),
        primary key("Dex","TypeName")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_HasTypes_1', 'HasTypes', 29, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'LearnsByBreeding', 'LearnsByBreeding', 30, 'CREATE TABLE "LearnsByBreeding"(
        "Dex" integer not null check ("Dex" > 0),
        "Father" integer not null check ("Father" > 0),
        "MoveName" char(16) not null,
        foreign key("Dex") references "Pokemon"("Dex"),
        foreign key("Father") references "Pokemon"("Dex"),
        foreign key("MoveName") references "Move"("MoveName"),
        primary key("Dex","Father","MoveName")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_LearnsByBreeding_1', 'LearnsByBreeding', 31, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Learns', 'Learns', 32, 'CREATE TABLE "Learns"(
        "Dex" integer not null check ("Dex" > 0),
        "MoveName" char(16) not null,
        "Method" char(32) not null,
        foreign key("Dex") references "Pokemon"("Dex"),
        foreign key("MoveName") references "Move"("MoveName"),
        primary key("Dex","MoveName","Method")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_Learns_1', 'Learns', 33, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Effectiveness', 'Effectiveness', 34, 'CREATE TABLE "Effectiveness"(
        "Attacker" char(8) not null,
        "Defender" char(8) not null,
        "Quality" char(8) not null,
        foreign key("Attacker") references "Type"("TypeName"),
        foreign key("Defender") references "Type"("TypeName"),
        primary key("Attacker","Defender")
)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_Effectiveness_1', 'Effectiveness', 35, null);
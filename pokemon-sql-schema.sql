--===SQL Schema Form 1===--

create table GROUP07."Pokemon"(
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
	foreign key("From") references GROUP07."Pokemon"("Dex"),
	primary key("Dex")
);

create table GROUP07."Abilities"(
	"Dex" integer not null check ("Dex" > 0),
	"Ability" char(16) not null,
	foreign key("Dex") references GROUP07."Pokemon"("Dex") ON DELETE CASCADE,
	primary key("Dex","Ability")
);

create table GROUP07."EggGroups"(
	"Dex" integer not null check ("Dex" > 0),
	"GroupName" char(16) not null,
	foreign key("Dex") references GROUP07."Pokemon"("Dex") ON DELETE CASCADE,
	primary key("Dex", "GroupName")
);

create table GROUP07."Type"(
	"TypeName" char(8) not null,
	"Category" char(8),
	primary key("TypeName")
);

create table GROUP07."Move"(
	"MoveName" char(16) not null,
	"Accuracy" integer,
	"Power" integer,
	"PP" integer,
	"Status" binary,
	"TypeName" char(8),
	foreign key("TypeName") references GROUP07."Type"("TypeName"),
	primary key("MoveName")
);

create table GROUP07."TM"(
	"MoveName" char(16) not null,
	"Number" integer,
	foreign key("MoveName") references GROUP07."Move"("MoveName") ON DELETE CASCADE,
	primary key("MoveName")
);

create table GROUP07."HM"(
	"MoveName" char(16) not null,
	"Number" integer,
	foreign key("MoveName") references GROUP07."Move"("MoveName") ON DELETE CASCADE,
	primary key("MoveName")
);

create table GROUP07."Location"(
	"LocationName" char(32) not null,
	primary key("LocationName")
);

create table GROUP07."Trainer"(
	"TID" integer not null check ("TID" > -1),
	"TrainerName" char(16),
	"TrainerClass" char(16),
	primary key("TID")
);

create table GROUP07."Team"(
	"TeamID" integer not null,
	"TID" integer not null check ("TID" > -1),
	"Reward" integer,
	foreign key("TID") references GROUP07."Trainer"("TID") ON DELETE CASCADE,
	primary key("TeamID","TID")
);

create table GROUP07."TeamMember"(
	"Dex" integer not null check ("Dex" > 0),
	"MemberID" integer not null,
	"TeamID" integer not null,
	"TID" integer not null check ("TID" > -1),
	"Level" smallint,
	"Gender" char(8),
	foreign key("Dex") references GROUP07."Pokemon"("Dex"),
	foreign key("TeamID","TID") references GROUP07."Team"("TeamID","TID"),
	primary key("Dex","MemberID","TeamID","TID")
);

create table GROUP07."FoundAt"(
	"Dex" integer not null check ("Dex" > 0),
	"LocationName" char(32) not null,
	"Encounter" char(16) not null,
	"Min" integer check ("Min" > 0 and "Min" < 101),
	"Max" integer check ("Max" > 0 and "Max" < 101),
	"Rate" integer,
	foreign key("Dex") references GROUP07."Pokemon"("Dex"),
	foreign key("LocationName") references GROUP07."Location"("LocationName"),
	primary key("Dex","LocationName","Encounter")
);

create table GROUP07."FoughtAt"(
	"TID" integer not null check ("TID" > -1),
	"LocationName" char(32) not null,
	foreign key("TID") references GROUP07."Trainer"("TID"),
	foreign key("LocationName") references GROUP07."Location"("LocationName"),
	primary key("TID","LocationName")
);

create table GROUP07."HasTypes"(
	"Dex" integer not null check ("Dex" > 0),
	"TypeName" char(8) not null,
	foreign key("Dex") references GROUP07."Pokemon"("Dex"),
	foreign key("TypeName") references GROUP07."Type"("TypeName"),
	primary key("Dex","TypeName")
);

create table GROUP07."LearnsByBreeding"(
	"Dex" integer not null check ("Dex" > 0),
	"Father" integer not null check ("Father" > 0),
	"MoveName" char(16) not null,
	foreign key("Dex") references GROUP07."Pokemon"("Dex"),
	foreign key("Father") references GROUP07."Pokemon"("Dex"),
	foreign key("MoveName") references GROUP07."Move"("MoveName"),
	primary key("Dex","Father","MoveName")
);

create table GROUP07."Learns"(
	"Dex" integer not null check ("Dex" > 0),
	"MoveName" char(16) not null,
	"Method" char(32) not null,
	foreign key("Dex") references GROUP07."Pokemon"("Dex"),
	foreign key("MoveName") references GROUP07."Move"("MoveName"),
	primary key("Dex","MoveName","Method")
);

create table GROUP07."Effectiveness"(
	"Attacker" char(8) not null,
	"Defender" char(8) not null,
	"Quality" char(8) not null,
	foreign key("Attacker") references GROUP07."Type"("TypeName"),
	foreign key("Defender") references GROUP07."Type"("TypeName"),
	primary key("Attacker","Defender")
);

--===SQL Schema Form 1===--

create table Pokemon(
	Dex integer unique not null check (Dex > 0),
	PokemonName char(16),
	From integer,
	method char(32),
	Height float check (Height >= 0),
	Weight float check (Weight >= 0),
	ExpYield integer check (ExpYield >= 0),
	HP integer check (HP > 0),
	Atk integer check (Atk > 0),
	Def integer check (Def > 0),
	SpA integer check (SpA > 0),
	SpD integer check (SpD > 0),
	Spe integer check (Spe > 0),
	LevRate char(16),
	HatchTime integer,
	CatchRate integer,
	MalePercent float,
	foreign key(From) references Pokemon(Dex),
	primary key(Dex)
);

create table Abilities(
	Dex integer not null check (Dex > 0),
	Ability char(16) not null,
	foreign key(Dex) references Pokemon(Dex) ON DELETE CASCADE,
	primary key(Dex, Ability)
);

create table EggGroups(
	Dex integer not null check (Dex > 0),
	GroupName char(16) not null,
	foreign key(Dex) references Pokemon(Dex) ON DELETE CASCADE,
	primary key(Dex, GroupName)
);

create table Type(
	TypeName char(8) not null,
	Category char(8),
	primary key(TypeName)
);

create table Move(
	MoveName char(16) not null,
	Accuracy integer,
	Power integer,
	PP integer,
	Status binary,
	TypeName char(8),
	foreign key(TypeName) references Type(TypeName),
	primary key(MoveName)
);

create table TM(
	MoveName char(16) not null,
	Number integer,
	foreign key(MoveName) references Move(MoveName) ON DELETE CASCADE,
	primary key(MoveName)
);

create table HM(
	MoveName char(16) not null,
	Number integer,
	foreign key(MoveName) references Move(MoveName) ON DELETE CASCADE,
	primary key(MoveName)
);

create table Location(
	LocationName char(32) not null,
	primary key(LocationName)
);

create table Trainer(
	TID integer unique not null check (TID > -1),
	TrainerName char(16),
	TrainerClass char(16),
	primary key(TID)
);

create table Team(
	TeamID integer not null,
	TID integer not null check (TID > -1),
	Reward integer,
	foreign key(TID) references Trainer(TID) ON DELETE CASCADE,
	primary key(TeamID,TID)
);

create table TeamMember(
	Dex integer not null check (Dex > 0),
	MemberID integer not null,
	TeamID integer not null,
	TID integer not null check (TID > -1),
	level tinyint,
	gender char(8),
	foreign key(Dex) references Pokemon(Dex),
	foreign key(TeamID,TID) references Team(TeamID,TID),
	primary key(Dex,MemberID,TeamID,TID)
);

create table FoundAt(
	Dex integer not null check (Dex > 0),
	LocationName char(32) not null,
	Encounter char(16) not null,
	Min integer check (Min > 0 and Min < 101),
	Max integer check (Max > 0 and Max < 101),
	Rate integer,
	foreign key(Dex) references Pokemon(Dex),
	foreign key(LocationName) references Location(LocationName),
	primary key(Dex,LocationName,Encounter)
);

create table FoughtAt(
	TID integer not null check (TID > -1),
	LocationName char(32) not null,
	foreign key(TID) references Trainer(TID),
	foreign key(LocationName) references Location(LocationName),
	primary key(TID,LocationName)
);

create table HasTypes(
	Dex integer not null check (Dex > 0),
	TypeName char(8) not null,
	foreign key(Dex) references Pokemon(Dex),
	foreign key(TypeName) references Type(TypeName),
	primary key(Dex,TypeName)
);

create table LearnsByBreeding(
	Dex integer not null check (Dex > 0),
	Father integer not null check (Father > 0),
	MoveName char(16) not null,
	foreign key(Dex) references Pokemon(Dex),
	foreign key(Father) references Pokemon(Dex),
	foreign key(MoveName) references Move(MoveName),
	primary key(Dex,Father,MoveName)
);

create table Learns(
	Dex integer not null check (Dex > 0),
	MoveName char(16) not null,
	Method char(32) not null,
	foreign key(Dex) references Pokemon(Dex),
	foreign key(MoveName) references Move(MoveName),
	primary key(Dex,MoveName,Method)
);

create table Effectiveness(
	Attacker char(8) not null,
	Defender char(8) not null,
	Quality char(8) not null,
	foreign key(Attacker) references Type(TypeName),
	foreign key(Defender) references Type(TypeName),
	primary key(Attacker,Defender)
);



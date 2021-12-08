-- This document contains SQL commands for navigating the J5 Pokemon DB 3380 --
--===========================================================================--

--== Variable Names ==--
-- pkmn = pokemon name
-- dx = pokemon dex num
-- stat = statistic (Atk, Def, etc)
-- ablt = ability name
-- mv = move name
-- mtd = learn method
-- ftr = certain father
-- tp = type name
-- loc = location name
-- enc = Encounter method
-- lvl = level integer
-- trn = Trainer id
-- tcl = TrainerClass
-- egggrp = egg group name
-- srch = text passed into search field
-- val = input value (like an int for comparing stats)
-- qlt = quality (0x, 0.5x, 1x, 2x)

--====================================================================================================================================

--== Drop-downs/Matchup Tables ==--

select PokemonName from Pokemon;

select MoveName from Move;

-- Wave 2 --

select Dex, PokemonName from Pokemon;

select * from Trainer;


--====================================================================================================================================

--== Pokemon selection ==--

-- all pkmn names
select Dex, PokemonName from Pokemon;

-- all stats of a pkmn
select HP, Atk, Def, SpA, SpD, Spe from Pokemon
where PokemonName = pkmn;

-- all evolutions of a pkmn
select P2.Dex, P2.PokemonName from Pokemon P1, Pokemon P2
where P2.EvolvesFrom = P1.Dex and P1.PokemonName = pkmn;

-- all pkmn that learn a certain move
select PokemonName, Learns.method from Pokemon natural join Learns natural join Move
where Move.MoveName = mv
union
select PokemonName from Pokemon natural join LearnsByBreeding natural join Move
where Move.MoveName = mv;

-- all pkmn of each type with highest of a certain stat
select TypeName, PokemonName, stat from Pokemon natural join HasTypes
group by TypeName
having max(stat)
order by stat desc;

-- prev query but lowest of a certain stat
select TypeName, PokemonName, stat from Pokemon natural join HasTypes
group by TypeName
having min(stat)
order by stat;

-- pkmn with base stat of at least a certain value
select PokemonName, stat from Pokemon
where stat >= val
order by stat;

-- pkmn with base stat of at most a certain value
select PokemonName, stat from Pokemon
where stat <= val
order by stat;

-- all pkmn that can be caught at a location
select Dex, PokemonName, Encounter from Pokemon natural join FoundAt
where FoundAt.LocationName = loc;

-- prev query but using a certain method
select Dex, PokemonName, Encounter from Pokemon natural join FoundAt
where FoundAt.LocationName = loc and Encounter = enc;

-- all pkmn that can learn a move that is supereffective on a specific pokemon
select PokemonName, MoveName, TypeName, Method
from Pokemon natural join Learns natural join Move
where MoveName in(
    select MoveName from 
    Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
    join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
    join Pokemon on HasTypes.Dex = Pokemon.Dex
    where Move.Status = 0 and Pokemon.PokemonName = pkmn
    group by MoveName
    having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
) 
union
select P1.PokemonName, MoveName, TypeName, 'Breeding: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
where MoveName in(
    select MoveName from 
    Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
    join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
    join Pokemon on HasTypes.Dex = Pokemon.Dex
    where Move.Status = 0 and Pokemon.PokemonName = pkmn
    group by MoveName
    having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
) 
order by PokemonName;

-- all pkmn that can be caught at a location that learn a move that is supereffective on a specific pokemon
select PokemonName, MoveName, TypeName, Method
from Pokemon natural join Learns natural join Move natural join FoundAt
where LocationName = loc and MoveName in(
    select MoveName from 
    Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
    join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
    join Pokemon on HasTypes.Dex = Pokemon.Dex
    where Move.Status = 0 and Pokemon.PokemonName = pkmn
    group by MoveName
    having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
)
union
select P1.PokemonName, MoveName, TypeName, 'Breeding: ' || P2.PokemonName 
from Pokemon P1 natural join LearnsByBreeding natural join Move 
join Pokemon P2 on LearnsByBreeding.Father = P2.Dex natural join FoundAt
where LocationName = loc and MoveName in(
    select MoveName from 
    Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
    join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
    join Pokemon on HasTypes.Dex = Pokemon.Dex
    where Move.Status = 0 and Pokemon.PokemonName = pkmn
    group by MoveName
    having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
) 
order by PokemonName;

-- all pkmn that a move is super against
select PokemonName, CAST((sum(Quality)-count(Quality))*2 as varchar) || 'x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Move.MoveName = mv
group by PokemonName
having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
order by PokemonName;

-- all pkmn that a move is neutral against
select PokemonName, '1x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Move.MoveName = mv
group by PokemonName
having (sum(Quality)/count(Quality) = 1 or sum(Quality)/count(Quality) = 1.25) and min(Quality) <> 0
order by PokemonName;

-- all pkmn that a move is weak against
select PokemonName, CAST((sum(Quality)/count(Quality)-0.25*(count(Quality)-1)) as varchar) || 'x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Move.MoveName = mv
group by PokemonName
having (sum(Quality)/count(Quality) = 0.75 or sum(Quality)/count(Quality) = 0.5) and min(Quality) <> 0
order by PokemonName;

-- all pkmn that a move does not effect
select PokemonName, '0x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Move.MoveName = mv
group by PokemonName
having min(Quality) = 0
order by PokemonName;

-- effects on all pkmn by one move
select PokemonName, CAST((sum(Quality)-count(Quality))*2 as varchar) || 'x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Move.MoveName = mv
group by PokemonName
having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0

union

select PokemonName, '1x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Move.MoveName = mv
group by PokemonName
having (sum(Quality)/count(Quality) = 1 or sum(Quality)/count(Quality) = 1.25) and min(Quality) <> 0

union

select PokemonName, CAST((sum(Quality)/count(Quality)-0.25*(count(Quality)-1)) as varchar) || 'x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Move.MoveName = mv
group by PokemonName
having (sum(Quality)/count(Quality) = 0.75 or sum(Quality)/count(Quality) = 0.5) and min(Quality) <> 0

union

select PokemonName, '0x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Move.MoveName = mv
group by PokemonName
having min(Quality) = 0
order by PokemonName;

-- Wave 2 --

-- all pkmn's abilities
select PokemonName, Ability from Pokemon natural join Abilities;

-- all pkmn that have a certain ability
select PokemonName, Ability from Pokemon natural join Abilities
where Ability = ablt;

-- all pkmn of a certain type and the moves they learn of another type
select PokemonName, MoveName 
from Pokemon natural join Learns natural join Move join HasTypes on Pokemon.Dex = HasTypes.Dex
where HasTypes.TypeName = tp1 and Move.TypeName = tp2
union
select P1.PokemonName, MoveName 
from Pokemon P1 join HasTypes on P1.Dex = HasTypes.Dex natural join LearnsByBreeding natural join Move 
join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
where HasTypes.TypeName = tp1 and Move.TypeName = tp2;

-- prev query but with method
select PokemonName, MoveName, Method 
from Pokemon natural join Learns natural join Move join HasTypes on Pokemon.Dex = HasTypes.Dex
where HasTypes.TypeName = tp1 and Move.TypeName = tp2
union
select P1.PokemonName, MoveName, 'Breeding: ' || P2.PokemonName 
from Pokemon P1 join HasTypes on P1.Dex = HasTypes.Dex natural join LearnsByBreeding natural join Move 
join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
where HasTypes.TypeName = tp1 and Move.TypeName = tp2;


--====================================================================================================================================

--== Move Selection ==--

-- **ADDED POKEMONNAME** any moves any pkmn learns
select MoveName, PokemonName from Pokemon natural join Learns natural join Move
union
select MoveName, PokemonName from Pokemon natural join LearnsByBreeding natural join Move;

-- prev query but with method
select MoveName, PokemonName, Method from Pokemon natural join Learns natural join Move
union
select MoveName, P1.PokemonName, 'Breeding: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
join Pokemon P2 on LearnsByBreeding.Father = P2.Dex;

-- all moves one pkmn learns
select MoveName from Pokemon natural join Learns natural join Move
where Pokemon.PokemonName = pkmn
union
select MoveName from Pokemon natural join LearnsByBreeding natural join Move
where Pokemon.PokemonName = pkmn;

-- prev query but with learn method
select MoveName, Method from Pokemon natural join Learns natural join Move
where Pokemon.PokemonName = pkmn
union
select MoveName, 'Breeding: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
where P1.PokemonName = pkmn;

-- all moves with certain effectiveness against a type
select MoveName, TAtt.TypeName from Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName
where TDef.TypeName = tp and Quality = qlt;

-- all moves with supereffectiveness against a pkmn
select MoveName, TAtt.TypeName, CAST((sum(Quality)-count(Quality))*2 as varchar) || 'x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Pokemon.PokemonName = pkmn
group by MoveName
having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
order by MoveName;

-- all moves with neutral effectiveness against a pkmn
select MoveName, TAtt.TypeName, '1.0x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Pokemon.PokemonName = pkmn
group by MoveName
having (sum(Quality)/count(Quality) = 1 or sum(Quality)/count(Quality) = 1.25) and min(Quality) <> 0
order by MoveName;

-- all moves not-very-effective against a pkmn
select MoveName, TAtt.TypeName, CAST((sum(Quality)/count(Quality)-0.25*(count(Quality)-1)) as varchar) || 'x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Pokemon.PokemonName = pkmn
group by MoveName
having (sum(Quality)/count(Quality) = 0.75 or sum(Quality)/count(Quality) = 0.5) and min(Quality) <> 0
order by MoveName;

-- all moves non-effective against a pkmn
select MoveName, TAtt.TypeName, '0.0x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Pokemon.PokemonName = pkmn
group by MoveName
having min(Quality) = 0
order by MoveName;

-- all move effectivenesses against a pkmn
select MoveName, TAtt.TypeName, CAST((sum(Quality)-count(Quality))*2 as varchar) || 'x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Pokemon.PokemonName = pkmn
group by MoveName
having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0

union

select MoveName, TAtt.TypeName, '1.0x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Pokemon.PokemonName = pkmn
group by MoveName
having (sum(Quality)/count(Quality) = 1 or sum(Quality)/count(Quality) = 1.25) and min(Quality) <> 0

union

select MoveName, TAtt.TypeName, CAST((sum(Quality)/count(Quality)-0.25*(count(Quality)-1)) as varchar) || 'x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Pokemon.PokemonName = pkmn
group by MoveName
having (sum(Quality)/count(Quality) = 0.75 or sum(Quality)/count(Quality) = 0.5) and min(Quality) <> 0

union

select MoveName, TAtt.TypeName, '0.0x' as Effect from 
Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
join Pokemon on HasTypes.Dex = Pokemon.Dex
where Move.Status = 0 and Pokemon.PokemonName = pkmn
group by MoveName
having min(Quality) = 0
order by MoveName;
--

-- Wave 2 --

-- all status moves
select MoveName from Move where Status = 1;

-- all ways a pkmn learns a certain move
select MoveName, Method from Pokemon natural join Learns natural join Move
where Pokemon.PokemonName = pkmn and MoveName = mv
union
select MoveName, 'Breeding: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
where P1.PokemonName = pkmn and MoveName = mv;

-- all moves of a certain type that a certain pkmn can learn
select MoveName from Pokemon natural join Learns natural join Move
where Pokemon.PokemonName = pkmn and TypeName = tp
union
select MoveName from Pokemon natural join LearnsByBreeding natural join Move
where Pokemon.PokemonName = pkmn and TypeName = tp;

-- prev query but with method
select MoveName, Method from Pokemon natural join Learns natural join Move
where Pokemon.PokemonName = pkmn and TypeName = tp
union
select MoveName, 'Breeding: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
where P1.PokemonName = pkmn and TypeName = tp;

-- all moves a pkmn learns with a specific non-breeding method
select MoveName, Method from Pokemon natural join Learns natural join Move
where Pokemon.PokemonName = pkmn and Method = mtd;

-- all moves a pkmn learns via breeding
select MoveName, 'Father: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
where P1.PokemonName = pkmn;

-- prev query with a specific Father
select MoveName from Pokemon P1 natural join LearnsByBreeding natural join Move 
join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
where P1.PokemonName = pkmn and P2.PokemonName = ftr;

-- Wave 3 --

-- all TM moves
select Number, MoveName from TM order by Number;

-- all HM moves
select Number, MoveName from HM order by Number;

-- all moves all pokemon learns by TM
select MoveName, Method from Pokemon natural join Learns natural join TM
where Method like 'TM%';

-- all moves all pokemon learns by HM
select MoveName, Method from Pokemon natural join Learns natural join HM
where Method like 'HM%';

-- all moves a given pokemon learns by TM
select MoveName, Method from Pokemon natural join Learns natural join TM
where PokemonName = pkmn and Method like 'TM%';

-- all moves a given pokemon learns by HM
select MoveName, Method from Pokemon natural join Learns natural join HM
where PokemonName = pkmn and Method like 'HM%';

--====================================================================================================================================

--== Location Selection ==--

-- all locations a pkmn may be found at
select LocationName, Encounter from Pokemon natural join FoundAt
where PokemonName = pkmn;

-- prev query but with a certain method
select LocationName, Encounter from Pokemon natural join FoundAt
where PokemonName = pkmn and Encounter = enc;

-- all locations that have pkmn of a certain type
select PokemonName, LocationName, Encounter from Pokemon natural join HasTypes natural join FoundAt
where TypeName = tp;

-- prev query but for dualtypes
select PokemonName, LocationName, Encounter from Pokemon natural join HasTypes natural join FoundAt
where TypeName = tp1
intersect
select PokemonName, LocationName, Encounter from Pokemon natural join HasTypes natural join FoundAt
where TypeName = tp2;

-- all locations where a certain Trainer is fought
select LocationName from FoughtAt natural join Trainer 
where TID = trn;

-- all locations where a certain Trainer Class can be fought
select LocationName, TrainerName, TrainerClass
from FoughtAt natural join Trainer
where TrainerClass = tcl;

-- Wave 2 --

-- locations where a certain pkmn of at least a certain level can be found
select LocationName, Encounter, Min as StartingLevel
from Pokemon natural join FoundAt
where PokemonName = pkmn and Min >= lvl
order by LocationName;


--====================================================================================================================================

--== Type Selection ==--

-- number of pkmn per type
select TypeName, count(Dex) as Num_of_Pokemon
from HasTypes natural join Pokemon
group by TypeName;

-- Wave 2 --

-- types with physical damage type
select TypeName from Type where Category = 'Physical';

-- types with special damage type
select TypeName from Type where Category = 'Special';



--====================================================================================================================================

--== Breeding Selection ==--

-- Wave 2 --

-- All pokemon in a certain egg group
select PokemonName from Pokemon natural join EggGroups
where GroupName = egggrp;

-- All pokemon that can breed with a certain pokemon
select distinct PokemonName from Pokemon natural join EggGroups
where case when pkmn <> 'Ditto' THEN
    PokemonName = 'Ditto' or GroupName in(
    select GroupName from Pokemon natural join EggGroups
    where PokemonName = pkmn )
ELSE
    PokemonName <> 'Ditto' and GroupName <> 'Undiscovered'
END
order by PokemonName;


--====================================================================================================================================

--== Trainer Selection ==--

-- Wave 2 --

-- all trainers on a certain route
select TrainerName, TrainerClass from Trainer natural join FoughtAt 
where LocationName = loc;

-- all trainers with a certain class
select TrainerNamel TrainerClass from Trainer where TrainerClass = tcl;


--====================================================================================================================================

--== Team Selection ==--

-- Wave 2 --

-- all teams of a certain trainer
select TrainerName, TrainerClass, TeamID, MemberID, PokemonName, Level
from Trainer natural join Team natural join TeamMember natural join Pokemon
where TID = trn
order by TeamID, MemberID;

-- all trainers/teams with a certain pokemon
select TrainerName, TrainerClass, TeamID, MemberID, PokemonName, Level
from Trainer natural join Team natural join TeamMember natural join Pokemon
where (TID, TeamID) in(
    select TID, TeamID
    from Trainer natural join Team natural join TeamMember natural join Pokemon
    where PokemonName = pkmn
)
order by TrainerName, TrainerClass, TeamID, MemberID;

-- all teams with a specific minimum level
select TrainerName, TrainerClass, TeamID, MemberID, PokemonName, Level
from Trainer natural join Team natural join TeamMember natural join Pokemon
where (TID, TeamID) in(
    select TID, TeamID
    from Trainer natural join Team natural join TeamMember natural join Pokemon
    group by TID, TeamID
    having min(Level) >= lvl
)
order by TrainerName, TrainerClass, TeamID, MemberID;

-- all teams with a specific maximum level
select TrainerName, TrainerClass, TeamID, MemberID, PokemonName, Level
from Trainer natural join Team natural join TeamMember natural join Pokemon
where (TID, TeamID) in(
    select TID, TeamID
    from Trainer natural join Team natural join TeamMember natural join Pokemon
    group by TID, TeamID
    having min(Level) <= lvl
)
order by TrainerName, TrainerClass, TeamID, MemberID;


--====================================================================================================================================

--== 










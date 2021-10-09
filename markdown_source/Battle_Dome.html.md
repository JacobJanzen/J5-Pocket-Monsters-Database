{{Facility infobox
|name=Dome
|jname=バトルドーム
|jtrans=Battle Dome
|image=Battle Dome E.png
|slogan=Your path to the invincible superstar!
|bpr=4
|partsing=3
|partdoub=3
|brain=Dome Ace Tucker
|brainlink=Tucker
|brainsprite=Spr E Tucker
|symbol=Tactics
|silver=5
|gold=10
}}

The '''Battle Dome''' (Japanese: '''バトルドーム''' ''Battle Dome'') is a [[Battle facility|facility]] located within the [[Hoenn]] {{gdis|Battle Frontier|III}} in {{game|Emerald}}.

==Challenges==
Each challenge at the Battle Dome is a tournament between 16 Trainers.

Before each battle, the player can find out about their opponent, such as the Pokémon they use, their battle style, and how they train. Then, both Trainers choose two Pokémon from their three-Pokémon party to use in battle. Competitors can find out who was eliminated in each round by looking at the tournament bracket.

:''See more:''
::''[[List of Battle Frontier Trainers (Generation III)]]

===Seeding===
The tournament bracket is organized as follows:
* '''Left Bracket''': 1 vs 9, 13 vs 5, 8 vs 16, 12 vs 4
* '''Right Bracket''': 3 vs 11, 15 vs 7, 6 vs 14, 10 vs 2

Seedings are determined by their ranking: the sum of the combined base stat totals of all Pokémon, plus 1/20 of the product of the number of different types represented by the Pokémon and the highest level among the Pokémon. If two Trainers tie in ranking, the higher internal Trainer number will win the tiebreaker; the player will always win the tiebreaker against any CPU Trainer, while Dome Ace Tucker will win any tiebreaker against other CPU Trainers. In the event of a tie battle, the higher seed advances and the lower seed is eliminated.

===Opponent Trainer card===
Before each battle, the player is shown a Trainer card with some information about their opponent. It includes their Trainer class and name, Trainer sprite, the Pokémon in their party, and three lines describing the Trainer.

The first line of the description is based on the Trainer's seed in the tournament tree. Trainers with higher seeds are described as having more potential. Dome Ace Tucker has a unique potential description.

The second line of the description is based on the Trainer's Pokémon's moves. Every move in the game has a series of flags for this check, and the moves across the Trainer's party are aggregated to determine what this line should be.

The third line of the description is based on the Trainer's Pokémon's stats—specifically, their [[effort values]] (EVs) and [[nature]].

====Move description====
{{incomplete|section|needs=Expansion based on [https://github.com/pret/pokeemerald/blob/master/src/battle_dome.c#L140 Emerald decompilation]}}

====Stat description====
The stat description is determined by the [[effort values]] of the Trainer's Pokémon. A stat is considered to be emphasized if it makes up at least 30% of the team's total EVs, and neglected if it makes up less than 1% of the team's total EVs in that stat among the entered Pokémon. [[Nature]]s are taken into account for this calculation, such that EVs on a Pokémon with a beneficial Nature are worth 10% more, while EVs on a Pokémon with a hindering Nature are worth 10% less.

If there are any emphasized stats, they are shown (if there are three emphasized stats, only the two that make up the most of the team's EV are shown). Otherwise, if there are any neglected stats, they are shown (if there are more than two, only two are shown—stats with hindering Natures among the team Pokémon are preferred for the listing). Otherwise, the Trainer is said to "raise Pokémon in a well-balanced way."

===CPU battles===
Note that the game does not simulate battles between two CPU Trainers. Instead, the outcome between two CPU Trainers is broken down as follows: each Trainer is scored based upon the sum of the following:
* The type affinity of damaging attacks: each attack dealing damage on the team is compared against each Pokémon on the opposing team. 4 points are awarded if the attack is normally effective, 12 if super effective, and 20 if 4× super effective. No points are awarded if the attack is resisted. 8 points are deducted if the attack is 4× resisted, and 16 points are deducted if the attack is ineffective. For the purposes of calculating this, {{type|Ground}} attacks are considered to be neutral against Pokémon with {{a|Levitate}}. Against Pokémon with {{a|Wonder Guard}}, type matchups that are not super effective do not award nor deduct points.
* The sum of the base stats of all Pokémon, divided by 10
* The seeding of the Trainer, minus 1
* A random value from 0 to 31

The Trainer with the higher score advances; if this is a tie, then the higher-seeded Trainer advances. During tournaments in which he may be challenged by the player, Tucker always appears as the #2 seeded contestant, and will always win his battles against CPU opponents.

===CPU Pokémon selection===
To determine the Pokémon sent out by a CPU Trainer against the player, each of the CPU Trainer's three Pokémon is given a score. There are two scoring methods, which are chosen at random: the offensive method and defensive method. Both methods compare the type affinity of the Pokémon's damaging attacks against each of the three Pokémon on the player's team. In the offensive method, 2 points are awarded if the attack is normally effective, 4 if super effective, and 8 if 4× super effective. In the defensive method, 2 points are awarded if the attack is resisted, 4 if 4× resisted, and 8 if ineffective. 2 points are deducted if super effective, and 4 are deducted if 4× super effective. No points are awarded or deducted in any other scenario. For the purposes of this calculation, type matchups that are not super effective against Pokémon with {{a|Wonder Guard}} are ignored (no points are awarded or deducted), and {{type|Ground}} attacks are considered to be neutral against Pokémon with {{a|Levitate}}.

If all three Pokémon tie in one method, the other method is used. If all three Pokémon tie in the second method, then two Pokémon and the order they appear are chosen at random. Otherwise, the two highest-scoring Pokémon is chosen (if there is a tie for the second selection, the second selection of Pokémon is chosen at random). There is a 40% chance that the CPU Trainer will lead off with the higher-scoring Pokémon, and a 60% chance of leading off with the lower-scoring Pokémon.

===Battle Points===
{| class="wikitable" style="text-align:center"
! BP per round !! 1 !! 2 !! 3 !! 4 !! 5 !! 6 !! 7 !! 8 !! 9 !! 10 !! 11 !! 12 !! 13 !! 14 !! 15 !! 16 !! 17 !! 18 !! 19 !! 20 !! 21 !! 22 !! 23 !! 24 !! 25 !! 26 !! 27 !! 28 !! 29 !! 30
|-
| Any level mode || 1 || 1 || 2 || 2 || 13 || 3 || 4 || 4 || 5 || 15 || 6 || 6 || 7 || 7 || 18 || 8 || 9 || 9 || 10 || 20 || 11 || 11 || 12 || 12 || 23 || 13 || 14 || 14 || 15 || 25
|}

===Dome Ace===
After the player has won five and ten championships, [[Tucker]] will challenge them. On his defeat, he awards the Tactics Symbol.

Tucker uses two of these Pokémon when battling the {{player}}.

====Silver Symbol challenge====
{{Party/Single|color={{frontier color}}|bordercolor={{frontier color dark}}|headcolor={{frontier color light}}
|sprite=Spr E Tucker.png
|prize=13{{color2|000|Battle Point|BP}}
|class=Dome Ace
|classlink=Tucker
|name=Tucker
|game=E
|location=Battle Dome
|pokemon=2
}}|{{Pokémon/3|game=Emerald|ndex=260|pokemon=Swampert|gender=both
|ability=Torrent|level={{tt|50|Level 50}}, {{tt|60-100|Open Level}}|type1=Water|type2=Ground|held=Focus Band
|move1=Surf|move1type=Water
|move2=Ice Beam|move2type=Ice
|move3=Earthquake|move3type=Ground
|move4=Counter|move4type=Fighting}}
|{{Pokémon/3|game=Emerald|ndex=373|pokemon=Salamence|gender=both
|ability=Intimidate|level={{tt|50|Level 50}}, {{tt|60-100|Open Level}}|type1=Dragon|type2=Flying|held=Lum Berry
|move1=Dragon Claw|move1type=Dragon
|move2=Aerial Ace|move2type=Flying
|move3=Earthquake|move3type=Ground
|move4=Brick Break|move4type=Fighting}}
|{{Pokémon/3|game=Emerald|ndex=006|pokemon=Charizard|gender=both
|ability=Blaze|level={{tt|50|Level 50}}, {{tt|60-100|Open Level}}|type1=Fire|type2=Flying|held=White Herb
|move1=Overheat|move1type=Fire
|move2=Aerial Ace|move2type=Flying
|move3=Earthquake|move3type=Ground
|move4=Rock Slide|move4type=Rock}}
{{Party/Footer}}

====Gold Symbol challenge====
{{Party/Single|color={{frontier color}}|bordercolor={{frontier color dark}}|headcolor={{frontier color light}}
|sprite=Spr E Tucker.png
|prize=15{{color2|000|Battle Point|BP}}
|class=Dome Ace
|classlink=Tucker
|name=Tucker
|game=E
|location=Battle Dome
|pokemon=2
}}|{{Pokémon/3|game=Emerald|ndex=260|pokemon=Swampert|gender=both
|ability=Torrent|level={{tt|50|Level 50}}, {{tt|60-100|Open Level}}|type1=Water|type2=Ground|held=Leftovers
|move1=Surf|move1type=Water
|move2=Ice Beam|move2type=Ice
|move3=Earthquake|move3type=Ground
|move4=Mirror Coat|move4type=Psychic}}
|{{Pokémon/3|game=Emerald|ndex=376|pokemon=Metagross
|ability=Clear Body|level={{tt|50|Level 50}}, {{tt|60-100|Open Level}}|type1=Steel|type2=Psychic|held=Quick Claw
|move1=Meteor Mash|move1type=Steel
|move2=Psychic|move2type=Psychic
|move3=Earthquake|move3type=Ground
|move4=Protect|move4type=Normal}}
|{{Pokémon/3|game=Emerald|gender=female|ndex=380|pokemon=Latias
|ability=Levitate|level={{tt|50|Level 50}}, {{tt|60-100|Open Level}}|type1=Dragon|type2=Psychic|held=Chesto Berry
|move1=Psychic|move1type=Psychic
|move2=Calm Mind|move2type=Psychic
|move3=Thunderbolt|move3type=Electric
|move4=Rest|move4type=Psychic}}
{{Party/Footer}}

==Layout==
{| class="roundy" style="margin:auto; text-align:center; background: #{{frontier color}}" width="250px"
|-
| width="33%" | [[File:Battle Dome interior E.png|203px]]
| width="33%" | [[File:Battle Dome preparation room E.png|170px]]
| width="33%" | [[File:Battle Dome arena E.png|238px]]
|-
| &lt;small>Inside the Battle Dome&lt;/small>
| &lt;small>Trainers can view info on their opponents&lt;/small>
| &lt;small>Before battle in the Battle Dome&lt;/small>
|}

==In the anime==
[[File:Battle Dome anime.png|thumb|left|220px|The Battle Dome in the {{pkmn|anime}}]]
[[File:Battle Dome battlefield.png|thumb|220px|The Battle Dome's battlefield in the anime]]
The Battle Dome appeared in ''[[AG153|Tactics Theatrics!!]]''. In the anime, it is located south of [[Lavender Town]], possibly on {{rt|12|Kanto}} and was the third {{gdis|Battle Frontier|III}} facility challenged by {{Ash}}. {{ashfr|The group}} discovered its location in ''[[AG149|Wheel of Frontier]]'', following Ash's victory against [[Greta]] at the [[Battle Arena]]. The facility is run by [[Tucker]] and the battles are [[Battle judge|refereed]] by {{OBP|Victor|AG153}}.

In the Battle Dome, challengers have to defeat the Dome Ace in a [[Double Battle]]. They are given the possibility of swapping their [[party]] Pokémon with ones they have in storage after the [[Frontier Brain]] has revealed his Pokémon. After a tough match, Ash managed to defeat Tucker using his {{AP|Corphish}} and {{AP|Swellow}}. This victory gave Ash the [[Symbol|Tactics Symbol]], his third Frontier Symbol overall.
{{-}}

===Pokémon used in the Battle Dome===
The following is a list of {{OBP|Pokémon|species}} used in the Battle Dome:
{{TrainerPoké
|trainer=Tucker
|pkmn=Swampert
|type1=Water
|type2=Ground
|img=Tucker Swampert.png
|epnum=AG153
|epname=Tactics Theatrics!!
|vajp=Kōichi Sakaguchi
|vaen=Bill Rogers
|desc={{p|Swampert}} was one of the two Pokémon that battled against [[Ash's Corphish]] and [[Ash's Swellow]]. Swampert and Arcanine seemed like a perfect combination, taking advantage of Arcanine's speed and its defense as stated by {{an|Brock}} in the episode. In the [[Double Battle]], Swampert's main target was Corphish. Even though it looked bad for Ash, after Tucker used the Fusion of Fire and Water, Corphish and Swellow gained their fighting spirit and came back to win the match for Ash. Swampert was defeated by an {{m|Aerial Ace}} from Swellow.

Swampert's known moves are {{m|Protect}}, {{m|Mud Shot}}, {{m|Dynamic Punch}}, {{m|Water Gun}}, and {{m|Water Pulse}}.}}

{{TrainerPoké
|trainer=Tucker
|pkmn=Arcanine
|type1=Fire
|img=Tucker Arcanine.png
|epnum=AG153
|epname=Tactics Theatrics!!
|vajp=Chie Satō
|vaen=Chie Satō
|desc=The other Pokémon Tucker used was {{p|Arcanine}}. Swampert and Arcanine were a perfect combination, taking advantage of Arcanine's speed and Swampert's defense. Even though it looked bad for {{Ash}}, after Tucker's Fusion of Fire and Water, Corphish and Swellow gained their fighting spirit and with the help of some strategy of Ash's, they were able to win the match. Arcanine was defeated by a {{m|Crabhammer}} from [[Ash's Corphish]].

Arcanine's known moves are {{m|Extreme Speed}}, {{m|Flamethrower}}, {{m|Fire Blast}}, and {{m|Aerial Ace}}.}}

==In the manga==
===Pokémon Adventures===
[[File:Battle Dome Adventures.png|thumb|250px|The Battle Dome in [[Pokémon Adventures]]]]
In [[Pokémon Adventures]], the Trainer who wins the Battle Dome challenge always earns the Tactics Symbol, regardless of whether Tucker makes it to the finals or not.

===={{chap|Emerald}}====
The Battle Dome first appeared in ''[[PS319|Verily Vanquishing Vileplume I]]'', where {{adv|Emerald}} challenged it as his fifth Battle Frontier facility during the Battle Frontier's seven-day opening ceremony. Due to the tournament-style structure of the challenge, {{pkmn|Trainer}}s were shipped from the [[Hoenn]] mainland over to the Battle Frontier to participate in it to avoid endless {{pkmn|battle}}s between computer-controlled virtual Trainers. Amongst the participating Trainers were {{adv|Ruby}} and {{adv|Sapphire}}, who tried to make friends with Emerald, much to his annoyance.

During the semifinal battle between Ruby and Emerald, Ruby revealed that [[Emerald's Sceptile]] was the very same {{p|Treecko}} that Emerald had once been supposed to receive from [[Professor Birch]]. As Emerald defeated Ruby and Sapphire was defeated by Tucker, Emerald and Tucker were set to face each other in the finals. However, Emerald abruptly requested the permission to swap his [[party]] Pokémon with ones from {{adv|Crystal}}. Although this was against the rules, Tucker allowed it. However, Emerald's borrowed {{p|Alakazam}} and {{p|Metagross}} both wound up getting defeated by Tucker's {{p|Charizard}}, resulting in Emerald's first loss at the Battle Frontier.

The battle was observed by most of the other Frontier Brains. As soon as it had ended and Emerald had headed off to challenge the [[Battle Palace]], Tucker noticed [[Guile Hideout]] outside the window, and [[Noland]] was informed that {{adv|Jirachi}} had been sighted on the Battle Dome rooftop. The Frontier Brains rushed to the rooftop, but arrived too late to stop Guile from {{pkmn2|caught|capturing}} Jirachi for his evil schemes.

In ''[[PS337|Epilogue]]'', after Emerald had managed to obtain all six other [[Symbol]]s, he realized that he only had one day left to earn the Tactics Symbol. While the Battle Dome was still operable, despite the damage that Guile Hideout had caused to the Battle Frontier, the challenge required a group of Trainers to form a tournament. To everyone's surprise, {{adv|Red}} suggested a tournament between the ten [[Pokédex holder]]s, which [[Scott]] happily accepted. By the end of the round, Emerald was shown to have earned the Tactics Symbol, indicating that he had won the tournament and thus successfully completed his seven-day Battle Frontier challenge.

===Pokémon Battle Frontier===
[[File:Battle Dome CBF.png|thumb|200px|The Battle Dome in [[Pokémon Battle Frontier]]]]
The Battle Dome appeared in ''[[CBF4|Introducing the Frontier Brains!]]''. After learning about [[Frontier Brain]]s, {{OBP|Enta|CBF}} decided to challenge each of them, starting at the Battle Dome. After achieving a long-enough win streak, Enta came face to face with Tucker, who challenged him to a [[Double Battle]]. After a tough match, Enta was able to defeat Tucker with his {{TP|Enta|Vulpix}} and {{p|Feebas}}. At first, Tucker was unwilling to admit that Enta could've beaten him with a Pokémon as ugly as Feebas, but he changed his mind when Feebas evolved into {{p|Milotic}}.
{{-}}

==In other languages==
{{langtable|color={{frontier color light}}|bordercolor={{frontier color}}
|zh_yue=對戰巨蛋 ''{{tt|Deuijin Geuihdáan|Battle Dome}}''
|zh_cmn=對戰巨蛋 / 对战巨蛋 ''{{tt|Duìzhàn Jùdàn|Battle Dome}}''
|da=Kampkuplen
|nl=Strijdstadion ([[AG149]], [[AG153]])&lt;br>Strijdarena ([[AG150]]-[[AG152]]) {{tt|*|Translates to Battle Arena, likely a localization error.}}
|fi=Ottelukupu
|fr=Dôme de Combat
|de=Kampfstadion
|id=Kubah Pertarungan
|it=Cupola Lotta
|ko=배틀돔 ''Battle Dome''
|pt_br=Cúpula da Batalha
|es_la=Domo de Batalla
|es_eu=Cúpula Batalla
|th=แบทเทิลโดม ''Battle Dome''
|vi=Nhà vòm giao đấu}}
{{-}}

{{Hoenn Frontier Brains}}
{{Hoenn}}&lt;br>
{{Project Locations notice}}

[[Category:Emerald locations]]
[[Category:Battle facilities]]
[[Category:Battle Frontier]]

[[de:Kampfstadion]]
[[es:Frente Batalla (Hoenn)#Cúpula Batalla]]
[[fr:Dôme de Combat]]
[[it:Cupola Lotta]]
[[ja:バトルドーム]]
[[zh:对战巨蛋]]

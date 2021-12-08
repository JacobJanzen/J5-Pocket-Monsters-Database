<template>
<div class="root">
<h1>WRITE UP PAGE</h1>
<h2>Data Summary</h2>
<p>
Pokémon was fresh on our minds when we began the project because our instructor, Adam Pazdor,
had brought up his interest in the game several times during class. We very quickly realized that
a database containing information about Pokémon would be a great way to have lots of data with
very interesting relationships.
</p>
<p>
We ultimately decided to constrain our idea to one specific game in the franchise while building
our data model because we wanted to track data about non-player characters and locations in the
games which would quickly get very complicated when discussing multiple games. It would introduce
even more complications when considering the fact that many relationships between entities would
change depending on the specific game. To solve this, we chose one specific game rather 
arbitrarily: Pokémon Emerald.
</p>
<p>
The Data consists of the set of Pokémon that are present in Pokémon Emerald, the locations, 
moves, and non-player <em>trainers</em> in the game, as well as the <em>types</em> that Pokémon 
and moves can have. We tracked the methods in which each Pokémon can learn each move as well as 
the location of all non-player characters and the locations where each Pokémon can be found.
</p>
<p>
In the end, we had a 1.4MB database. Our largest table, <code>Learns</code>, had 15280
records while our smallest table, <code>HM</code>, had only 8. In total, there were 24547 records 
in the database.
</p>
<h2>Data Model</h2>
<p>
We gathered data based on the data model we created, which was created from brainstorming every
type of data we could gather about the game that we deemed interesting and then linked together
in every way that we could think of.
</p>
<p>
Most of the challenges in creating the data model were in fine tuning the details after working
out exactly which data we would use. For instance, originally the <code>Learns</code> table 
contained
every move that every Pokémon could learn without any distinction of method. Later, we decided
to add the method and split it into one relationship for each method in which a Pokémon could
learn a move. This added a lot of unnecessary complications to the data set and made queries
far more difficult than they needed to be. Thus, we combined them back into a single relationship 
with a method attribute being a primary key on the relationship. Unfortunately, learning a move by
breeding is a little more complicated than other methods of learning a move. It is dependent not
only upon the Pokémon learning the move and the move itself, but also the father of the 
Pokémon learning the move. Therefore, we separated that ternary relationship between two
Pokémon and move from the rest of the learn methods.
</p>
<p>
Another challenge that came up in the project was the relationship between a trainer and the 
Pokémon that they used in their team. Originally, we had <code>Team</code> as a weak entity that 
depended on <code>Trainer</code> and <code>TeamMember</code> as a weak entity that depended on 
<code>Team</code>.
This two-layer weak entity added a lot of unnecessary complication, so we changed 
<code>TeamMember</code> to be a relationship instead which has an ID as a part of its primary key.
</p>
<p>
A tricky participation ratio was surrounding the <code>HasTypes</code> relationship. The ??? type
which existed in Pokémon Emerald was a type only used for the move <em>Curse</em>.
Thus, we had only partial participation from <code>Type</code> to <code>Pokemon</code> and total 
participation from the other side because every Pokémon has at least one type and can have two.
</p>
<p>
A tricky cardinality ratio is through the <code>EvolvesFrom</code> relationship. While generally, 
when
a Pokémon evolves, it can only evolve into one Pokémon, there are rare situations where
one Pokémon can evolve into multiple different ones. For instance, <em>Eevee</em> can evolve into 
<em>Vaporeon</em>, <em>Jolteon</em>, <em>Flareon</em>, <em>Espeon</em>, or <em>Umbreon</em> 
depending on the
specific circumstances that it evolves under. This relationship does not work in the opposite 
direction. There are no cases where one Pokémon evolves from two different Pokémon in 
Pokémon Emerald.
</p>
<h2>Database Summary</h2>
<table>
    <tr>
    <th>Table</th><th>Cardinality</th><th>Arity</th>
    </tr>
    <tr>
    <th>Pokemon</th><th>386</th><th>17</th>
    </tr>
    <tr>
    <th>Abilities</th><th>610</th><th>2</th>
    </tr>
    <tr>
    <th>EggGroups</th><th>504</th><th>2</th>
    </tr>
    <tr>
    <th>Location</th><th>106</th><th>1</th>
    </tr>
    <tr>
    <th>Move</th><th>354</th><th>6</th>
    </tr>
    <tr>
    <th>Trainer</th><th>493</th><th>3</th>
    </tr>
    <tr>
    <th>Type</th><th>18</th><th>2</th>
    </tr>
    <tr>
    <th>FoughtAt</th><th>520</th><th>2</th>
    </tr>
    <tr>
    <th>FoundAt</th><th>647</th><th>6</th>
    </tr>
    <tr>
    <th>HasTypes</th><th>557</th><th>2</th>
    </tr>
    <tr>
    <th>HM</th><th>8</th><th>2</th>
    </tr>
    <tr>
    <th>Learns</th><th>15280</th><th>3</th>
    </tr>
    <tr>
    <th>LearnsByBreeding</th><th>2007</th><th>3</th>
    </tr>
    <tr>
    <th>Team</th><th>887</th><th>3</th>
    </tr>
    <tr>
    <th>TeamMember</th><th>1795</th><th>6</th>
    </tr>
    <tr>
    <th>TM</th><th>50</th><th>2</th>
    </tr>
    <tr>
    <th>Effectiveness</th><th>324</th><th>3</th>
    </tr>
</table>
<h2>Queries</h2>
<ul>
    <li>The Pokémon in a given egg group.</li>
    <li>The Pokémon a given Pokémon can breed with.</li>
    <li>The locations a Pokémon may be found at.</li>
    <li>The locations a Pokémon may be found at and the method which they can be found with.</li>
    <li>The locations a Pokémon of a given type can be found.</li>
    <li>The locations that a Pokémon with two given types can be found.</li>
    <li>The locations with a given trainer.</li>
    <li>The locations where a certain trainer class can be fought.</li>
    <li>The locations where a certain Pokémon of at least a certain level can be found.</li>
    <li>List the moves that are learnt by all Pokémon.</li>
    <li>Moves that are learnt by all Pokémon and the method by which they are learnt.</li>
    <li>Moves that are learnt by a given Pokémon.</li>
    <li>Moves that are learnt by a given Pokémon and the method by which they are learnt.</li>
    <li>Moves that have a given effectiveness against a given type.</li>
    <li>Moves that are super-effective against a given Pokémon.</li>
    <li>Moves that are neutral against a given Pokémon.</li>
    <li>Moves that are not-very-effective against a given Pokémon.</li>
    <li>Moves that a given Pokémon is immune to.</li>
    <li>All moves' effectiveness against a given Pokémon.</li>
    <li>List all status moves.</li>
    <li>Ways a given Pokémon can learn a given move.</li>
    <li> Moves of a given type that a given Pokémon can learn.</li>
    <li>Moves of a given type that a given Pokémon can learn and the method by which they are
        learnt.</li>
    <li>Moves a Pokémon learns through breeding.</li>
    <li>Moves a Pokémon can learn through breeding with a given father.</li>
    <li>All Pokémon names.</li>
    <li>All Pokémon hatch times.</li>
    <li>All move names.</li>
    <li>Pokémon and their Pokédex position.</li>
    <li>All trainer data.</li>
    <li>Stats of a given Pokémon.</li>
    <li>Evolutions of a given Pokémon.</li>
    <li>Pokémon with a given move.</li>
    <li>Pokémon from each type with the highest value in a given stat.</li>
    <li>Pokémon from each type with the lowest value in a given stat.</li>
    <li>Pokémon having a minimum value of a given stat.</li>
    <li>Pokémon having a maximum value of a given stat.</li>
    <li>Pokémon which can be caught at a given location.</li>
    <li>Pokémon which can be caught at a given location from a given encounter.</li>
    <li>Pokémon which can learn a move that is super-effective on a given Pokémon.</li>
    <li>Pokémon that can be caught at a given location that can learn a move that is
        super-effective on a given Pokémon.</li>
    <li>Pokémon that a given move is super-effective against.</li>
    <li>Pokémon that a given move is neutral against.</li>
    <li>Pokémon that a given move is non-very-effective against.</li>
    <li>Pokémon that are immune to a given move.</li>
    <li>Effects a given move has on a Pokémon.</li>
    <li>All abilities Pokémon have.</li>
    <li>Pokémon with a given ability.</li>
    <li>Pokémon of a given type that can learn moves of a given type.</li>
    <li>Pokémon of a given type that can learn moves of a given type and the methods by which
        they are learnt.</li>
    <li>All teams of a given trainer.</li>
    <li>All teams with a given Pokémon.</li>
    <li>All team with a minimum level.</li>
    <li>All teams with a maximum level.</li>
    <li>Number of Pokémon per type.</li>
    <li>Types with physical damage.</li>
    <li>Types with special damage.</li>
</ul>
<h2>Interface</h2>
<p>
The project was created with an Electron front-end written in JavaScript with Vue.js. The back-end
is a Flask application written in Python. The back-end runs the queries which are requested 
through API calls from the front-end using Axios as an HTTP client. 
The application can be started with the following on Linux/macOS:
<pre>
    <code>.../3380_Project $ ./run-linux.sh</code>
</pre>
and on Windows:
<pre>
    <code>...\3380_Project>./run-windows.bat</code>
</pre>
On both, you can then visit <code>http://localhost:8080/</code> to see the application.
To close the application, press CTRL+C to close the front-end and then again to close the 
back-end.
</p>
<p>
The interface is fairly simple. There are four tabs at the top of the screen. Starting from left
to right, they are: a homepage containing information about us, a link to our repository, and
details about how to navigate through the application; a copy of this report; our 
Enhanced Entity Relation Diagram; and finally, the database interaction page.
</p>
<p>
Interacting with the database is quite simple. You can start by clicking the drop-down menu saying
"What do you want to know?" Afterwards, you can start typing to search for a specific query or 
to filter down the list, or just scroll down the list of queries until you find your desired 
query. After selecting a query, it may open up new drop-down menus to select specific parameters
of the query. When all the fields have been selected, you can click "QUERY!" to execute the 
query and the results will appear on the page. 
If you want to save a CSV file containing the results of the query, you can click download. To 
execute another query, click "NEW QUERY."
</p>
</div>
</template>

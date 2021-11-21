<template>
  <div class="root">
    <h1>ER Diagram</h1>


    <!-- THIS PIC MOVES REAL WEIRD WHEN SCALIN THE WINDOW -->
    <div class="imageContainer">
      <div class="ERdiagram"></div>
    </div>

    <h2>
      Participation Explanations:
    </h2>

      <h3>LearnsByBreeding</h3>
      <p>This is separate from the Learns table because learning 
      by breeding is a special case that has special requirements. Ternary
      Relationship between Move, a Mother Pokemon, and a Father Pokemon.
      This is because for some moves, a Pokemon can learn it when the father,
      which is not necessarily the same species as the child, knows the move
      and breeds with a mother who is of the same species as the child. Not all
      Pokemon can learn moves this way, not all moves can be learned this way,
      and not all Pokemon can pass on moves to their children. Furthermore,
      many Pokemon can pass on many moves to many different Pokemon.</p>
      <h3>Learns</h3>
      <p>All Pokemon can learn at least one move and all moves can be
      learned. The same move can be learned in several different ways, so the
      learn method is included as a part of the primary key to distinguish more
      than one instance of Learns between the same Pokemon and move.</p>
      <h3>IsType</h3>
      <p>All moves have a type, and all types are assigned to at least one
      move. Thus, there is mandatory participation from both sides. A move
      can only have one type, but one type can be assigned to many moves.</p>
      <h3>Effectiveness</h3>
      <p>All moves have an effectiveness against all types. Since all
      types need to participate in this relation with every other type, it is a
      many-to-many relationship with total participation.</p>
      <h3>HasTypes</h3>
      <p>A Pokemon always has one or two types. This means that
      all Pokemon need to participate in this relationship. The ??? type does
      not participate in this relationship because no Pokemon has that type.
      There can be multiple Pokemon with the same type and multiple types
      can assigned to one Pokemon.</p>
      <h3>EvolvesFrom</h3>
      <p>Not all Pokemon evolve and not all Pokemon evolve from
      another Pokemon, hence, there is not total participation. A Pokemon can
      only evolve from one other Pokemon, but many Pokemon can evolve from
      the same Pokemon. For instance, Flareon and Jolteon both evolve from
      Eevee.</p>
      <h3>FoundAt</h3>
      <p>Not all Pokemon can be found in the wild. Jirachi, for instance,
      is only available through special events and cannot be caught normally.
      Not all locations have Pokemon that can be found there either. For instance,
      most towns have no wild Pokemon. The same Pokemon can be
      found in many different locations and most locations where Pokemon can
      be caught have multiple different Pokemon that can be caught there.</p>
      <h3>FoughtAt</h3>
      <p>We are only tracking data about Non-Player Character trainers.
      All trainers can be fought at at least one location. Not all locations
      have trainers. Some trainers, such as your rival in the game are fought in
      several different locations throughout the game. Most locations that have
      trainers have more than one trainer.</p>
      <h3>uses</h3>
      <p>Team is a weak entity connected to a trainer through uses. All
      teams belong to exactly one trainer and one trainer, through rematches,
      may have more than one team. All NPC trainers in the game have a team,
      otherwise, they would not be a trainer.</p>
      <h3>TeamMember</h3>
      <p>All Teams have at least one Pokemon and can have more.
      Not all Pokemon are in a trainer’s team. Deoxys, for instance, is not
      in any trainer’s team. One team can have multiple different Pokemon
      as well. Since, it is possible for a team to have more than one of the
      same Pokemon, it is necessary to include the party index: MemberID as
      a way to distinguish individual party members. It should be noted that
      we did not include the moves that a team member knows because the
      data was not present in any open-source repository that we could find.
      We used Bulbapedia because it is under a creative commons license and
      it lists moves for team members of “boss” trainers, but not for most. For
      consistency’s sake, we decided to include no team member’s moves.
      2</p>

  </div>
</template>


<style>

  .imageContainer{
    align-items: center;
    width:100%;
    height:100vh;
    margin-bottom:30px;
  }

  .ERdiagram{
    background-image: url("../../../diagrams/EER.svg");
    height: 100%;
    width: 100%;
    background-position: center;
    background-size: contain;
    padding:10px;
  }

  .root{
    padding:20px;
  }

  .root h1 {
    color:gold;
  }

  .root p {
    padding-left: 14px;
    font-family: Arial, "Helvetica Neue", Helvetica, sans-serif
  }
</style>

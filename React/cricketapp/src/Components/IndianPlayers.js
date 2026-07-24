import React from "react";

function IndianPlayers() {

  const oddPlayers = [

    "Virat",

    "Gill",

    "Hardik",

    "Ashwin",

    "Bumrah"

  ];

  const evenPlayers = [

    "Rohit",

    "Rahul",

    "Jadeja",

    "Shami",

    "Siraj"

  ];

  const [odd1, odd2, odd3, odd4, odd5] = oddPlayers;

  const [even1, even2, even3, even4, even5] = evenPlayers;

  const T20Players = [

    "Virat",

    "Rohit",

    "Hardik"

  ];

  const RanjiPlayers = [

    "Pujara",

    "Rahane",

    "Saha"

  ];

  const mergedPlayers = [

    ...T20Players,

    ...RanjiPlayers

  ];

  return (

    <div>

      <h2>Odd Team Players</h2>

      <p>{odd1}</p>

      <p>{odd2}</p>

      <p>{odd3}</p>

      <p>{odd4}</p>

      <p>{odd5}</p>

      <hr/>

      <h2>Even Team Players</h2>

      <p>{even1}</p>

      <p>{even2}</p>

      <p>{even3}</p>

      <p>{even4}</p>

      <p>{even5}</p>

      <hr/>

      <h2>Merged Team</h2>

      {mergedPlayers.map((player,index)=>(

        <p key={index}>{player}</p>

      ))}

    </div>

  );

}

export default IndianPlayers;
import React from "react";

function ListOfPlayers() {

  const players = [

    { name: "Virat Kohli", score: 95 },

    { name: "Rohit Sharma", score: 82 },

    { name: "Shubman Gill", score: 65 },

    { name: "KL Rahul", score: 74 },

    { name: "Hardik Pandya", score: 68 },

    { name: "Ravindra Jadeja", score: 72 },

    { name: "R Ashwin", score: 50 },

    { name: "Mohammed Shami", score: 80 },

    { name: "Jasprit Bumrah", score: 60 },

    { name: "Mohammed Siraj", score: 45 },

    { name: "Kuldeep Yadav", score: 71 }

  ];

  const below70 = players.filter(player => player.score < 70);

  return (

    <div>

      <h2>List of Players</h2>

      {players.map((player,index)=>(

        <p key={index}>

          {player.name} - {player.score}

        </p>

      ))}

      <hr/>

      <h2>Players with Score Below 70</h2>

      {below70.map((player,index)=>(

        <p key={index}>

          {player.name} - {player.score}

        </p>

      ))}

    </div>

  );

}

export default ListOfPlayers;
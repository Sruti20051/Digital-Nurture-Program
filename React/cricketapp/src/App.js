import './App.css';

import ListOfPlayers from './Components/ListOfPlayers';

import IndianPlayers from './Components/IndianPlayers';

function App() {

  const flag = false;

  if(flag)

  {

    return(

      <div>

        <ListOfPlayers/>

      </div>

    );

  }

  else

  {

    return(

      <div>

        <IndianPlayers/>

      </div>

    );

  }

}

export default App;
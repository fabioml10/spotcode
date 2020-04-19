import React, { Fragment } from 'react';
import 'react-bulma-components/dist/react-bulma-components.min.css';
import { Button } from 'react-bulma-components';
import 'app.scss';
 
const App = () => {
  return(
    //fragment envelopa os codigos
    <Fragment>
      Hello App!<br></br>
      <Button color="primary">Testando o Bulma</Button>
    </Fragment>
  );
}

export default App;

import React from 'react';
import {
  BrowserRouter as Router,
  Route,
  Switch
} from 'react-router-dom';

const App = () => (
  <Router>
    <div className='post'>
      <Switch>
        <Route exact path='/posts' />
      </Switch>
    </div>
  </Router>
);

export default App;

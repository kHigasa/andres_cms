import React from 'react';
import {
  BrowserRouter as Router,
  Route,
  Switch
} from 'react-router-dom';
import SignUp from './SignUp';
import LogIn from './LogIn';

const App = () => (
  <Router>
    <div className='user'>
      <Switch>
        <Route exact path='/users/sign_up' component={SignUp} />
        <Route exact path='/users/sign_in' component={LogIn} />
      </Switch>
    </div>
  </Router>
);

export default App;

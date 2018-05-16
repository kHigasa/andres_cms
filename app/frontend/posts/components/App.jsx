import React from 'react';
import {
  BrowserRouter as Router,
  Route,
  Switch
} from 'react-router-dom';
import PostIndex from './PostIndex';

const App = () => (
  <Router>
    <div className='post'>
      <Switch>
        <Route exact path='/posts' component={PostIndex} />
      </Switch>
    </div>
  </Router>
);

export default App;

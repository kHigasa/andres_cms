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
      <ul>
        <li><a href="/posts">PostIndex</a></li>
      </ul>
      <Switch>
        <Route exact path='/' component={PostIndex} />
      </Switch>
    </div>
  </Router>
);

export default App;

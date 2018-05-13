import React from 'react';
import {
  BrowserRouter as Router,
  Route
} from 'react-router-dom';
import PostIndex from './PostIndex';

const App = () => (
  <Router>
    <div>
      <Route
        path='/posts'
        component={PostIndex}
      />
    </div>
  </Router>
);

export default App;

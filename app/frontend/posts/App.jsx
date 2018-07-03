import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

import IndexPosts from './containers/Posts/IndexPosts/IndexPosts';
import ShowPost from './containers/Posts/ShowPost/ShowPost';
// import NewPost from './containers/Posts/NewPost/NewPost';

const app = () => (
  <Router>
    <Switch>
      <Route exact path='/posts' component={IndexPosts} />
      <Route path='/posts/:id' component={ShowPost} />
    </Switch>
  </Router>
);

export default app;

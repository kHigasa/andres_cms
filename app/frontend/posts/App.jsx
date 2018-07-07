import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

// import IndexPosts from './containers/Posts/IndexPosts/IndexPosts';
// import ShowPost from './containers/Posts/ShowPost/ShowPost';
import NewPost from './containers/Posts/NewPost/NewPost';
import EditPost from './containers/Posts/EditPost/EditPost';

const app = () => (
  <Router>
    <Switch>
      <Route exact path='/posts/new' component={NewPost} />
      <Route path='/posts/:id' component={EditPost} />
    </Switch>
  </Router>
);

export default app;

import React from 'react';
import { Route, Switch } from 'react-router-dom';

import IndexPosts from './containers/Posts/IndexPosts/IndexPosts';
import NewPost from './containers/Posts/NewPost/NewPost';

const app = (
  <div>
    <Switch>
      <Route path='/posts/new' component={NewPost} />
      <Route exact path='/posts' component={IndexPosts} />
    </Switch>
  </div>
);

export default app;

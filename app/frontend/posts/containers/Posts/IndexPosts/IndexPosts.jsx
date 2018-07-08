import React, { Component } from 'react';
import { Route } from 'react-router-dom';

import axios from '../../../axios-posts';
import ShowPost from '../ShowPost/ShowPost';
import Post from '../../../components/Posts/Post/Post';

class IndexPosts extends Component {
  state = {
    posts: [],
    error: false
  }

  componentDidMount() {
    axios.get('/')
      .then((res) => {
        const posts = res.data;
        this.setState({posts});
      })
      .catch((err) => {
        console.log(err)
        this.setState({error: true});
      });
  }

  postSelectedHandler = (id) => {
    this.props.history.push('/posts/' + id);
  }

  render() {
    let posts = <p>Something went wrong.</p>;
    if (!this.state.error && this.state.posts) {
      posts = this.state.posts.map(post => (
        <Post
          key={post.id}
          title={post.title}
          lead_sentence={post.lead_sentence}
          clicked={() => this.postSelectedHandler(post.id)}
        />
      ));
    }

    return (
      <div>
        <div>{posts}</div>
        <Route
          path={this.props.match.url + '/:id'}
          exact
          component={ShowPost}
        />
      </div>
    );
  }
}

export default IndexPosts;

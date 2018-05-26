import React, { Component } from 'react';
import axios from 'axios';
import PostShow from './PostShow';

class PostIndex extends Component {
  constructor () {
    super();
    this.state = {
      posts: []
    };
  }

  componentDidMount () {
    axios.get('/posts')
         .then((posts) => {
           this.setState({ posts: posts.data });
         })
         .catch((e) => {
           /*eslint no-console: ["error", { allow: ["warn", "error"] }] */
           console.error(e);
         });
  }

  render () {
    return (
      <div className='post'>
        <div className='postTitle'>
          {this.state.posts.map(post =>
            <PostShow post={post} key={post.id} />
          )}
        </div>
      </div>
    );
  }
}

export default PostIndex;

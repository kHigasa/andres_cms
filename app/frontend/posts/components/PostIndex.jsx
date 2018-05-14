import React, { Component } from 'react';
import axios from 'axios';

class PostIndex extends Component {
  constructor () {
    super();
    this.state = {
      post: {
        id: 1
      }
    };
  }

  componentDidMount () {
    this.fetchPost (this.state.post.id);
  }

  fetchPost (id) {
    axios.get(`api/posts/${id}`)
         .then((response) => {
           this.setState({ post: response.data });
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
          {this.state.post.title}
          {this.state.post.lead_sentence}
        </div>
      </div>
    );
  }
}

export default PostIndex;

import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';

class PostIndex extends Component {
  constructor () {
    super();
    this.state = {
      post: {}
    };
  }

  componentDidMount () {
    this.fetchPost (this.props.id);
  }

  fetchPost (id) {
    axios.get(`api/v1/posts/${id}`)
         .then((response) => {
           this.setState({ post: response.data });
         })
         .catch((e) => {
           /*eslint no-console: ["error", { allow: ["warn", "error"] }] */
           console.error(e);
         });
  }

  render () {
    const post = this.state.post;
    return (
      <div className='post'>
        <div className='postTitle'>
          {post.title}
        </div>
      </div>
    );
  }
}

PostIndex.propTypes = {
  id: PropTypes.number
};

PostIndex.defaultProps = {
  id: ''
};

export default PostIndex;

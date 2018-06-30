import React, { Component } from 'react';

import axios from '../../../axios-posts';
import Post from '../../../components/Posts/Post/Post';
import './IndexPosts.css';

class IndexPosts extends Component {
  state = {
    posts: [],
    selectedPostId: null,
    loading: true,
    error: null
  }

  componentDidMount() {
    axios.get('/')
      .then((res) => {
        const setPosts = [];
        for (const key in res.data) {
          setPosts.push({
            ...res.data[key],
            id: key
          });
        }
        this.setState({loading: false, posts: setPosts});
      })
      .catch((err) => {
        this.setState({loading: false, error: err});
      });
  }

  postSelectHandler = (id) => {
    this.setState({selectedPostId: id});
  }

  render() {
    let posts = <p>{this.state.error}</p>;
    if (this.state.error.null) {
      posts = this.state.posts.map((post) => {
        <Post
          key={post.id}
          title={post.title}
          lead_sentence={post.lead_sentence}
          clicked={() => this.postSelectedHandler(post.id)}
        />;
      });
    }

    return (
      <div>
        {posts}
      </div>
    );
  }
}

export default IndexPosts;

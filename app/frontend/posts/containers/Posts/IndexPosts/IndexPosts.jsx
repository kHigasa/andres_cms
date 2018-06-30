import React, { Component } from 'react';

import axios from '../../../axios-posts';
import Post from '../../../components/Posts/Post/Post';
import './IndexPosts.css';

class IndexPosts extends Component {
  state = {
    posts: [],
    selectedPostId: null,
    loading: true,
    error: false
  }

  componentDidMount() {
    axios.get('/')
      .then((res) => {
        console.log(res.data);
        const posts = res.data;
        this.setState({loading: false, posts});
      })
      .catch((err) => {
        console.log(err)
        this.setState({loading: false, error: true});
      });
  }

  postSelectHandler = (id) => {
    this.setState({selectedPostId: id});
  }

  render() {
    let posts = <p>Something went wrong.</p>;
    if (!this.state.error) {
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
        {posts}
      </div>
    );
  }
}

export default IndexPosts;

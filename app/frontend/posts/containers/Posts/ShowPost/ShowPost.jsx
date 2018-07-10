import React, { Component } from 'react';

import axios from '../../../axios-posts';
import DisplayPost from '../../../components/Post/DisplayPost/DisplayPost';

class ShowPost extends Component {
  state = {
    post: null,
    error: false
  }

  componentDidMount() {
    if (this.props.match.params.id) {
      if (!this.state.post) {
        axios.get('/' + this.props.match.params.id)
          .then((res) => {
            const post = res.data;
            this.setState({post});
            console.log(post)
          })
          .catch((err) => {
            console.log(err)
            this.setState({error: true});
          });
      }
    }
  }

  render() {
    let post = <p>Something went wrong.</p>;
    if (!this.state.error  && this.state.post) {
      post = <DisplayPost
               key={this.state.post.id}
               title={this.state.post.title}
               lead_sentence={this.state.post.lead_sentence}
             />;
    }

    return (
      <div>
        <h4>{post}</h4>
      </div>
    );
  }
}

export default ShowPost;

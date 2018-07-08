import React, { Component } from 'react';

import PostItemField from '../components/PostItemField';
import PostItemButton from '../components/PostItemButton';

class PostItemFields extends Component {
  state = {
    clicked: false
  }

  addTagHandler = (e) => {
    e.preventDefault();
    this.setState({ clicked: true });
  }

  render() {
    let postItemField = null;
    if (this.state.clicked) {
      postItemField = <PostItemField />;
    }
    return (
      <div>
        {postItemField}
        <PostItemButton clicked={e => this.addTagHandler(e)} />
      </div>
    );
  }
}

export default PostItemFields;

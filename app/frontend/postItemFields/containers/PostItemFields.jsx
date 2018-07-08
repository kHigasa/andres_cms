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
    let tagField = null;
    if (this.state.clicked) {
      tagField = <PostItemField />;
    }
    return (
      <div>
        {tagField}
        <PostItemButton clicked={e => this.addTagHandler(e)} />
      </div>
    );
  }
}

export default PostItemFields;

import React, { Component } from 'react';

import PostItemForm from './PostItemForm/PostItemForm';
import DropzoneImage from '../DropzoneImage/DropzoneImage';

class PostItemsForm extends Component {
  render() {
    return (
      <div>
        <PostItemForm />
        <DropzoneImage />
      </div>
    );
  }
}

export default PostItemsForm;

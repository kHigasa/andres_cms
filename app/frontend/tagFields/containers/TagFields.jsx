import React, { Component } from 'react';

import TagField from '../components/TagField';
import TagButton from '../components/TagButton';

class TagFields extends Component {
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
      tagField = <TagField />;
    }
    return (
      <div>
        {tagField}
        <TagButton clicked={e => this.addTagHandler(e)} />
      </div>
    );
  }
}

export default TagFields;

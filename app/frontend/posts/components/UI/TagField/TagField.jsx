import React, { Component } from 'react';
import { WithContext as ReactTags } from 'react-tag-input';

class TagField extends Component {
  constructor(props) {
    super(props);
    this.state = {
      tags: [{ id: 1, text: "Thailand" }, { id: 2, text: "India" }]
    };
    this.handleDelete = this.handleDelete.bind(this);
    this.handleAddition = this.handleAddition.bind(this);
    this.handleDrag = this.handleDrag.bind(this);
    this.handleTagClick = this.handleTagClick.bind(this);
  }

  handleDelete(i) {
    this.setState({
      tags: this.state.tags.filter((tag, index) => index !== i),
    });
  }

  handleAddition(tag) {
    let { tags } = this.state;
    this.setState({ tags: [...tags, { id: tags.length + 1, text: tag }] });
  }

  handleDrag(tag, currPos, newPos) {
    const tags = [...this.state.tags];

    // mutate array
    tags.splice(currPos, 1);
    tags.splice(newPos, 0, tag);

    // re-render
    this.setState({ tags });
  }

  handleTagClick(index) {
    console.log('The tag at index ' + index + ' was clicked');
  }

  render() {
    const { tags, suggestions } = this.state;
    return (
      <div id="app">
        <h4>ReactTags Demo</h4>
        <ReactTags
          tags={tags}
          suggestions={suggestions}
          handleDelete={this.handleDelete}
          handleAddition={this.handleAddition}
          handleDrag={this.handleDrag}
          handleTagClick={this.handleTagClick}
        />
      </div>
    );
  }
}

export default TagField;

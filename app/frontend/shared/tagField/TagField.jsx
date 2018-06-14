import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { WithContext as ReactTags } from 'react-tag-input';

const propTypes = {
  tags: PropTypes.arrayOf(PropTypes.shape({
    text: PropTypes.string,
  })),
  suggestions: PropTypes.arrayOf(PropTypes.shape({
    text: PropTypes.string,
  })),
  handleAddTag: PropTypes.func.isRequired,
  handleDeleteTag: PropTypes.func.isRequired,
};

const defaultProps = {
  tags: [],
  suggestions: [],
};

class TagField extends Component {
  constructor(props) {
    super(props);

    this.state = {
      tags: [],
      suggestions: [],
    };

    this.handleDeleteTag = this.handleDeleteTag.bind(this);
    this.handleAddTag = this.handleAddTag.bind(this);
  }

  componentWillReceiveProps(nextProps) {
    this.setState({
      tags: nextProps.tags,
      suggestions: nextProps.suggestions,
    });
  }

  handleDeleteTag(sortRank) {
    this.props.handleDeleteTag(sortRank);
  }

  handleAddTag(text) {
    this.props.handleAddTag({ text });
  }

  render() {
    const tags = this.state.tags;
    const suggestions = this.state.suggestions;
    return (
      <div>
        <ReactTags
          tags={tags}
          suggestions={suggestions}
          handleDelete={this.handleDeleteTag}
          handleAddition={this.handleAddTag}
          autofocus={false}
          autocomplete={1}
          minQueryLength={1}
          placeholder="Tag Name"
        />
      </div>
    );
  }
}

TagField.propTypes = propTypes;

TagField.defaultProps = defaultProps;

export default TagField;

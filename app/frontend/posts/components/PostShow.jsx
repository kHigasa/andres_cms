import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';

class PostShow extends PureComponent {
  render() {
    return (
      <div>
        <li>
          <h3>
            {this.props.post.id}
            {this.props.post.title}
          </h3>
          <p>{this.props.post.lead_sentence}</p>
        </li>
      </div>
    );
  }
}

PostShow.propTypes = {
  post: PropTypes.shape({
      id: PropTypes.number,
      title: PropTypes.string,
      lead_sentence: PropTypes.string
    }).isRequired
};

export default PostShow;

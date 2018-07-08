import React from 'react';
import PropTypes from 'prop-types';

const displayPost = props => (
  <article>
    <h4 className='title'>{props.title}</h4>
    <p>{props.lead_sentence}</p>
  </article>
);

displayPost.propTypes = {
  title: PropTypes.string.isRequired,
  lead_sentence: PropTypes.string.isRequired
};

export default displayPost;

import React from 'react';
import PropTypes from 'prop-types';

const post = props => (
  <article className='Post'>
    <h4 className='title'>{props.title}</h4>
    <p>{props.lead_sentence}</p>
  </article>
);

post.propTypes = {
  title: PropTypes.string.isRequired,
  lead_sentence: PropTypes.string.isRequired
};

export default post;

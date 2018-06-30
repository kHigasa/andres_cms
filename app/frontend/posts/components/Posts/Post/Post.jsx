import React from 'react';
import PropTypes from 'prop-types';

import classes from './Post.css';

const post = props => (
  <article className={classes.Post}>
    <h3>{props.title}</h3>
    <p>{props.lead_sentence}</p>
  </article>
);

post.propTypes = {
  title: PropTypes.string.isRequired,
  lead_sentence: PropTypes.string.isRequired
};

export default post;

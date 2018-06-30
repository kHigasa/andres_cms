import React from 'react';

import geilLogo from '../../../../packs/images/geil.png';
import classes from './Logo.css';

const logo = props => (
  <div className={classes.Logo} style={{height: props.height}}>
    <img src={geilLogo} alt='学生団体GEIL' />
  </div>
);

export default logo;

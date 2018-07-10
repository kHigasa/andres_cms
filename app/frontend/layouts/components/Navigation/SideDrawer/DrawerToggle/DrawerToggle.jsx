import React from 'react';
import PropTypes from 'prop-types';

const drawerToggle = props => (
  <div className='DrawerToggle' onClick={props.clicked}>
    <div />
    <div />
    <div />
  </div>
);

drawerToggle.propTypes = {
  clicked: PropTypes.func.isRequired
};

export default drawerToggle;

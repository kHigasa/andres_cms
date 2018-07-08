import React from 'react';
import PropTypes from 'prop-types';

import Logo from '../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';
import Backdrop from '../../../../posts/components/UI/Backdrop/Backdrop';
import Aux from '../../../../posts/hoc/Aux/Aux';

const sideDrawer = (props) => {
    let attachedClasses = ['SideDrawer', 'sideDrawerClose'];
    if (props.open) {
        attachedClasses = ['SideDrawer', 'sideDrawerOpen'];
    }
    return (
      <Aux>
        <Backdrop show={props.open} clicked={props.closed} />
        <div className={attachedClasses.join(' ')}>
          <div className='sideDrawerLogo'>
            <Logo />
          </div>
          <nav>
            <NavigationItems />
          </nav>
        </div>
      </Aux>
    );
};

sideDrawer.propTypes = {
  open: PropTypes.bool.isRequired,
  closed: PropTypes.func.isRequired
};

export default sideDrawer;

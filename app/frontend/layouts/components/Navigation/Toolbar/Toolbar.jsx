import React from 'react';
import PropTypes from 'prop-types';

import Logo from '../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';
import DrawerToggle from '../SideDrawer/DrawerToggle/DrawerToggle';

const toolbar = props => (
  <header className='Toolbar'>
    <DrawerToggle clicked={props.drawerToggleClicked} />
    <div className='toolbarLogo'>
      <Logo />
    </div>
    <nav className='toolbarDesktopOnly'>
      <NavigationItems />
    </nav>
  </header>
);

toolbar.propTypes = {
  drawerToggleClicked: PropTypes.func.isRequired
};

export default toolbar;

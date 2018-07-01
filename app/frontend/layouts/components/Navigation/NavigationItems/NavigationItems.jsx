import React from 'react';
import { BrowserRouter as Router } from 'react-router-dom';

import NavigationItem from './NavigationItem/NavigationItem';

const navigationItems = () => (
  <Router>
    <ul className='NavigationItems'>
      <NavigationItem link='/' exact>Home</NavigationItem>
      <NavigationItem link='/about' exact>About</NavigationItem>
      <NavigationItem link='/posts' exact>Posts</NavigationItem>
      <NavigationItem link='/histories' exact>Histories</NavigationItem>
      <NavigationItem link='/supporters' exact>Supporters</NavigationItem>
      <NavigationItem link='/contact' exact>Contact</NavigationItem>
      <NavigationItem link='/faq' exact>FAQ</NavigationItem>
    </ul>
  </Router>
);

export default navigationItems;

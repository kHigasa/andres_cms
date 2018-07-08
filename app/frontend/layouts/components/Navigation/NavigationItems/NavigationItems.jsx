import React from 'react';

import NavigationItem from './NavigationItem/NavigationItem';

const navigationItems = () => (
  <ul className='NavigationItems'>
    <NavigationItem toLink='/' exact>Home</NavigationItem>
    <NavigationItem toLink='/about' exact>About</NavigationItem>
    <NavigationItem toLink='/posts' exact>Posts</NavigationItem>
    <NavigationItem toLink='/histories' exact>Histories</NavigationItem>
    <NavigationItem toLink='/supporters' exact>Supporters</NavigationItem>
    <NavigationItem toLink='/contact' exact>Contact</NavigationItem>
    <NavigationItem toLink='/faq' exact>FAQ</NavigationItem>
  </ul>
);

export default navigationItems;

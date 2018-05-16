import React from 'react';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import AppBar from 'material-ui/AppBar';

const NavigationBar = () => (
  <MuiThemeProvider>
    <AppBar
      title='Title'
      iconClassNameRight='muidocs-icon-navigation-expand-more'
    />
  </MuiThemeProvider>
);

export default NavigationBar;

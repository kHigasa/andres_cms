import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import { AppBar, MenuItem, Drawer } from 'material-ui';

class NavigationBar extends PureComponent {
  render() {
    return (
      <MuiThemeProvider>
        <div>
          <Drawer
            docked={false}
            width={200}
            open={this.props.open}
            onRequestChange={() => this.props.onToggle()}
          >
            <a href='/posts'><MenuItem>PostIndex</MenuItem></a>
          </Drawer>
          <AppBar
            title='Title'
            onClick={() => this.props.onToggle()}
          />
        </div>
      </MuiThemeProvider>
    );
  }
}

NavigationBar.propTypes = {
  open: PropTypes.bool.isRequired,
  onToggle: PropTypes.func.isRequired
};

export default NavigationBar;

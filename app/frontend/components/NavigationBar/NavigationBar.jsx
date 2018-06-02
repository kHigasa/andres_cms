import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import {
  AppBar, Toolbar, Typography, IconButton, MenuItem, Menu,
  Drawer, List, Divider
} from '@material-ui/core';
import AccountCircle from '@material-ui/icons/AccountCircle';
import MenuIcon from '@material-ui/icons/Menu';
import titleImage from './images/title.png';

const styles = {
  root: {
    flexGlow: 1
  },
  flex: {
    flex: 1
  },
  menuButton: {
    marginLeft: -12,
    marginRight: 20
  },
  list: {
    width: 250
  },
  fullList: {
    width: 'auto'
  }
};

class NavigationBar extends Component {
  constructor() {
    super();
    this.state = {
      auth: true,
      anchorEl :null,
      left: false
    };
  }

  handleMenu = (e) => {
    this.setState({ anchorEl: e.currentTarget });
  }

  handleClose = () => {
    this.setState({ anchorEl: null });
  }

  toggleDrawer = (side, open) => () => {
    this.setState({
      [side]: open
    });
  }

  render() {
    const { classes } = this.props;
    const { auth, anchorEl } = this.state;
    const open = Boolean(anchorEl);
    const sideList = (
      <div className={classes.list}>
        <a href="/"><List>About</List></a>
        <Divider />
        <a href="/posts"><List>Posts</List></a>
        <Divider />
        <a href="/"><List>History</List></a>
        <Divider />
        <a href="/"><List>Supporters</List></a>
        <Divider />
        <a href="/"><List>Contact</List></a>
      </div>
    );

    return (
      <div className={classes.root}>
        <Drawer
          open={this.state.left}
          onClose={this.toggleDrawer('left', false)}
        >
          <div
            tabIndex={0}
            role='button'
            onClick={this.toggleDrawer('left', false)}
            onKeyDown={this.toggleDrawer('left', false)}
          >
            {sideList}
          </div>
        </Drawer>
        <AppBar>
          <Toolbar>
            <IconButton className={classes.menuButton} color="inherit" aria-label="Menu">
              <MenuIcon  onClick={this.toggleDrawer('left', true)} />
            </IconButton>
            <Typography variant="title" color="inherit" className={classes.flex}>
              <a href="/">
                <img src={titleImage} alt='titleImage' className='titleImage' width="28" height="28" />GEIL
              </a>
            </Typography>
            {auth && (
              <div>
                <IconButton
                  aria-owns={open ? 'menu-appbar' : null}
                  aria-haspopup="true"
                  onClick={this.handleMenu}
                  color="inherit"
                >
                  <AccountCircle />
                </IconButton>
                <Menu
                  id="menu-appbar"
                  anchorEl={anchorEl}
                  anchorOrigin={{
                    vertical: 'top',
                    horizontal: 'right',
                  }}
                  transformOrigin={{
                    vertical: 'top',
                    horizontal: 'right',
                  }}
                  open={open}
                  onClose={this.handleClose}
                >
                  <MenuItem onClick={this.handleClose}>Profile</MenuItem>
                  <MenuItem onClick={this.handleClose}>My account</MenuItem>
                </Menu>
              </div>
            )}
          </Toolbar>
        </AppBar>
      </div>
    );
  }
}

NavigationBar.propTypes = {
  classes: PropTypes.object.isRequired // eslint-disable-line react/forbid-prop-types
};

export default withStyles(styles)(NavigationBar);

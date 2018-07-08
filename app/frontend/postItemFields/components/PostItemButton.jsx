import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import AddIcon from '@material-ui/icons/Add';

const styles = theme => ({
  button: {
    margin: theme.spacing.unit
  }
});

function postItemButton(props) {
  const { classes } = props;
  return (
    <div>
      <Button variant='fab' color='secondary' aria-label='add' className={classes.button} onClick={props.clicked}>
        <AddIcon />
      </Button>
    </div>
  );
}

postItemButton.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles)(postItemButton);

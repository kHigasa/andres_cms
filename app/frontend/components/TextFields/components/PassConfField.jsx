import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';

const styles = theme => ({
  container: {
    display: 'flex',
    flexWrap: 'wrap',
  },
  textField: {
    marginLeft: theme.spacing.unit,
    marginRight: theme.spacing.unit,
    width: 200,
  }
});

class PassConfField extends React.PureComponent {
  render() {
    const { classes } = this.props;
    return (
      <form className={classes.container} noValidate autoComplete="off">
        <TextField
          id="password"
          label="PasswordConfirmation"
          className={classes.textField}
          type="password"
          autoComplete="current-password"
          margin="normal"
        />
      </form>
    );
  }
}

PassConfField.propTypes = {
  classes: PropTypes.object.isRequired // eslint-disable-line react/forbid-prop-types
};

export default withStyles(styles)(PassConfField);

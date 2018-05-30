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

class LoginField extends React.PureComponent {
  render() {
    const { classes } = this.props;
    return (
      <form className={classes.container} noValidate autoComplete="off">
        <TextField
          id="login"
          label="username or email"
          placeholder="foobar or hogehoge@example.com"
          className={classes.textField}
          margin="normal"
        />
      </form>
    );
  }
}

LoginField.propTypes = {
  classes: PropTypes.object.isRequired // eslint-disable-line react/forbid-prop-types
};

export default withStyles(styles)(LoginField);

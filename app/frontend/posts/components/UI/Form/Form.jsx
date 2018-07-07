import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import MenuItem from '@material-ui/core/MenuItem';
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
  },
  menu: {
    width: 200,
  },
});

const form = (props) => {
  const { classes } = this.props;
  let formElement = nill;
  const formIds = [];

  if (props.invalid && props.shouldValidate && props.touched) {
    formIds.push('error');
  }

  let validationError = null;
  if (props.invalid && props.touched) {
    validationError = <p className={classes.ValidationError}>{props.errorMessage}</p>;
  }

  switch ( props.elementType ) {
      case ( 'textarea' ):
          formElement = (
            <TextField
              id={formIds.join(' ')}
              label=''
              className={classes.textField}
              type='password'
              margin='normal'
              {...props.elementConfig}
              value={props.value}
              onChange={props.changed}
            />);
          break;
      case ( 'longTextarea' ):
          formElement = (
            <TextField
              id='full-width'
              label='Label'
              InputLabelProps={{
                shrink: true,
              }}
              placeholder=''
              fullWidth
              margin='normal'
              {...props.elementConfig}
              value={props.value}
              onChange={props.changed}
            />);
          break;
      case ( 'select' ):
          formElement = (
              <select
                  className={inputClasses.join(' ')}
                  value={props.value}
                  onChange={props.changed}>
                  {props.elementConfig.options.map(option => (
                      <option key={option.value} value={option.value}>
                          {option.displayValue}
                      </option>
                  ))}
              </select>
          );
          break;
      default:
          inputElement = <input
              className={inputClasses.join(' ')}
              {...props.elementConfig}
              value={props.value}
              onChange={props.changed} />;
  }

  return (
    <div></div>
  )
}

export default form;

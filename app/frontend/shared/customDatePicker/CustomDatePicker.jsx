import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { DatePicker } from 'material-ui-pickers';

const propTypes = {
  value: PropTypes.string,
  onChange: PropTypes.func.isRequired
};

const defaultProps = {
  value: ''
};

class CustomDatePicker extends Component {
  constructor() {
    super();
    this.onChange = this.onChange.bind(this);
  }

  onChange(e, date) {
    if (this.props.onChange) {
      this.props.onChange(date);
    }
  }

  render() {
    let props;
    if (this.props.value) {
      props = {...this.props, value: new Date(this.props.value)};
    } else {
      props = this.props;
    }

    return (
      <DatePicker {...props} onChange={this.onChange} />
    );
  }
}

CustomDatePicker.propTypes = propTypes;

CustomDatePicker.defaultProps = defaultProps;

export default CustomDatePicker;

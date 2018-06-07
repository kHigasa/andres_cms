import React from 'react';
import PropTypes from 'prop-types';

class HelloWorld extends React.PureComponent {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string.isRequired
};

export default HelloWorld;

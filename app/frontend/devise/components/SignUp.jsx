import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';
import NameField from '../../components/TextFields/components/NameField';
import EmailField from '../../components/TextFields/components/EmailField';
import PassField from '../../components/TextFields/components/PassField';
import PassConfField from '../../components/TextFields/components/PassConfField';

class SignUp extends Component {
  constructor() {
    super();
    this.handleSignUp = this.handleSignUp.bind(this);
  }

  handleSignUp(e) {
    e.preventDefault();
    axios.post('/users', {
      user: {
        username: document.getElementById('username').value,
        email: document.getElementById('email').value,
        password: document.getElementById('password').value,
        passwordConfirmation: document.getElementById('passwordConfirmation').value
      }
    })
    .then((response) => {
      this.props.updateCurrentUser(response.data.email);
    })
    .catch((e) => {
      /*eslint no-console: ['error', { allow: ['warn', 'error'] }] */
      console.error(e);
    });
  }

  render() {
    return (
      <div>
        <h2>SignUp From React</h2>
        <NameField />
        <EmailField />
        <PassField />
        <PassConfField />
        <button onClick={this.handleSignUp}>SignUp From React</button>
      </div>
    );
  }
}

SignUp.propTypes = {
  updateCurrentUser: PropTypes.func.isRequired
};

export default SignUp;

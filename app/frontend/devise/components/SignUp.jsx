import React, { Component } from 'react';
import axios from 'axios';
import NameField from '../../components/TextFields/components/NameField';
import EmailField from '../../components/TextFields/components/EmailField';
import PassField from '../../components/TextFields/components/PassField';
import PassConfField from '../../components/TextFields/components/PassConfField';

const getCsrfToken = () => {
  if (!(axios.defaults.headers.common['X-CSRF-Token'])) {
    return (
      document.getElementsByName('csrf-token')[0].getAttribute('content')
    );
  } else {
    return (
      axios.defaults.headers.common['X-CSRF-Token']
    );
  }
};

const setAxiosDefaults = () => {
  axios.defaults.headers.common['X-CSRF-Token'] = getCsrfToken();
  axios.defaults.headers.common['Accept'] = 'application/json';
};

setAxiosDefaults();

const updateCsrfToken = (csrf_token) => {
  axios.defaults.headers.common['X-CSRF-Token'] = csrf_token;
};

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
      updateCsrfToken(response.data.csrf_token);
      return(response);
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

export default SignUp;

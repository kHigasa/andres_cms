import React, { Component } from 'react';
import axios from 'axios';
import LoginField from '../../components/TextFields/components/LoginField';
import PassField from '../../components/TextFields/components/PassField';

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

class LogIn extends Component {
  constructor() {
    super();
    this.handleLogIn = this.handleLogIn.bind(this);
  }

  handleLogIn(e) {
    e.preventDefault();
    axios.post('/users/sign_in', {
      user: {
        login: document.getElementById('login').value,
        password: document.getElementById('password').value
      }
    })
    .then((response) => {
      updateCsrfToken(response.data.csrf_token);
      return (response);
    })
    .catch((e) => {
      /*eslint no-console: ['error', { allow: ['warn', 'error'] }] */
      console.error(e);
    });
  }

  render() {
    return (
      <div>
        <h2>LogIn From React</h2>
        <LoginField />
        <PassField />
        <button onClick={this.handleLogIn}>LogIn From React</button>
      </div>
    );
  }
}

export default LogIn;

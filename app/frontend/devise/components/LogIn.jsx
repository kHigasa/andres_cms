import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';
import LoginField from '../../components/TextFields/components/LoginField';
import PassField from '../../components/TextFields/components/PassField';

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
      this.props.updateCurrentUser(response.data.login);
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

LogIn.propTypes = {
  updateCurrentUser: PropTypes.func.isRequired
};

export default LogIn;

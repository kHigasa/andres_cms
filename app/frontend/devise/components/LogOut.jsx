import React from 'react';
import axios from 'axios';

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

class LogOut extends React.Component {
  constructor() {
    super();
    this.handleLogOut = this.handleLogOut.bind(this);
  }

  handleLogOut(e) {
    e.preventDefault();
    axios.delete('/users/sign_out', {})
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
        <button onClick={this.handleLogOut}>LogOut</button>
      </div>
    );
  }
}

export default LogOut;

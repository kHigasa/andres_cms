import React, { Component } from 'react';
import axios from 'axios';
import {
  BrowserRouter as Router,
  Route,
  Switch
} from 'react-router-dom';
import SignUp from './SignUp';
import LogIn from './LogIn';

class App extends Component {
  constructor() {
    super();
    this.state = {
      currentUser: null
    };
    this.updateCurrentUser = this.updateCurrentUser.bind(this);
  }

  componentDidMount() {
    axios.get('/users/sign_in', {})
         .then((response) => {
           if(response.data.login) {
             this.setState({
               currentUser: response.data.login
             });
           } else {
             this.setState({
               currentUser: null
             });
           }
         })
         .catch((e) => {
           /*eslint no-console: ["error", { allow: ["warn", "error"] }] */
           console.error(e);
         });
  }

  updateCurrentUser(login) {
    this.setState({
      currentUser: login
    });
  }

  render() {
    return (
      <Router>
        <div className='user'>
          <div>
            {this.state.currentUser}
          </div>
          <Switch>
            <Route exact path='/users/sign_up' component={SignUp} />
            <Route exact path='/users/sign_in' component={LogIn} />
          </Switch>
        </div>
      </Router>
    );
  }
}

export default App;

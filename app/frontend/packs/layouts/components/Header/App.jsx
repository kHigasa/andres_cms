import React, { Component } from 'react';
import NavigationBar from './NavigationBar';

class App extends Component {
  constructor() {
    super();
    this.state = {
      open: false
    };
  }

  handleToggle() {
    this.setState({
      open: !this.state.open
    });
  }

  render() {
    return (
      <div>
        <NavigationBar />
      </div>
    );
  }
}

export default App;

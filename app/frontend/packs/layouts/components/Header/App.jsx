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
        <NavigationBar
          onToggle={() => this.handleToggle()}
          open={this.state.open}
        />
      </div>
    );
  }
}

export default App;

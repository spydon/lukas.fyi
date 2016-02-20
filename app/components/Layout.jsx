import React from 'react';
import Navigation from './Navigation.jsx';

export default class Layout extends React.Component {
  render() {
    return (
      <div className="App">
        <Navigation />
        <div className="page">
          {this.props.children}
        </div>
     </div>
    );
  }
}


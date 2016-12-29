import React from 'react';

export default class Layout extends React.Component {
  render() {
    return (
      <div className="App">
        <div className="page">
          {this.props.children}
        </div>
     </div>
    );
  }
}


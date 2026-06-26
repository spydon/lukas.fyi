import React from 'react';
import Card from './Card.jsx';

export default class Home extends React.Component {
  render() {
    return (
      <div className="container" role="main">
        <Card visible={false} />
      </div>
      );
  }
}

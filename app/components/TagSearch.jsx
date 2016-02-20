import React from 'react';
import Reflux from 'reflux';

import Tags from './Tags.jsx';

export default class TagSearch extends React.Component {

  constructor(props) {
    super(props);
    this.updateCloud = this.updateCloud.bind(this);
  }

  componentWillMount() {
    this.setState({
      tags: this.props.tags,
      original: this.props.tags
    })
  }

  updateCloud(term) {
    console.log("Input: " + term);
    var result = [];
    this.state.original.map((tag) => {
      if(tag.toLowerCase().indexOf(term.toLowerCase()) > -1) {
        result.push(tag);
      }
    });

    this.setState({
      tags: result
    })
  }

  render() {

    return (
      <div>
        <h4>Technologies etc that I know:</h4>
        <input id="search"
               className="form-control"
               placeholder="Search"
               onKeyUp={() => this.updateCloud(document.getElementById("search").value)} />
        <div className="tag-cloud">
          <Tags tags={this.state.tags} />
        </div>
      </div>
    );
  }
}

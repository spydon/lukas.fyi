import React from 'react';
import Reflux from 'reflux';

export default class Tags extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    const tags = this.props.tags;
    console.log(tags);
    var tagGroup = [];
    tags.forEach((tag) => {
      tagGroup.push(<a href={"https://en.wikipedia.org/wiki/" + tag}
                       target="_blank"
                       style={{margin: '0px 2px'}}
                       className="label label-primary"
                       key={tag}>{tag}</a>);
    });

    return (
      <div className="tags">{tagGroup}</div>
    );
  }
}

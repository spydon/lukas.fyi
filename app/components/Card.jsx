import React from 'react';
import ImageLoader from 'react-imageloader';

import Profile from '../styles/profile.jpg';

import Contact from './ContactDetails.jsx';
import Tags from './Tags.jsx';
import TagSearch from './TagSearch.jsx';

export default class Card extends React.Component {

  constructor(props) {
    super(props);
  }

  componentWillMount() {
    this.setState({})
  }

  preloader() {
    //return <img className="preloader" src={LoadingGif} />;
    return <div className="preloader">Loading</div>;
  }

  render() {
    const interests = ["Programming", "Linux", "Tech", "Climbing", "Slacklining"];
    const tags = ["Linux", "Scala", "Erlang", "Java", "React", "LaTeX", "Javascript",
                  "Bash", "Nginx", "GWT", "Zsh", "VIM", "Arch", "Debian", "Apache", "MongoDB",
                  "Riak", "MySQL", "Python", "IntelliJ", "Eclipse", "Git", "Subversion", "SML",
                  "REST", "Gradle", "SBT", "Webpack", "NPM", "Microcontrollers", "Gerrit", "CSS", "HTML",
                  "Scrum", "Android", "Jetty", "Java EE", "MariaDB", "PostgreSQL", "Docker"];

    return (
      <div className="contentview jumbotron">
        <div className="row">
         <div className="col-md-2 thumbnail">
            <ImageLoader
              wrapper={React.DOM.div}
              src={Profile}
              preloader={this.preloader}>
              Not an image
            </ImageLoader>
          </div>
          <div className="col-md-10">
            <h2>Lukas Klingsbo</h2>
            <h4 className="indent">Software Developer</h4>
            <table className="table table-hover">
              <tbody>
              <tr>
                <td>Degree:</td>
                <td>Master of Computer Science, Uppsala University</td>
              </tr>
              <tr>
                <td>Current Location:</td>
                <td>Uppsala, Sweden</td>
              </tr>
              <tr>
                <td>Employer:</td>
                <td>Uprise (EA/DICE)</td>
              </tr>
              <tr>
                <td>Interests:</td>
                <td><Tags tags={interests} /></td>
              </tr>
              </tbody>
            </table>
            <TagSearch tags={tags} />
          </div>
        </div>
        <div className="row">
          <div className="contact-container">
            <Contact />
          </div>
        </div>
     </div>
    );
  }
}

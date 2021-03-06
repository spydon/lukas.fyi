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
    const interests = ["Programming", "Linux", "Mechanical Keyboards", "Climbing", "Backpacking"];
    const tags = ["Linux", "Scala", "Erlang", "Haskell", "AWS", "Ansible", "Terraform", "Java", "React",
                  "LaTeX", "Javascript", "CSS", "HTML", "CentOS", "Dart",
                  "Bash", "Nginx", "GWT", "Zsh", "Vim", "Arch", "Debian", "Apache", "MongoDB",
                  "Riak", "MySQL", "Python", "IntelliJ", "Git", "Subversion", "SML",
                  "REST", "Gradle", "SBT", "Webpack", "NPM", "Microcontrollers",
                  "Scrum", "Android", "MariaDB", "PostgreSQL", "Docker"];

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
            <h4 className="indent">Senior Software Engineer</h4>
            <table className="table table-hover">
              <tbody>
              <tr>
                <td>Current Work:</td>
                <td>Freelancing Backend Engineer at <a href="https://klarna.com" target="_blank">Klarna</a></td>
              </tr>
              <tr>
                <td>Open Source:</td>
                <td>Maintainer of Flutter's largest game engine <a href="https://github.com/flame-engine/flame" target="_blank">Flame</a></td>
              </tr>
              <tr>
                <td>Current Location:</td>
                <td>Stockholm, Sweden</td>
              </tr>
              <tr>
                <td>Degree:</td>
                <td>Master of Computer Science, Uppsala University</td>
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

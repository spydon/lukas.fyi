import React from 'react';
import Reflux from 'reflux';

export default class ContactDetails extends React.Component {

  constructor(props) {
    super(props);
    this.onClickEmail = this.onClickEmail.bind(this);
    this.onClickTel = this.onClickTel.bind(this);
    this.onClickLinkedIn = this.onClickLinkedIn.bind(this);
    this.onClickCV = this.onClickCV.bind(this);
    this.onClickGitHub = this.onClickGitHub.bind(this);
  }

  componentWillMount() {
    this.setState({})
  }

  onClickEmail() {
    const contact = "zdhluzdhkahdsz.dkhldizdnzgdshbodzh@gdmhzadihldz.hdzhcdozhmdz".replace(/h|z|d/g, "");
    this.showContact("mailto:", contact);
  }

  onClickTel() {
    const contact = "+1894671893749291431984519".replace(/1|8|9/g, "");
    this.showContact("tel:", contact);
  }

  onClickLinkedIn() {
    this.showContact("https://", "linkedin.com/in/spydon");
  }

  onClickGitHub() {
    this.showContact("https://", "github.com/spydon");
  }

  onClickCV() {
    this.showContact("http://", "lukas.fyi/cv.pdf");
  }

  showContact(protocol, contact) {
    if (this.state.contact == contact) {
      this.setState({
        contact: void 0,
        protocol: void 0
      })
    } else {
      this.setState({
        contact: contact,
        protocol: protocol
      })
    }
  }

  render() {

    const visibleContact = this.state.contact ? {} : {visibility: 'hidden'};

    return (
      <div className="contact">
        <div className="btn-group">
          <button className="btn btn-primary" onClick={this.onClickEmail}>E-Mail</button>
          <button className="btn btn-primary" onClick={this.onClickLinkedIn}>LinkedIn</button>
          <button className="btn btn-primary" onClick={this.onClickGitHub}>GitHub</button>
          <button className="btn btn-primary btn-success" onClick={this.onClickCV}>CV</button>
          <button className="btn btn-primary btn-danger" onClick={this.onClickTel}>Phone Number</button>
        </div>
        <div className="contact-link" style={visibleContact}>
          <kbd><a target="_blank" href={this.state.protocol + this.state.contact}>{this.state.contact}</a></kbd>
        </div>
      </div>
    );
  }
}

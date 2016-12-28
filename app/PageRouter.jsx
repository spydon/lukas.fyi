import React from 'react';
import ReactDOM from 'react-dom';
import {browserHistory, Router, Route, IndexRoute} from 'react-router';

import Layout from './components/Layout';
import Home from  './components/Home';
import Blog from  './components/Blog';


const routes = (
  <Route path="/" component={Layout}>
    <IndexRoute component={Home} />
    <Route path="blog" component={Blog} />
  </Route>
);

export default class PageRouter extends React.Component {
  render() {
    return <Router routes={routes} history={browserHistory} />;
  }
}

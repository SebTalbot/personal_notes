import React from 'react';
import ReactDOM from 'react-dom';
// import an external component
import { componentName } from './component_file.js';

// Basic class component struture
class MyComponentClass extends React.Component {
  // Must be there and must return a JSX
  render() {
    return <h1>Hello world</h1>;
  }
};

// Export a class component
export class externalComponent extends React.Component {
  render() {
    return <h1>Hello world</h1>;
  }
};

ReactDOM.render(
  <MyComponentClass />,  //Syntax to create an instance of the component class
  document.getElementById('app')
);

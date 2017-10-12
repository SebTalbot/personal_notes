import React from 'react';
import ReactDOM from 'react-dom';
// import an external component
import { componentName } from './component_file.js';

// Basic statefull component class
class MyComponentClass extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      foo: 'bar'
    };
  }
  // Must be there and must return a JSX
  render() {
    return <h1>Hello {this.state.foo}</h1>;
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


// Stateless components class
export class Child extends React.Component {
  render() {
    return <h1>Hey, my name is {this.props.name}</h1>;
  }
}

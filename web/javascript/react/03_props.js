// The props object is used to pass information through
// the component instance from its parent
<Test myProps="value" />

class Test extends React.Component {
  render() {
    return (
      <div>
        Hello {this.props.myProps}!
      </div>
    );
  }
}

// It can be used to pass event handlers
class Parent extends React.Component {
  handleClick() {
    console.log("Clicked");
  }

  render() {
    <Child onClick={this.handleClick} />
  }
}

class Child extends React.Component {
  render() {
    return (
      <button onClick={this.props.onClick} >
        Click me!
      </button>
    );
  }
}

// You can get the value inside <Foo>value</Foo>
// with: this.props.children

// Default props are used to define default values
Child.defaultProps = { name: "no name" };

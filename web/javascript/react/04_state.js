// The state object needs a construction methode
class Test extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: 'This is a test'
    };
  }

  render() {
    return (
      <h1>
        {this.state.name}
      </h1>
    );
  }
};

// To edit state, you must use the setState() function

this.setState({
  name: 'This is a new test'
});

// setState() calls render(), you don't need to combine them

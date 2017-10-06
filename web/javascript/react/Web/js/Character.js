var React = require('react');

module.exports = class Character extends React.Component {
	constructor() {
		super();

		this.state = {
			selected: false,
		};
	}

	render() {
		return (
			<button className="square" onClick={
					() => 
						this.setState({selected : !this.state.selected })
				} 
				style={{ opacity :  (this.state.selected ? '0.5' : '1.0') }}>
				<h1>{this.props.name}</h1>
				<img src={ "images/characters/" + this.props.img + ".jpg" } />
			</button>
		);
	}
}
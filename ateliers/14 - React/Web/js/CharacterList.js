var React = require('react');

var Character = require('./Character');

module.exports = class CharacterList extends React.Component {
	constructor() {
		super();
	}
	
	render() {
		return (
			<div>
				<Character name="Mario" img="mario" />
				<Character name="Luigi" img="luigi" />
				<Character name="Princess" img="princess" />
				<Character name="Goomba" img="goomba" />
			</div>
		);
	}
}
var ReactDOM = require('react-dom');
var React = require('react');

var CharacterList = require('./CharacterList')

window.onload = function() {
	ReactDOM.render(
		<CharacterList />,
		document.getElementById('app')
	);
}
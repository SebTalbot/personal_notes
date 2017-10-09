import React from 'react';
import ReactDOM from 'react-dom'; // Needed if you render

const singleLineJsx = <h1>Single</h1>;
const multiLinesJsx = (
  <ul>
    <li>First</li>
    <li>Second</li>
    <li>Third</li>
  </ul>
);

ReactDOM.render(
  <h1>Hello world</h1>,           // A JSX element to render
  document.getElementById('app')  // Where you want to render it
);

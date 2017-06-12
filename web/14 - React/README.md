# React
Permet de gérer la vue comme une suite de components

# Les dépendances

- react : contient le code de React
- react-dom : Pour faire le lien entre React et le DOM du navigateur
- browserify : Pour transformer les appels à "Require" en code natif JS
- babel : Pour la compabilité des navigateurs (JSX à JS)

## Exemple de JSX
~~~~
const element = <h1>Hello, world!</h1>;
~~~~
ou
~~~~
const element = (
  <div>
    <h1>Hello!</h1>
    <h2>Good to see you here.</h2>
  </div>
);
~~~~

https://facebook.github.io/react/docs/jsx-in-depth.html
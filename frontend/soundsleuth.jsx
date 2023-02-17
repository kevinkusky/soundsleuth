//React
import React from 'react';
import ReactDOM from 'react-dom';
//Components
import Root from './components/root';
import configureStore from './store/store';


document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (window.currentPlayer) {
    const preloadedState = {
      session: { id: window.currentPlayer.id },
      entities: {
        player: { [window.currentPlayer.id]: window.currentPlayer }
      }
    };
    store = configureStore(preloadedState);
    delete window.currentPlayer;
  } else {
    store = configureStore();
  }
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});

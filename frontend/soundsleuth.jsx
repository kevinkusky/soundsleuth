import React from 'react';
import ReactDOM from 'react-dom';

import Root from './components/root';
import configureStore from './store/store';


document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (window.currentPlayer) {
    const preloadedState = {
      // session: { id: window.currentPlayer.id },
      session: { id: 22 },
      entities: {
        // player: { [window.currentPlayer.id]: window.currentPlayer }
        player: { [22]: "kk-22" }
      }
    };
    store = configureStore(preloadedState);
    delete window.currentPlayer;
  } else {
    store = configureStore();
  }
  debugger;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});

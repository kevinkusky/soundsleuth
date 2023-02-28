import React from 'react';
import { Provider } from 'react-redux';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';

import GreetingContainer from './search/';
import SearchContainer from './search/search_container';

const App = () => (
  <div>
    <header>
      <Link to="/" className="header-link">
        <h1>SoundSleuth</h1>
      </Link>
      {/* <GreetingContainer /> */}
    </header>
    <h2>Hello World</h2>
    <a href="/auth/spotify">Connect with Spotify</a>
  </div>
);

export default App;

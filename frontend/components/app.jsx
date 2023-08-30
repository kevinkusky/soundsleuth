import React from 'react';
import { Provider } from 'react-redux';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';


const App = () => (
  <div>
    <header>
      <Link to="/" className="header-link">
        <h1>SoundSleuth</h1>
      </Link>
      {/* <GreetingContainer /> */}
    </header>
    <h2>Hello World</h2>
    <a target="_blank" href="/auth/spotify">Connect with Spotify</a>
    <br/>
    <a target="_blank" href="/login">Login with Spotify</a>
  </div>
);

export default App;

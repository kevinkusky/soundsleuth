import React from 'react';
import { Provider } from 'react-redux';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';

import GreetingContainer from './greeting/greeting_container';
import SearchContainer from './search/search_container';

const App = () => (
  <div>
    <header>
      <Link to="/" className="header-link">
        <h1>SoundSleuth</h1>
      </Link>
      <GreetingContainer />
    </header>
    <Switch>
      {/* <AuthRoute exact path="/login" component={LogInFormContainer} />
      <AuthRoute exact path="/signup" component={SignUpFormContainer} /> */}
      <Route exact path="/" component={SearchContainer} />
    </Switch>
  </div>
);

export default App;

import React from 'react';

import HelloWorld from './components/HelloWorld/HelloWorld'
import Header from './components/Header/Header'

const App = props => {
    return(
        <div>
          <Header/>
          <HelloWorld/>
        </div>
      )
}

export default App

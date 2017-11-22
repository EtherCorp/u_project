import React from 'react';

import HelloWorld from './components/HelloWorld/HelloWorld'
import HeaderContainer from './components/HeaderContainer/HeaderContainer'
import FooterContainer from './components/FooterContainer/FooterContainer'

const App = props => {
    return(
        <div>
          <HeaderContainer/>
          <HelloWorld/>
          <FooterContainer/>
        </div>
      )
}

export default App

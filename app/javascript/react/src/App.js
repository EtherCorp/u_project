import React from 'react';

import HelloWorld from './components/HelloWorld/HelloWorld'
import Header from './components/Header/Header'
import Footer from './components/Footer/Footer'

const App = props => {
    return(
        <div>
          <Header/>
          <HelloWorld/>
          <Footer/>
        </div>
      )
}

export default App

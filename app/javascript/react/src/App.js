import React, {Component} from 'react'
import {Pagination, Footer} from 'react-materialize'
import HeaderContainer from './components/HeaderContainer/HeaderContainer'
import FooterContainer from './components/FooterContainer/FooterContainer'
import TimelineContainer from './components/TimelineContainer/TimelineContainer'

import './App.css';

class App extends Component {
    state = {
        movements: [
            {
                title: "Titulo 1",
                url: "http://google.cl",
                description: "Descripcion 1"
            },
            {
                title: "Titulo 1",
                url: "http://google.cl",
                description: "Descripcion 1"
            },

        ]
    }

    render(){
        return(
            <div className='ApplicationContainer'>
                <div className="wrapper">
                    <HeaderContainer/>
                    <div className="AppContent">
                        <aside className="aside aside-1">
                            Insert Card Component
                        </aside>
                        <div className="main">
                            <TimelineContainer items={this.state.movements}/>
                        </div>
                    </div>
                    <FooterContainer/>
                </div>
            </div>
        )
    }

}

export default App
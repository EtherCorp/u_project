import React, { Component } from 'react';
import TimelineContainer from './components/TimelineContainer/TimelineContainer'

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

    render() {
        return(
            <div>
                <TimelineContainer items={this.state.movements}/>
            </div>
        )
    }
}

export default App;

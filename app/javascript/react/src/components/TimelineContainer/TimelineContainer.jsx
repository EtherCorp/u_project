import React, { Component } from 'react'
import {Timeline} from 'react-event-timeline'

import TimelineItem from "../TimelineItem/TimelineItem"

import './TimelineContainer.css'

class TimelineContainer extends Component{
    render(){
        return(
            <div className="TimelineContainer">
                <Timeline>
                    <TimelineItem
                        date = "27/05/2017"
                        title = "Titulo"
                        description = "Una pequeña descripcion"
                        url = "http://google.cl/"
                    />
                    <TimelineItem
                        date = "21/03/2017"
                        title = "Titulo 2"
                        description = "Otra pequeña descripcion"
                        url = "http://google.cl/"
                    />
                </Timeline>
            </div>
        )
    }
}

export default TimelineContainer
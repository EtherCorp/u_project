import React, { Component } from 'react'
import {TimelineEvent} from 'react-event-timeline'

import './TimelineItem.css'

class TimelineItem extends Component{
    render(){
        return(
            <TimelineEvent
                title={this.props.title}
                createdAt={this.props.date}
                icon={<i className="material-icons md-18">assignment</i>}
                iconColor="#757575"
                buttons={<a href={this.props.url}><i className="material-icons md-18">visibility</i></a>}
                container="card"

                cardHeaderStyle={{backgroundColor: "#8bc34a", color: "#503331"}}
            >
                {this.props.description}
            </TimelineEvent>
        );
    }
}

export default TimelineItem
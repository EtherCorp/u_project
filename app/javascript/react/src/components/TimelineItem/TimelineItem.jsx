import React, { Component } from 'react'
import { Button } from 'react-materialize'

import './TimelineItem.css'

class TimelineItem extends Component{
    render(){
        return(
            <div className="TimelineItem">
                <div className="TimelineItem-date">
                    {this.props.date}
                </div>
                <div className="TimelineItem-bullet">
                    <svg
                        width="100"
                        height="200">
                        <rect
                            y="0"
                            x="40"
                            height="200"
                            width="20"/>
                        <circle
                            r="50"
                            cy="100"
                            cx="50" />
                    </svg>
                </div>
                <div className="TimelineItem-description">
                    <span className="TimelineItem-type">
                        {this.props.movement_type}
                    </span>
                    en
                    <span className="TimelineItem-location">
                        {this.props.location}
                    </span>
                </div>

            </div>
        );
    }
}

export default TimelineItem
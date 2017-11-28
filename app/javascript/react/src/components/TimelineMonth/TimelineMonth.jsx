import React, { Component } from 'react'
import { Label } from 'semantic-ui-react'

import './TimelineMonth.css'

class TimelineMonth extends Component{
    render(){
        return(
            <div className="TimelineMonth">
                <Label className="TimelineMonth-label" pointing='below'>{this.props.month}</Label>
            </div>
        )
    }
}

export default TimelineMonth;
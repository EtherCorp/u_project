import React, { Component } from 'react'

import TimelineItem from "../TimelineItem/TimelineItem"

import './TimelineContainer.css'
import TimelineMonth from "../TimelineMonth/TimelineMonth";

class TimelineContainer extends Component{
    render(){
        return(
            <div className="TimelineContainer">
                <TimelineMonth month='Noviembre'/>
                {this.buildItems(this.props.items)}
            </div>
        )
    }

    buildItems(items) {
        return items.map((item) => {
            return this.buildItem(item)
        })
    }

    buildItem(item) {
        return (
            <TimelineItem
                item={item}
            />
        )
    }
}

export default TimelineContainer
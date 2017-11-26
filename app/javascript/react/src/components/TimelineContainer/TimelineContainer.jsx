import React, { Component } from 'react'

import TimelineItem from "../TimelineItem/TimelineItem"

import './TimelineContainer.css'

class TimelineContainer extends Component{
    render(){
        return(
            <div className="TimelineContainer">
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
                date = {item.date}
                title = {item.title}
                description = {item.description}
                url = {item.url}
            />
        )
    }
}

export default TimelineContainer
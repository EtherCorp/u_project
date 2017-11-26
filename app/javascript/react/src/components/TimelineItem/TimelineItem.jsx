import React, { Component } from 'react'
import { Card, Button } from 'semantic-ui-react'

import './TimelineItem.css'

class TimelineItem extends Component{
    render(){
        return(
            <div className="TimelineItem">
                <div className="TimelineItem-rail">
                    <div className="TimelineItem-date">
                        {this.props.date}
                    </div>
                    <Button className='TimelineItem-bullet' circular icon='doctor' />
                </div>

                <div className="TimelineItem-container">
                    <Card className="TimelineItem-card">
                        <Card.Content
                            header={this.props.title}
                            meta='algun subtitulo?'
                            description={this.props.description}
                        />
                    </Card>
                </div>

            </div>
        );
    }
}

export default TimelineItem
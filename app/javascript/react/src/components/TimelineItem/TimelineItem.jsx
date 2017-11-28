import React, { Component } from 'react'
import { Card, Button, Icon } from 'semantic-ui-react'

import './TimelineItem.css'

class TimelineItem extends Component{
  render(){
    return(
      <div className="TimelineItem">
        <div className="TimelineItem-rail">
          <div className="TimelineItem-date">
            {this.props.item.date}
          </div>
          <Button
            className='TimelineItem-bullet'
            icon={<Icon name='doctor' size='big' />}
            circular
          />
        </div>

        <div className="TimelineItem-container">
          <Card className="TimelineItem-card"
            href={this.props.item.url}
          >
            <Card.Content
              header={this.props.item.movementType}
              meta={this.props.item.medicalCenter}
              description={this.props.item.description}
            />
          </Card>
        </div>

      </div>
    );
  }
}

export default TimelineItem
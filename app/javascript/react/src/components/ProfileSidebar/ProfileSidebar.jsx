import React, {Component} from 'react'
import { Image, List, Header} from 'semantic-ui-react'

import DefaultImage from './assets/images/profile.jpg'
import './ProfileSidebar.css'

class ProfileSidebar extends Component{
    render(){
        return(
            <div className='ProfileSidebar'>
                <Image
                    className='ProfileSidebar-image'
                    src={DefaultImage}
                    rounded
                    centered
                />

                <div className="ProfileSidebar-title">
                    {this.props.user.name}
                </div>
                <div className="ProfileSidebar-subtitle">
                    {this.props.user.rut}
                </div>
                <div className="ProfileSidebar-subtitle">
                    {this.props.user.age}
                </div>
                <div className="ProfileSidebar-section">
                    Diagnósticos
                </div>
                {this.buildList(this.props.user.diagnostics)}
            </div>
        )
    }

    buildList(items) {
        return (
            <List className='ProfileSidebar-list' bulleted>
                {
                    items.map((item) => {
                        return this.buildListElement(item)
                    })
                }
            </List>
        )
    }

    buildListElement(item) {
        return (
            <List.Item>
                {item}
            </List.Item>
        )
    }
}
export default ProfileSidebar;

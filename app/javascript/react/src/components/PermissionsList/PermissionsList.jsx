import React, {Component} from 'react'
import './PermissionsList.css';
import { Button, Flag, Header, Image, List } from 'semantic-ui-react'
import DefaultProfileImage from '../../assets/images/default/profile.jpg'

class PermissionsList extends Component{
  render(){
      return(
        <div className='PermissionsList'>
          <Header as='h2' content='Permisos activos' subheader='Administra tus permisos en todo momento' />
          <List animated verticalAlign='middle'>
          <List.Item>
            <Image avatar src={DefaultProfileImage} />
            <List.Content as='a'>
              <List.Header>Helen <Flag name='cl'/> </List.Header>
              <List.Content>Professional</List.Content>
            </List.Content>
          </List.Item>
          <List.Item>
            <Image avatar src={DefaultProfileImage} />
            <List.Content as='a'>
              <List.Header>Christian <Flag name='us'/></List.Header>
              <List.Content>Professional</List.Content>
            </List.Content>
          </List.Item>
          <List.Item>
            <Image avatar src={DefaultProfileImage}/>
            <List.Content as='a'>
              <List.Header>Daniel <Flag name='ec'/></List.Header>
              <List.Content>Professional</List.Content>
            </List.Content>
          </List.Item>
        </List>
        </div>
      )
  }
}
export default PermissionsList;

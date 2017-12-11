import React, {Component} from 'react'
import { Sidebar, Container, Segment, Button, Menu, Image, Icon, Header } from 'semantic-ui-react'
import FooterContainer from "./components/FooterContainer/FooterContainer";
import ProfileSidebar from "./components/ProfileSidebar/ProfileSidebar";
import TimelineContainer from "./components/TimelineContainer/TimelineContainer";
import CodeInput from "./components/CodeInput/CodeInput";
import PermissionsList from "./components/PermissionsList/PermissionsList";

import './App.css';
import DefaultProfileImage from './assets/images/default/profile.jpg'


class App extends Component {
  state = {
    rightSidebarVisibility: false,
    leftSidebarVisibility: false,
    movements: [
      {
        date: "Hoy",
        movementType: "Exámen",
        medicalCenter: "Integramedica",
        description: "",
        url: "http://google.cl",
      },
      {
        date: "Ayer",
        movementType: "Consulta Médica",
        medicalCenter: "Clínica Bicentenario",
        description: "Consulta debido a un resfrío",
        url: "http://google.cl",
      },
      {
        date: "20/11/2017",
        movementType: "Exámen",
        medicalCenter: "Integramedica",
        description: "Exámen de sangre",
        url: "http://google.cl",
      },
      {
        date: "13/11/2017",
        movementType: "Exámen",
        medicalCenter: "Integramedica",
        description: "Radiografía al toraz",
        url: "http://google.cl",
      },
      {
        date: "13/11/2017",
        movementType: "Exámen",
        medicalCenter: "Integramedica",
        description: "Exámen de sangre",
        url: "http://google.cl",
      },
      {
        date: "12/11/2017",
        movementType: "Exámen",
        medicalCenter: "Integramedica",
        description: "Exámen de orina",
        url: "http://google.cl",
      },
      {
        date: "11/11/2017",
        movementType: "Consulta Médica",
        medicalCenter: "Clínica Bicentenario",
        description: "Consulta sobre sibilancia toraxica. Dos semanas de evolución. Sin prescripciones asociadas",
        url: "http://google.cl",
      },

    ],
    user:{
      name: 'Helen Gómez Fuentes',
      rut: '560270732"',
      age: '25 años',
      diagnostics:[
        'Médico Cirujano',
      ]
    }
  }

  toggleRightSidebarVisibility = () => this.setState({ rightSidebarVisibility: !this.state.rightSidebarVisibility })
  toggleLeftSidebarVisibility = () => this.setState({ leftSidebarVisibility: !this.state.leftSidebarVisibility })

  render(){
    return(
      <div className='App'>
          <Menu fixed='top' size='large'>
              <Container>
                  <div className="App-logo">
                      <h2>UNICORN</h2>
                  </div>

                  <Menu.Item as='a'>Mi historial</Menu.Item>
                  <Menu.Item href='permissions' as='a' active>Permisos</Menu.Item>
                  <Menu.Menu position='right'>
                      <Menu.Item className='App-userProfile' onClick={this.toggleRightSidebarVisibility}>
                        {this.state.user.name}
                          <Image
                            className='App-profileImage'
                            src={DefaultProfileImage}
                            floated='right'
                            size='mini'
                            circular
                          />
                      </Menu.Item>
                  </Menu.Menu>
              </Container>
          </Menu>

          <Sidebar.Pushable className="App-pushable" >
              <Sidebar
                className='App-sidebar'
                animation='overlay'
                visible={this.state.rightSidebarVisibility}
                direction='right'
                icon='labeled'
                vertical
                inverted
              >
                  <ProfileSidebar user={this.state.user}/>
              </Sidebar>

              <Sidebar.Pusher>
                  <div className='App-content'>
                      <CodeInput/>
                  </div>

              </Sidebar.Pusher>
          </Sidebar.Pushable>

          <PermissionsList/>
          <FooterContainer/>
      </div>
    )
  }

}

export default App

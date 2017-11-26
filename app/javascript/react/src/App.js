import React, {Component} from 'react'
import { Sidebar, Container, Segment, Button, Menu, Image, Icon, Header } from 'semantic-ui-react'


import './App.css';
import HeaderContainer from "./components/HeaderContainer/HeaderContainer";
import FooterContainer from "./components/FooterContainer/FooterContainer";
import ProfileSidebar from "./components/ProfileSidebar/ProfileSidebar";
import MenuSidebar from "./components/MenuSidebar/MenuSidebar";
import PatientRecords from "./components/PatientRecords/PatientRecords";
import TimelineContainer from "./components/TimelineContainer/TimelineContainer";

class App extends Component {
    state = {
        rightSidebarVisibility: false,
        leftSidebarVisibility: false,
        movements: [
            {
                date: "Today",
                title: "Titulo 1",
                url: "http://google.cl",
                description: "Descripcion 1"
            },
            {
                date:"Yesterday",
                title: "Titulo 1",
                url: "http://google.cl",
                description: "Descripcion 1"
            },

        ]
    }

    toggleRightSidebarVisibility = () => this.setState({ rightSidebarVisibility: !this.state.rightSidebarVisibility })
    toggleLeftSidebarVisibility = () => this.setState({ leftSidebarVisibility: !this.state.leftSidebarVisibility })

    render(){
        return(
            <div>
                <Menu fixed='top' size='large'>
                    <Container>

                        <Menu.Item>
                            <Button basic className="burger" icon="sidebar" onClick={this.toggleLeftSidebarVisibility}/>
                        </Menu.Item>


                        <Menu.Item as='a' active>Home</Menu.Item>
                        <Menu.Item as='a'>Work</Menu.Item>
                        <Menu.Item as='a'>Company</Menu.Item>
                        <Menu.Item as='a'>Careers</Menu.Item>
                        <Menu.Menu position='right'>
                            <Menu.Item onClick={this.toggleRightSidebarVisibility}>
                                Gerardo Zúñiga Leal
                            </Menu.Item>
                        </Menu.Menu>
                    </Container>
                </Menu>

                <Sidebar.Pushable>

                    <Sidebar
                        as={Menu}
                        animation='push'
                        width='thin'
                        direction='left'
                        visible={this.state.leftSidebarVisibility}
                        icon='labeled'
                        vertical
                        inverted
                    >

                        <MenuSidebar />

                    </Sidebar>

                    <Sidebar

                        animation='uncover'
                        width='thin'
                        visible={this.state.rightSidebarVisibility}
                        direction='right'
                        icon='labeled'
                        vertical
                        inverted
                    >

                        <ProfileSidebar/>

                    </Sidebar>

                    <Sidebar.Pusher>
                        <div className='App-content'>
                            <TimelineContainer items={this.state.movements}/>
                        </div>

                    </Sidebar.Pusher>
                </Sidebar.Pushable>

                <FooterContainer/>
            </div>
        )
    }

}

export default App
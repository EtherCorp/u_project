import React, {Component} from 'react'
import {Navbar, NavItem, ModalHeader} from 'react-materialize'


class Header extends Component{
    render(){
        return(
          <div className='Header'>
            <Navbar brand='logo' right>
              <NavItem href='#'>Getting started</NavItem>
              <NavItem href='#'>Components</NavItem>
            </Navbar>
          </div>
        )
    }
}
export default Header;

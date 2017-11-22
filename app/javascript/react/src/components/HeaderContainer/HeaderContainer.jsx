import React, {Component} from 'react'
import {Navbar, NavItem, Pagination} from 'react-materialize'


class HeaderContainer extends Component{
    render(){
        return(
          <div className='HeaderContainer'>
            <Navbar brand='logo' right>
              <NavItem href='#'>Getting started</NavItem>
              <NavItem href='#'>Components</NavItem>
            </Navbar>
          </div>
        )
    }
}
export default HeaderContainer;

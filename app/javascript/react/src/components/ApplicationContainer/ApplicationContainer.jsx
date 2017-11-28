import React, {Component} from 'react'
import {Pagination, Footer} from 'react-materialize'
import HelloWorld from '../HelloWorld/HelloWorld'
import HeaderContainer from '../HeaderContainer/HeaderContainer'
import FooterContainer from '../FooterContainer/FooterContainer'
import './ApplicationContainer.css';

class ApplicationContainer extends Component{
    render(){
        return(
          <div className='ApplicationContainer'>
            <div class="wrapper">
              <HeaderContainer/>
              <div class="main">
                <HelloWorld/>
              </div>
              <aside class="aside aside-1">
                Insert Card Component
              </aside>
              <aside class="aside aside-2">
                Insert an Component or delete
              </aside>
              <FooterContainer/>
            </div>
          </div>
        )
    }
}
export default ApplicationContainer;

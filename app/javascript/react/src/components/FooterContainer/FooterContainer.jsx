import React, {Component} from 'react'
import {Pagination, Footer} from 'react-materialize'
import './FooterContainer.css';

class FooterContainer extends Component{
    render(){
        return(
          <div className='Footer'>
            <div className='footer-container'>
              <Pagination items={10} activePage={2} maxButtons={8} />
            </div>
            <div  className='footer-container'>
              <Footer copyrights="&copy 2017 Copyright Text"
              	moreLinks={
              		<a className="grey-text text-lighten-4 right" href="#!">More Links</a>
              	}
              	links={
              		<ul>
              			<li><a className="grey-text text-lighten-3" href="#!">Link 1</a></li>
              			<li><a className="grey-text text-lighten-3" href="#!">Link 2</a></li>
              			<li><a className="grey-text text-lighten-3" href="#!">Link 3</a></li>
              			<li><a className="grey-text text-lighten-3" href="#!">Link 4</a></li>
              		</ul>
              	}
              	className='example'
              >
              		<h5 className="white-text">Footer Content</h5>
              		<p className="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
              </Footer>
            </div>


          </div>
        )
    }
}
export default FooterContainer;

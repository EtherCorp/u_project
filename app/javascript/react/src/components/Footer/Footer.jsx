import React, {Component} from 'react'
import {Pagination} from 'react-materialize'


class Footer extends Component{
    render(){
        return(
          <div className='Footer'>
            <Pagination items={10} activePage={2} maxButtons={8} />
          </div>
        )
    }
}
export default Footer;

import React, {Component} from 'react'
import { Divider, Icon } from 'semantic-ui-react'

import './FooterContainer.css';

class FooterContainer extends Component{
    render(){
        return(
            <div className='Footer'>
              <Divider/>
                Hecho con <Icon name='heart' color='red'/> por <span className='Footer-company'>EtherCorp</span>
            </div>
        )
    }
}
export default FooterContainer;

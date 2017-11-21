import React, {Component} from 'react'
import {Button, Icon} from 'react-materialize'


class HelloWorld extends Component{
    render(){
        return(
          <div className="HelloWorld">
            <h1>Hola Mundo!</h1>
              <Button waves='light'>
            		<Icon>thumb_up</Icon>
            	</Button>
            </div>
        )
    }
}
  
export default HelloWorld;

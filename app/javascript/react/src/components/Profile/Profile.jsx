import React, {Component} from 'react'
import {Button, Icon, Card, CardTitle} from 'react-materialize'
import './Profile.css';


class Profile extends Component{
  constructor (props){
    super(props);
    this.state = {
      Nombre:'Profe',
      Edad: 49,
      Rut:'66.666.666-6',

      }
    }
    render(){
        return(
          <div className='profile'>

              <div  className="cardcontainer">
                <Card header={
                  <CardTitle className="imagecard" image={require('./perry.jpg')} >
                  </CardTitle>}
                actions={[<a href='#'>Ir a perfil</a>]}>
                <h3>{this.state.Nombre}</h3>
                <h4>{this.state.Edad}</h4>
                <h4>{this.state.Rut}</h4>


              </Card>
              </div>

            </div>
        )
    }
}
export default Profile;

import React, {Component} from 'react'
import './CodeInput.css';
import { Button, Container, Header, Input } from 'semantic-ui-react'
import ConfirmDialog from '../ConfirmDialog/ConfirmDialog'


class CodeInput extends Component{
  state = {
    header: 'Token de permiso',
    content: 'Validando token de permiso',
    actionButtonText: 'Validar',
    input: '',
  }


  updateInput = (e) => this.setState({
    header: 'Token de permiso',
    content: 'Validando token de permiso: '.concat(e.target.value),
    actionButtonText: 'Validar',
    input: e.target.value,
  })

  render(){
      return(
        <div className='CodeInput'>
          <Header as='h2' content='Permisos de acceso' subheader='Ingresa el token dado por el paciente' />
          <div className='InputContainer'>
            <Input maxlength="6"
              label={{ basic: true, content: 'token' }}
              labelPosition='right'
              placeholder='Ingrese token'
              onChange={this.updateInput.bind(this)}
            />
          <ConfirmDialog dialog={this.state}/>
          </div>
        </div>
      )
  }
}
export default CodeInput;

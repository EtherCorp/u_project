import React, {Component} from 'react'
import './CodeGeneration.css';
import { Button, Header } from 'semantic-ui-react'
import ConfirmDialog from '../ConfirmDialog/ConfirmDialog'

class CodeGeneration extends Component{
  dialog = {
    header: 'Token de permiso',
    content: 'Comparta el token generado con el profesional: 7b7c87',
    actionButtonText: 'Generar permiso',
  }
    render(){
        return(
          <div className='CodeGeneration'>
            <Header as='h2' content='Permisos de acceso' subheader='Crea token de permisos y compártelo con los profesionales' />
            <ConfirmDialog dialog={this.dialog}/>
          </div>
        )
    }
}
export default CodeGeneration;

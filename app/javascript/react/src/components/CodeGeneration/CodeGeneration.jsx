import React, {Component} from 'react'
import './CodeGeneration.css';
import { Button, Header } from 'semantic-ui-react'
import ConfirmDialog from '../ConfirmDialog/ConfirmDialog'

class CodeGeneration extends Component{
    render(){
        return(
          <div className='CodeGeneration'>
            <Header as='h2' content='Permisos de acceso' subheader='Crea token de permisos y compártelo con los profesionales' />
            <ConfirmDialog/>
          </div>
        )
    }
}
export default CodeGeneration;

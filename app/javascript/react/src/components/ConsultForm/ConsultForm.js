import React,{Component} from 'react'

export default class ConsultForm extends Component{
    //rut del profesional debe ser agregado tambien
    state = {
        rutPatient: '',
        date:'',
        reason:'',
        sintomas:'',
        observaciones:''
    }
    render(){
        return(
            <div className="consult-form">

                <label>rut paciente</label>
                <br/>
                <input
                    type='text'
                    placeholder='escriba rut del paciente'
                    onChange={this.onRutPatientChange}
                    value={this.state.rutPatient}
                 />
                 <br/>
                 <label>fecha de consulta</label>
                 <br/>
                 <input
                    type='text'
                    placeholder='DD/MM/YYYY'
                    onChange={this.onDateChange}
                    value={this.state.date}
                 />
                 <br/>
                 <label>Razon de la consulta</label>
                 <br/>
                 <input
                    type='text'
                    placeholder='escriba razon de la consulta'
                    onChange={this.onReasonChange}
                    value={this.state.reason}
                 />
                 <br/>
                 <label>Sintomas</label>
                 <br/>
                 <input
                    type='text'
                    placeholder='Escriba sintomas del paciente'
                    onChange={this.onSintomasChange}
                    value={this.state.sintomas}
                 />
                 <br/>
                 <label>Observaciones</label>
                 <br/>
                 <input
                    type='text'
                    placeholder='Escriba observaciones del paciente'
                    onChange={this.onObservationsChange}
                    value={this.state.observaciones}
                 />
                 <br/>
                 <br/>
                 <button onClick={this.onClickSend}>
                    send data
                 </button>
            </div>
        )
    }
    //onClick={this.onClickLogin}
    onRutPatientChange= (event) =>{
        this.setState({rutPatient: event.target.value});
    }
    onDateChange= (event) =>{
        this.setState({date: event.target.value});
    }
    onReasonChange= (event) =>{
        this.setState({reason: event.target.value});
    }
    onSintomasChange= (event) =>{
        this.setState({sintomas: event.target.value});
    }
    onObservationsChange= (event) =>{
        
        this.setState({observaciones: event.target.value});
    }
    onClickSend= (event) =>{
        const {rutPatient, reason, sintomas, observaciones} = this.state
        if(rutPatient != '' && sintomas != '' && reason != '' && observaciones != ''){
            console.log(this.state);
            alert("Enviando Datos de la consulta")
        }
        alert("todos los campos deben contener información")
    }
    
}
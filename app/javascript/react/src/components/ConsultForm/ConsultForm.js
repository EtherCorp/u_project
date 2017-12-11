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

                <label>Patient Rut</label>
                <br/>
                <input
                    type='text'
                    placeholder='Write Patient RUT'
                    onChange={this.onRutPatientChange}
                    value={this.state.rutPatient}
                 />
                 <br/>
                 <label>Date</label>
                 <br/>
                 <input
                    type='text'
                    placeholder='DD-MM-YYYY'
                    onChange={this.onDateChange}
                    value={this.state.date}
                 />
                 <br/>
                 <label>Reason</label>
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
                 <label>Observations</label>
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
        console.log(this.state);
    }
    
}
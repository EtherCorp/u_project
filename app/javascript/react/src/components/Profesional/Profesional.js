import React,{Component} from 'react'

export default class Profesional extends Component{
    render(){
        return(
            <div className="profesional-container">
                <h1>Profesional Info</h1>
                {this.renderProfesional()}
                <br/>
            </div>
        )
    }
    renderProfesional() {
        const {name, lastname, rut, compañia}=this.props.data;
        return(
            <div>
                <label>Name: {name}</label>
                <br/>
                <label>Lastname: {lastname}</label>
                <br/>
                <label>Rut: {rut}</label>
                <br/>
                <label>Company: {compañia}</label>
                <br/>
            </div>  
        )
    }
}
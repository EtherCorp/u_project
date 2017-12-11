import React, { Component } from 'react'
import { Button, Confirm } from 'semantic-ui-react'

class ConfirmDialog extends Component {
  state = { open: false }

  show = () => this.setState({ open: true })
  handleConfirm = () => this.setState({ open: false })
  handleCancel = () => this.setState({ open: false })

  render() {
    return (
      <div>
        <Button primary onClick={this.show}>Generar permiso</Button>
        <Confirm
          open={this.state.open}
          header='Token de permiso'
          content='Comparta el token generado con el profesional: 7b7c87'
          onCancel={this.handleCancel}
          onConfirm={this.handleConfirm}
        />
      </div>
    )
  }
}

export default ConfirmDialog

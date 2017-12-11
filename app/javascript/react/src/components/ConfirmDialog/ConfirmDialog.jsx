import React, { Component } from 'react'
import { Button, Confirm } from 'semantic-ui-react'

class ConfirmDialog extends Component {
  state = { open: false }

  show = () => this.setState({ open: true })
  handleConfirm = () => this.setState({ open: false })
  handleCancel = () => this.setState({ open: false })

  render() {
    return (
      <div className='ConfirmDialog'>
        <Button primary onClick={this.show}>{this.props.dialog.actionButtonText}</Button>
        <Confirm
          open={this.state.open}
          header={this.props.dialog.header}
          content={this.props.dialog.content}
          onCancel={this.handleCancel}
          onConfirm={this.handleConfirm}
        />
      </div>
    )
  }
}

export default ConfirmDialog

import React, { Component } from "react"
import { Table } from "react-bootstrap"

export default class TableLayout extends Component {
  renderTr = (index) => {
    return (
      <tr key={ index }>
        <td>{ index }</td>
        <td>Table cell</td>
        <td>Table cell</td>
        <td>Table cell</td>
      </tr>
    )
  }

  renderCollection = () => {
    return [1,1,1,1,1,1,1].map((item, index) => {
      return this.renderTr(index);
    })
  }

  render() {
    return (
      <Table responsive>
        <thead>
          <tr>
            <th>#</th>
            <th>Name</th>
            <th>Stars count</th>
            <th>Language</th>
          </tr>
        </thead>
        <tbody>
          { this.renderCollection() }
        </tbody>
      </Table>
    )
  }
}

import React, { Component } from "react"
import { Table } from "react-bootstrap"

export default class TrendsIndex extends Component {
  renderTr = (trend, index) => {
    return (
      <tr key={ index }>
        <td>{ ++index }</td>
        <td onClick={ this.props.showTrend } data-value={ trend.id }>
          { trend.full_name }
        </td>
        <td>{ trend.stargazers_count }</td>
        <td>{ trend.language }</td>
      </tr>
    )
  }

  renderCollection = () => {
    return this.props.trends.map((item, index) => {
      return this.renderTr(item, index);
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

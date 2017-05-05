import React, { Component } from "react"
import { Table } from "react-bootstrap"
import { Button } from "react-bootstrap"

export default class TrendShow extends Component {
  render() {
    return (
      <div>
        <Table responsive>
          <thead>
            <tr>
              <th>Name</th><th>{ this.props.trend.full_name }</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Description</td><td>{ this.props.trend.description }</td>
            </tr>
            <tr>
              <td>Language</td><td>{ this.props.trend.language }</td>
            </tr>
            <tr>
              <td>Stars count</td><td>{ this.props.trend.stargazers_count }</td>
            </tr>
            <tr>
              <td>url</td><td><a href={ this.props.trend.html_url }>{ this.props.trend.html_url }</a></td>
            </tr>
          </tbody>
        </Table>
        <Button onClick={ this.props.showTrendsIndex }>Back</Button>
      </div>
    )
  }
}

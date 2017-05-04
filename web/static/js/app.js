import React, { Component } from "react"
import { render } from "react-dom"
import TableLayout from "./components/table_layout"

class Root extends Component {
  render() {
    return (
      <div>
        <h1>Github trends</h1>
        <TableLayout />
      </div>
    )
  }
}

render(
  <Root/>,
  document.getElementById("root")
)

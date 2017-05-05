import React, { PureComponent } from "react"
import { render } from "react-dom"
import Main from "./components/main"

class Root extends PureComponent {
  render() {
    return (
      <div>
        <h1>Github trends</h1>
        <Main/>
      </div>
    )
  }
}

render(
  <Root/>,
  document.getElementById("root")
)

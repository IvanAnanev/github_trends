import React, { PureComponent } from "react"
import TrendsIndex from "./trends_index"
import TrendShow from "./trend_show"

export default class Main extends PureComponent {
  state = {
    showComponent: "trendsIndex",
    trends: [],
    showTrend: {}
  }

  componentWillMount() {
    this.fetchTrends()
  }

  fetchTrends = () => {
    return fetch("/api/repositories")
      .then((success, error) => success.json())
      .then((trends) => this.setState({ trends }))
  }

  showTrend = ({ target }) => {
    return fetch(`/api/repositories/${target.dataset.value}`)
      .then((success, error) => success.json())
      .then((showTrend) => {
        this.setState({ showTrend,  showComponent: "trendShow" })
      })
  }

  showTrendsIndex = () => {
    this.setState({ showComponent: "trendsIndex" })
  }

  renderComponent = () => {
    if (this.state.showComponent == "trendsIndex") {
      return (<TrendsIndex trends={ this.state.trends } showTrend={ this.showTrend }/>)
    }
    return (<TrendShow trend={ this.state.showTrend } showTrendsIndex={ this.showTrendsIndex }/>)
  }

  render() {
    return (
      <div>
        { this.renderComponent() }
      </div>
    )
  }
}

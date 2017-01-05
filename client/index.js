import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux'
import ReactOnRails from 'react-on-rails'

import App from './components/app'
// import reducers from './reducers'

const createStoreWithMiddleware = applyMiddleware()(createStore)

// ReactDOM.render(<App />, document.querySelector('.container'))

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  App,
})

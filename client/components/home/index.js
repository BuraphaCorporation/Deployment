import React, { Component } from 'react'
import ReactDOM from 'react-dom'

import TopNav from './top_nav'
import Footer from './footer'
import SigninForm from './signin_form'
import SignupForm from './signup_form'

class Index extends Component {
  constructor(props) {
    super(props)

    // this.state = {
    //
    // }
  }

  render() {
    return (
      <div>
        <div id="fb-root"></div>

        <div className="wrapper">
          <TopNav />
          <Footer />
        </div>

        <div className="modal fade" role="dialog">
          <div className="model-dialog modal-sm" role="document">
            <SigninForm />
            <SignupForm />
          </div>
        </div>

        <div id="drift-widget-container" data-turbolinks-permanent></div>
      </div>
    )
  }
}

export default Index

import React, { PropTypes } from 'react';

class HelloWorld extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired,
  };

  constructor(props, _railsContext) {
    super(props);

    this.state = { name: this.props.name }
  }

  updateName = (name) => {
    this.setState({ name })
  };

  render() {
    return (
      <div>
        <h3>
          Hello, {this.state.name}!
        </h3>
        <hr />
        <form >
          <label htmlFor="name">
            Say hello to:
          </label>
          <input
            id="name"
            type="text"
            value={this.state.name}
            onChange={(e) => this.updateName(e.target.value)}
          />
        </form>
      </div>
    );
  }
}

export default HelloWorld

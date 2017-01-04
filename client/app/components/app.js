import _ from 'lodash'
import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import YTSearch from 'youtube-api-search'

import SearchBar from './search_bar'
import VideoDetails from './video_details'
import VideoList from './video_list'

const API_KEY = 'AIzaSyATDxbjB5GlP4IquJmInm_qp7dTIgm93Jo'

class App extends Component {
  constructor(props) {
    super(props)

    this.state = {
      videos: [],
      selectedVideo: null
    }

    this.videoSearch('nonmadden')
  }

  videoSearch(term) {
    YTSearch({ key: API_KEY, term: term}, (videos) => {
      // console.log(foo)
      this.setState({
        videos: videos,
        selectedVideo: videos[0]
      })
    })
  }

  render() {
    const videoSearch = _.debounce( term => { this.videoSearch(term)}, 500)

    return (
      <div className="container">
        <SearchBar onSearchTermChange={ videoSearch } />
        <VideoDetails video={ this.state.selectedVideo } />
        <VideoList
          onVideoSelect={ selectedVideo => this.setState({ selectedVideo }) }
          videos={ this.state.videos } />
      </div>
    )
  }
}

export default App

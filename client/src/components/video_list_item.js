import React, { Component } from 'react';
//
// class VideoListItem extends Component {
//   render() {
//     return (
//       <div></div>
//     )
//   }
// }
//

const VideoListItem = ({ video, onVideoSelect }) => {
  // console.log(video)
  const title = video.snippet.title
  const imageUrl = video.snippet.thumbnails.default.url

  return (
    <li onClick={ () => onVideoSelect(video) } className="list-group-item">
      <div className="video-list media">
        <div className="media-left">
          <img className="media-object" src={ imageUrl } />
        </div>
        <div className="media-body">
          <div className="media-header">
            { title }
          </div>
        </div>
      </div>
    </li>
  )
}

export default VideoListItem;

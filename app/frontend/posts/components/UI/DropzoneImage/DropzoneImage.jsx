import React, { Component } from 'react';
import Dropzone from 'react-dropzone'

class DropzoneImage extends Component {
  constructor(props){
    super(props)
    this.state = {acceptedfiles: [],rejectedfiles: []}
  }

  handleDrop(accepted, rejected) {
    this.setState({acceptedfiles: accepted, rejectedfiles: rejected})
  }

  handleOpenClick() {
    this.dropzone.open()
  }

  handleUpload() {

    let data = new FormData()
    data.append('name', 'Tom')
    data.append('age', '28')

    let cnt = 1
    this.state.acceptedfiles.map(file =>{
      data.append('file_' + cnt, file)
      cnt+=1
    })

    axios.post(HOST_NAME + '/upload_image', data)


  }

  render(){
    let prev = []
    this.state.acceptedfiles.map(f =>
      prev.push(
        <div className="preview">
          <img key={f.name} src={f.preview} width="100" height="100" />
        </div>
      )
    )

    return (
      <section>
        <div className="uploadFile">
          Hello Upload...
          <Dropzone
            ref={(node) => this.dropzone = node}
            accept="image/jpg,image/png"
            onDrop={(accepted, rejected)=> this.handleDrop(accepted, rejected)}
          >
            ここにファイルをドロップしてください。
          </Dropzone>
          <button type="button" onClick={(e) => this.handleOpenClick(e)}>
              Open Dropzone
          </button>
          <button type="button" onClick={(e) => this.handleUpload(e)}>
              Upload実行
          </button>
        </div>
        <div className="uploadFile">
          <h2>Accepted files...</h2>
          <ul>
            {this.state.acceptedfiles.map(f => <li key={f.name}>{f.name} - {f.size}</li>)}
          </ul>
        </div>
        <div className="uploadFile">
          <h2>Rejected files...</h2>
          <ul>
            {this.state.rejectedfiles.map(f => <li key={f.name}>{f.name} - {f.size}</li>)}
          </ul>
        </div>
        <br className="clear" />
        <div>
          <h2>Preview</h2>
          {prev}
          <br className="clear" />
        </div>
      </section>
    )
  }
}

export default DropzoneImage;

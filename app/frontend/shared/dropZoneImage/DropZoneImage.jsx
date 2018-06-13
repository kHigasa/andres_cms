import React, { Component, PropTypes } from 'react';
import Dropzone from 'react-dropzone';

const propTypes = {
  value: PropTypes.string,
  handleUpdate: PropTypes.func.isRequired,
};

const defaultProps = {
  value: ''
};

class DropzoneImage extends Component {
  constructor() {
    super();
    this.state = { errorMessage: '' };
    this.handleDrop = this.handleDrop.bind(this);
  }

  handleDrop(files) {
    const file = files[0];

    if (!(/.*image\/(gift|jpg|jpeg|png)$/i).test(file.type)) {
      return this.setState({ errorMessage: 'Cannot upload image file' });
    }

    const self = this;
    const reader = new FileReader();

    reader.onload = (upload) => {
      self.props.handleUpdate(upload.target.result);
      self.setState({ errorMessage: '' });
    };

    reader.onerror = () => {
      self.setState({ errorMessage: 'Cannot upload image file' });
    };

    reader.readAsDataURL(file);
  }

  renderImageBox() {
    if (this.props.value) {
      return (
        <img
          src={this.props.value}
          width="100"
          alt=""
        />
      );
    }
  }

  renderErrorMessage() {
    if (this.state.errorMessage) {
      return <span>{this.state.errorMessage}</span>;
    }
  }

  renderPlaceholder() {
    if (!this.props.value) {
      return (
        <span>Drop file here or click to upload.</span>
      );
    }
  }

  render() {
    return(
      <div>
        <Dropzone
          onDrop={this.handleDrop}
        >
          {this.renderPlaceholder()}
          {this.renderImageBox()}
          {this.renderErrorMessage()}
        </Dropzone>
      </div>
    );
  }
}

DropzoneImage.propTypes = propTypes;
DropzoneImage.defaultProps = defaultProps;

export default DropzoneImage;

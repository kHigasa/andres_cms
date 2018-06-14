import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';
import FormHelperText from '@material-ui/core/FormHelperText';
import FormControl from '@material-ui/core/FormControl';
import DropzoneImage from '../../../../shared/dropZoneImage/DropZoneImage';

const propTypes = {
  fields: PropTypes.object.isRequired,
  cancelButton: PropTypes.element,
  deleteButton: PropTypes.element.isRequired,
  submitting: PropTypes.bool.isRequired,
  handleUpdateItem: PropTypes.func.isRequired,
  handleSubmit: PropTypes.func.isRequired,
};

const fields = ['image', 'caption'];

class ItemImage extends Component {
  constructor(props) {
    super(props);
    this.handleUpdateItem = this.handleUpdateItem.bind(this);
  }

  handleUpdateItem(props) {
    this.props.handleUpdateItem({ image: props.image, caption: props.caption });
  }

  renderErrorMessage() {
    if (this.props.fields.image.touched && this.props.fields.image.error) {
      return (
        <span>{this.props.fields.image.error}</span>
      );
    }
  }

  render() {
    const { handleSubmit, submitting, fields: { image, caption } } = this.props;

    return (
      <div>
        <label>Image</label>
        <DropzoneImage
          {...image}
          handleUpdate={(file) => image.onChange(file)}
        />
        {this.renderErrorMessage()}
      </div>
    )
  }
}

ItemImage.propTypes = propTypes;

import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';

import axios from '../../../axios-posts';
import Form from '../../../components/UI/Form/Form';
import Button from '../../../components/UI/Button/Button';
import TagField from '../../../components/UI/TagField/TagField';
import Spinner from '../../../components/UI/Spinner/Spinner';

class NewPost extends Component {
  state = {
    postForm: {
      title: {
        elementType: 'input',
        elementConfig: {
          type: 'text',
          placeholder: 'Title'
        },
        value: '',
        validation: {
          required: true
        },
        valid: false,
        touched: false,
        errorMessage: 'Title'
      }
    },
    formIsValid: false,
    loading: false,
    submitted: false
  }

  postHandler = (e) => {
    e.preventDefault();
    this.setState({ loading: true });

    const formData = {};
    for (let formElementIdentifier in this.state.postForm) {
      formData [formElementIdentifier] = this.state.postForm[formElementIdentifier].value;
    }

    const post = {
      postData: formData
    };

    axios.post('/posts', post)
      .then((res) => {
        console.log(res);
        this.setState({ loading: false, submitted: true });
        this.props.history.push('/posts');
      })
      .catch((err) => {
        console.log(err);
        this.setState({ loading: false });
      });
  }

  checkValidity(value, rules) {
    let isValid = true;
    if (!rules) {
      return true;
    }

    if (rules.required) {
      isValid = value.trim() !== ''  && isValid
    }

    return isValid;
  }

  inputChangedHandler = (e, inputIdentifier) => {
    const updatedPostForm = {
      ...this.state.postForm
    };
    const updatedFormElement = {
      ...updatedPostForm[inputIdentifier]
    };
    updatedFormElement.value = e.target.value;
    updatedFormElement.valid = this.checkValidity(
      updatedFormElement.value,
      updatedFormElement.validation
    );
    updatedFormElement.touched = true;
    updatedPostForm[inputIdentifier] = updatedFormElement;

    let formIsValid = true;
    for (let inputIdentifier in updatedPostForm) {
      formIsValid = updatedPostForm[inputIdentifier].valid && formIsValid;
    }
    this.setState({ postForm: updatedPostForm, formIsValid })
  }

  render() {
    let redirect = null;
    if (this.state.submitted) {
      redirect = <Redirect to='/posts' />;
    }
    let form = (
      <form onSubmit={this.postHandler}>
        <Form />
        <TagField />
        <Button>POST</Button>
      </form>
    );
    if (this.state.loading) {
      form = <Spinner />;
    }
    return (
      <div>
        {redirect}
        {form}
      </div>
    );
  }
}

export default NewPost;

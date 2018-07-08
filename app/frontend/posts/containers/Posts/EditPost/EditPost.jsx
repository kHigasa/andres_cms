import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';

import axios from '../../../axios-posts';
import PostItemsForm from '../../../components/UI/Form/PostItemsForm';
import TagField from '../../../components/UI/TagField/TagField';
import Spinner from '../../../components/UI/Spinner/Spinner';

class EditPost extends Component {
  state = {
    post: null,
    error: false,
    submitted: false,
    loading: false,
    postForm: [{
      tags: [{
        post_id: '',
        name: {
          validation: {
            required: true
          },
          valid: false,
          touched: false,
          errorMessage: 'Tag'
        }
      }],
      postItems: [{
        post_id: '',
        description: {
          validation: {
            required: true
          },
          valid: false,
          touched: false,
          errorMessage: 'Description'
        },
        sort_rank: {
          validation: {
            required: true
          },
          valid: false,
          touched: false,
          errorMessage: 'SortRank'
        },
        image: {
          validation: {
            required: false
          },
          valid: false,
          touched: false,
          errorMessage: 'Image'
        }
      }]
    }]
  }

  componentDidMount() {
    if (this.props.match.params.id) {
      if (!this.state.post) {
        axios.get('/' + this.props.match.params.id)
          .then((res) => {
            const post = res.data;
            this.setState({
              post,
              postForm: [{
                tags: [{
                  post_id: post.id
                }],
                post_items: [{
                  post_id: post.id
                }]
              }]
            });
            console.log(post);
          })
          .catch((err) => {
            console.log(err)
            this.setState({error: true});
          });
      }
    }
  }

  postHandler = (e) => {
  this.setState({ loading: true });
    e.preventDefault();
    const formData = {};
    for (let formElementModel in this.state.postForm) {
      formData[formElementModel] = this.state.postForm[formElementModel].value;
    }
    const postContent = formData;

    axios.post('/:id', postContent)
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

  render() {
    let post = <p>Something went wrong.</p>;
    if (!this.state.error  && this.state.post) {
      post = null;
    }

    let redirect = null;
    if (this.state.submitted) {
      redirect = <Redirect to='/posts' />;
    }

    let form = (
      <form onSubmit={this.postHandler}>
        <TagField />
        <PostItemsForm />
      </form>
    );
    if (this.state.loading) {
      form = <Spinner />;
    }

    return (
      <div>
        {redirect}
        {post}
        {form}
      </div>
    );
  }
}

export default EditPost;

import axios from 'axios';

const instance = axios.create({
  baseURL: 'localhost:5000/api/posts/'
});

export default instance;

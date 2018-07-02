import React from 'react';
import { BrowserRouter as Router } from 'react-router-dom';

import Layouts from './Layouts';

const app = () => (
  <Router>
    <Layouts />
  </Router>
);

export default app;

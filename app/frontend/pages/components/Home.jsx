import React from 'react';
import ReactDOM from 'react-dom';
import { ParallaxProvider, Parallax } from 'react-skrollr';

import homeImage from '../images/home.png';
import '../styles/home.css';

class Home extends React.Component {
  render() {
    return (
      <ParallaxProvider
        init={{
          smoothScrollingDuration: 500,
          smoothScrolling: true,
          forceHeight: false
        }}
      >
        <Parallax
          data={{
            'data-center-center': 'opacity: 1;',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <img src={homeImage} className='homeImage' />
        </Parallax>
      </ParallaxProvider>
    );
  }
}

export default Home;

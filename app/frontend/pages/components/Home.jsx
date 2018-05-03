import React from 'react';
import ReactDOM from 'react-dom';
import { ParallaxProvider, Parallax } from 'react-skrollr';

import homeImage from '../images/home.png';
// import smoothImage from '../images/smooth.jpg';
import '../styles/home.css';

class Home extends React.Component {
  render() {
    return (
      <ParallaxProvider>
        <img src={homeImage} className='homeImage' />
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
        <Parallax
          data={{
            'data-top-top': 'transform: translateX(-100%);',
            'data-center-center': 'opacity: 1;transform: translateX(0%);',
            'data-bottom-top': 'opacity: 0;'
          }}
        >
          <span>
            "Start scrolling!!"
            "star"
          </span>
        </Parallax>
      </ParallaxProvider>
    );
  }
}

export default Home;

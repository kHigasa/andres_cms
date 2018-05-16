import React from 'react';
import { ParallaxProvider, Parallax } from 'react-skrollr';
import homeImage from '../images/home.png';
import smoothImage from '../images/smooth.jpg';
import '../styles/home.css';

const Home = () => (
  <ParallaxProvider className='Page_section'>
    <img src={homeImage} alt='homeImage' className='homeImage' />
    <Parallax
      data={{
        'data-bottom-top': 'transform: translateX(-800px);',
        'data-200-center-center': 'transform: translateX(0);'
      }}
    >
      <img src={smoothImage} alt='smoothImage' className='smoothImage' />
    </Parallax>
    <Parallax
      className='Page_text'
      data={{
        'data-bottom-top': 'transform: translateX(800px);',
        'data-200-center-center': 'transform: translateX(0);'
      }}
    >
      <div className='Page_title'>Convenience Shouldn’t Compromise Quality</div>
      <div className='Page_content'>
        Our team of professional chefs have applied their skill and experience to create a menu
        <br />that is diverse, ethical, and appealing to just about every taste.
        <br />We focus on healthy ingredients found seasonally and locally, warm comfort foods,
        <br />and hearty flavours that travel directly to you – so you can focus on doing
        <br />whatever it is youre doing.
      </div>
    </Parallax>
    <Parallax
      data={{
        'data-top-top': 'transform: translateX(-100%);',
        'data-center-center': 'opacity: 1;transform: translateX(0%);',
        'data-bottom-top': 'opacity: 0;'
      }}
    >
      <span>
        Start scrolling!!
        star
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
        Start scrolling!!
        star
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
        Start scrolling!!
        star
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
        Start scrolling!!
        star
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
        Start scrolling!!
        star
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
        Start scrolling!!
        star
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
        Start scrolling!!
        star
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
        Start scrolling!!
        star
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
        Start scrolling!!
        star
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
        Start scrolling!!
        star
      </span>
    </Parallax>
  </ParallaxProvider>
);

export default Home;

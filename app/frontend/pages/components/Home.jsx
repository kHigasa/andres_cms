import React from 'react';
import { ParallaxProvider, Parallax } from 'react-skrollr';
import smoothImage from '../images/smooth.jpg';

const Home = () => (
  <ParallaxProvider className='Page_section columns'>
    <Parallax
      data={{
        'data-bottom-top': 'transform: translateX(-800px);',
        'data-200-center-center': 'transform: translateX(0);'
      }}
    >
      <img src={smoothImage} alt='smoothImage' className='smoothImage is-6 is-pulled-left' />
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
  </ParallaxProvider>
);

export default Home;

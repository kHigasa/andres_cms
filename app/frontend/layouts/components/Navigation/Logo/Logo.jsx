import React from 'react';

import geilLogo from '../../../../packs/images/geil.png';

const logo = props => (
  <div className='navigationLogo' style={{height: props.height}}>
    <img src={geilLogo} alt='学生団体GEIL' />
  </div>
);

export default logo;

import React from 'react';

const tagField = () => (
  <div className='field is-horizontal'>
    <div className='field-label'>
      <label className='label'>タグ名</label>
    </div>
    <div className='field-body'>
      <div className='field'>
        <p className='control'>
          <input className='input' type='text' name='post[tags_attributes][0][name]' id='post_tags_attributes_0_name' />
        </p>
      </div>
    </div>
  </div>
);

export default tagField;

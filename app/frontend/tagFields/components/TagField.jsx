import React from 'react';

const tagField = () => (
  <div className='field is-horizontal'>
    <div className='field-label'>
      <label className='label' htmlFor='post_tags_attributes_100_name'>タグ名</label>
    </div>
    <div className='field-body'>
      <div className='field'>
        <p>
          <i className='fa fa-exclamation-triangle'>タグは1つづつ追加して保存してください。</i>
        </p>
        <p className='control'>
          <input className='input' type='text' name='post[tags_attributes][100][name]' id='post_tags_attributes_100_name' />
        </p>
      </div>
    </div>
  </div>
);

export default tagField;

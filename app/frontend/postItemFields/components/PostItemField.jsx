import React from 'react';

const postItemField = () => (
  <div>
    <div className='field is-horizontal'>
      <div className='field-label'>
        <label className='label' require='true' htmlFor='post_post_items_attributes_100_sort_rank'>並び順</label>
      </div>
      <div className='field-body'>
        <div className='field'>
          <p>
            <i className='fa fa-exclamation-triangle'>投稿内容は1つづつ追加して保存してください。</i>
          </p>
          <p className='control'>
            <input className='input' type='number' name='post[post_items_attributes][100][sort_rank]' id='post_post_items_attributes_100_sort_rank' />
          </p>
        </div>
      </div>
    </div>
    <div className='field is-horizontal'>
      <div className='field-label'>
        <label className='label' htmlFor='post_post_items_attributes_100_image'>画像</label>
      </div>
      <div className='field-body'>
        <div className='field'>
          <p className='control'>
            <input className='input' type='file' name='post[post_items_attributes][100][image]' id='post_post_items_attributes_100_image' />
          </p>
          <p className='control'>
            <input type='hidden' name='post[post_items_attributes][100][image_cache]' id='post_post_items_attributes_100_image_cache' />
          </p>
        </div>
      </div>
    </div>
    <div className='field is-horizontal'>
      <div className='field-label'>
        <label className='label' htmlFor='post_post_items_attributes_100_description'>テキスト</label>
      </div>
      <div className='field-body'>
        <div className='field'>
          <p className='control'>
            <input className='input' require='true' type='text' name='post[post_items_attributes][100][description]' id='post_post_items_attributes_100_description' />
          </p>
        </div>
      </div>
    </div>
  </div>
);

export default postItemField;

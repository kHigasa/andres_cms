module ApplicationHelper
  def default_meta_tags
    {
      site: Settings.meta.site,
      title: Settings.meta.title,
      reverse: true,
      charset: 'utf-8',
      description: Settings.meta.description,
      keyword: Settings.meta.keyword,
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: Settings.meta.site,
        title: Settings.meta.title,
        description: Settings.meta.description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary',
        site: '@waavgeil'
      }
    }
  end

  def page_title
    default_title = '学生団体GEIL'
    title = if @page_title.present?
              @page_title + ' | ' + default_title
            else
              default_title
            end
    title
  end
end

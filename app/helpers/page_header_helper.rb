module PageHeaderHelper
  def page_header(title, subtitle=nil)
    render partial: 'layouts/page_header', locals: {h1: title, small: subtitle}
  end
end

require 'spec_helper'

describe 'PageHeaderHelper' do
  it 'renders a page header with a title only' do
    helper.should_receive(:render).with({partial: "layouts/page_header", locals: {h1: "Title", small: nil}})
    helper.page_header('Title')
  end

  it 'renders a page header with a title and subtitle' do
    helper.should_receive(:render).with({partial: "layouts/page_header", locals: {h1: "Title", small: "Subtitle"}})
    helper.page_header('Title', 'Subtitle')
  end

  it 'does not render a page header without a title' do
    expect {helper.page_header}.to raise_error(ArgumentError)
  end
end

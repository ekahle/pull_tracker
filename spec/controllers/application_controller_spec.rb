require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      render text: 'Anonymous controller'
    end
  end
end

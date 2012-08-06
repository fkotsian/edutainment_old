require 'spec_helper'

describe VideosController do

  describe "GET 'favorite'" do
    it "returns http success" do
      get 'favorite'
      response.should be_success
    end
  end

end

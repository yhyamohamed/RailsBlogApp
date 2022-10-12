class AboutController < ApplicationController
  before_action :authenticate_user!,only: %i[test]
  def index

  end
  def test

  end
end

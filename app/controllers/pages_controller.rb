class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def wedding
    @title = "Wedding"
  end

  def reception
    @title = "Reception"
  end

  def registry
    @title = "Registry"
  end

  def honeymoon
    @title = "Honeymoon"
  end

end

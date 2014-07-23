class BookmarkletsController < ApplicationController
before_action :check_referer, only: [:index]
 	
  # GET /bookmarklets
  # GET /bookmarklets.json
  def index
    @url = params[:url]
    user = current_user
    @bookmarklet = Bookmarklet.new(@url, user)
    @bookmarklet.run
    redirect_to user.latest_hunt
  end

  private
  def check_referer
    cl_indicators = ["craigslist.org", "all housing", "postingbody"]
    url = request.referer
    contents = open(url) {|f| f.read }
    if cl_indicators.any? { |indicator| !contents.include?(indicator) }
      redirect_to url
    end
  end
end
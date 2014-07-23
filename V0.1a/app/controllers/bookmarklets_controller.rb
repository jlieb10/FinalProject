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
      url = request.referrer
      host = Addressable::URI.parse(url).host
    	if !host.match("craigslist.org")
        redirect_to url
      end
    end

end

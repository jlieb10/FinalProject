class BookmarkletsController < ApplicationController

  # GET /bookmarklets
  # GET /bookmarklets.json
  def index
    @url = params[:url]
    user = current_user
    @bookmarklet = Bookmarklet.new(@url, user)
    @bookmarklet.run
    redirect_to user.latest_hunt
  end

end

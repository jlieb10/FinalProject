class BookmarkletsController < ApplicationController
  before_action :set_bookmarklet, only: [:show, :edit, :update, :destroy]

  # GET /bookmarklets
  # GET /bookmarklets.json
  def index
    user = current_user
    hunt = user.hunts.last
    @bookmarklet = Bookmarklet.new(params[:url], user)
    @bookmarklet.run
    redirect_to hunt_path(hunt.id)
  end

  # GET /bookmarklets/1
  # GET /bookmarklets/1.json
  def show
  end

  # GET /bookmarklets/new
  def new
    @bookmarklet = Bookmarklet.new
  end

  # GET /bookmarklets/1/edit
  def edit
  end

  # POST /bookmarklets
  # POST /bookmarklets.json
  def create
    @bookmarklet = Bookmarklet.new(bookmarklet_params)

    # respond_to do |format|
    #   if @bookmarklet.save
    #     format.html { redirect_to @bookmarklet, notice: 'Bookmarklet was successfully created.' }
    #     format.json { render :show, status: :created, location: @bookmarklet }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @bookmarklet.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /bookmarklets/1
  # PATCH/PUT /bookmarklets/1.json
  def update
    respond_to do |format|
      if @bookmarklet.update(bookmarklet_params)
        format.html { redirect_to @bookmarklet, notice: 'Bookmarklet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmarklet }
      else
        format.html { render :edit }
        format.json { render json: @bookmarklet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarklets/1
  # DELETE /bookmarklets/1.json
  def destroy
    @bookmarklet.destroy
    respond_to do |format|
      format.html { redirect_to bookmarklets_url, notice: 'Bookmarklet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmarklet
      @bookmarklet = Bookmarklet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmarklet_params
      params[:bookmarklet]
    end
end

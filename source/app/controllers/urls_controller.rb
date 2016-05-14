class UrlsController < ApplicationController
  before_action :set_url, only: [:edit, :update, :destroy]
  before_action :set_short, only: [:create]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    @url = Url.find_by short: params[:id]
    redirect_to "//" + @url.name
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create
    insertion = url_params
    insertion[:short] = @short
    @url = Url.new(insertion)

    respond_to do |format|
      if @url.save
        format.html { redirect_to "/urls", notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to @url, notice: 'Url was successfully updated.' }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def is_valid_url?
        uri = URI.parse self
        uri.kind_of? URI::HTTP
    rescue URI::InvalidURIError
        false
    end
    
    def set_short
      @short = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).sample(6).join
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:name)
    end
    

end

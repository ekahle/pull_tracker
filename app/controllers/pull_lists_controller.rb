class PullListsController < ApplicationController
  before_action :set_pull_list, only: [:show, :edit, :update, :destroy]

  # GET /pull_lists
  # GET /pull_lists.json
  def index
    @pull_lists = PullList.all
  end

  # GET /pull_lists/1
  # GET /pull_lists/1.json
  def show
  end

  # GET /pull_lists/new
  def new
    @pull_list = PullList.new
  end

  # GET /pull_lists/1/edit
  def edit
  end

  # POST /pull_lists
  # POST /pull_lists.json
  def create
    @pull_list = PullList.new(pull_list_params)

    respond_to do |format|
      if @pull_list.save
        format.html { redirect_to @pull_list, notice: 'Pull list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pull_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @pull_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pull_lists/1
  # PATCH/PUT /pull_lists/1.json
  def update
    respond_to do |format|
      if @pull_list.update(pull_list_params)
        format.html { redirect_to @pull_list, notice: 'Pull list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pull_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pull_lists/1
  # DELETE /pull_lists/1.json
  def destroy
    @pull_list.destroy
    respond_to do |format|
      format.html { redirect_to pull_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pull_list
      @pull_list = PullList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pull_list_params
      params.require(:pull_list).permit(:pull_id, :file)
    end
end

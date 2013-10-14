class PullsController < ApplicationController
  before_action :set_pull, only: [:show, :edit, :update, :destroy]

  # GET /pulls
  # GET /pulls.json
  def index
    @pulls = Pull.all
  end

  # GET /pulls/1
  # GET /pulls/1.json
  def show
  end

  # GET /pulls/new
  def new
    @pull = Pull.new
  end

  # GET /pulls/1/edit
  def edit
  end

  # POST /pulls
  # POST /pulls.json
  def create
    @pull = Pull.new(pull_params)

    respond_to do |format|
      if @pull.save
        format.html { redirect_to @pull, notice: 'Pull was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pull }
      else
        format.html { render action: 'new' }
        format.json { render json: @pull.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pulls/1
  # PATCH/PUT /pulls/1.json
  def update
    respond_to do |format|
      if @pull.update(pull_params)
        format.html { redirect_to @pull, notice: 'Pull was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pull.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pulls/1
  # DELETE /pulls/1.json
  def destroy
    @pull.destroy
    respond_to do |format|
      format.html { redirect_to pulls_url, notice: 'Pull was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pull
      @pull = Pull.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pull_params
      params.require(:pull).permit(:name, :status, :target_completion_date, :description, :specimen_type, :file, :investigator, :requester, :pull_list_maker, :lab_contact_name, :notes_for_lab, :has_mta, :has_budget, :accepted_consent_to_long_term_storage, :accepted_emory_specimens, :accepted_cold_chain_quality, :accepted_specimen_quality)
    end
end

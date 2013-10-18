class PullManifestsController < ApplicationController
  before_action :set_pull_manifest, only: [:show, :edit, :update, :destroy]

  # GET /pull_manifests
  # GET /pull_manifests.json
  def index
    @pull_manifests = PullManifest.all
  end

  # GET /pull_manifests/1
  # GET /pull_manifests/1.json
  def show
  end

  # GET /pull_manifests/new
  def new
    @pull_manifest = PullManifest.new
  end

  # GET /pull_manifests/1/edit
  def edit
  end

  # POST /pull_manifests
  # POST /pull_manifests.json
  def create
    @pull_manifest = PullManifest.new(pull_manifest_params)

    respond_to do |format|
      if @pull_manifest.save
        format.html { redirect_to @pull_manifest, notice: 'Pull manifest was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pull_manifest }
      else
        format.html { render action: 'new' }
        format.json { render json: @pull_manifest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pull_manifests/1
  # PATCH/PUT /pull_manifests/1.json
  def update
    respond_to do |format|
      if @pull_manifest.update(pull_manifest_params)
        format.html { redirect_to @pull_manifest, notice: 'Pull manifest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pull_manifest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pull_manifests/1
  # DELETE /pull_manifests/1.json
  def destroy
    @pull_manifest.destroy
    respond_to do |format|
      format.html { redirect_to pull_manifests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pull_manifest
      @pull_manifest = PullManifest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pull_manifest_params
      params.require(:pull_manifest).permit(:file)
    end
end

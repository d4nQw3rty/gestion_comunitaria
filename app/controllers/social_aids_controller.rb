class SocialAidsController < ApplicationController
  before_action :set_social_aid, only: %i[ show edit update destroy ]

  # GET /social_aids or /social_aids.json
  def index
    @social_aids = SocialAid.all
  end

  # GET /social_aids/1 or /social_aids/1.json
  def show
  end

  # GET /social_aids/new
  def new
    @social_aid = SocialAid.new
  end

  # GET /social_aids/1/edit
  def edit
  end

  # POST /social_aids or /social_aids.json
  def create
    @social_aid = SocialAid.new(social_aid_params)

    respond_to do |format|
      if @social_aid.save
        format.html { redirect_to social_aid_url(@social_aid), notice: "Social aid was successfully created." }
        format.json { render :show, status: :created, location: @social_aid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @social_aid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_aids/1 or /social_aids/1.json
  def update
    respond_to do |format|
      if @social_aid.update(social_aid_params)
        format.html { redirect_to social_aid_url(@social_aid), notice: "Social aid was successfully updated." }
        format.json { render :show, status: :ok, location: @social_aid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @social_aid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_aids/1 or /social_aids/1.json
  def destroy
    @social_aid.destroy

    respond_to do |format|
      format.html { redirect_to social_aids_url, notice: "Social aid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_aid
      @social_aid = SocialAid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def social_aid_params
      params.require(:social_aid).permit(:name, :description)
    end
end

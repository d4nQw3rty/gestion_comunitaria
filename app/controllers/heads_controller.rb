class HeadsController < ApplicationController
  before_action :set_head, only: %i[ show edit update destroy ]

  # GET /heads or /heads.json
  def index
    @heads = Head.all
  end

  # GET /heads/1 or /heads/1.json
  def show
  end

  # GET /heads/new
  def new
    @head = Head.new
  end

  # GET /heads/1/edit
  def edit
  end

  # POST /heads or /heads.json
  def create
    @head = Head.new(head_params)

    respond_to do |format|
      if @head.save
        format.html { redirect_to head_url(@head), notice: "Head was successfully created." }
        format.json { render :show, status: :created, location: @head }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @head.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heads/1 or /heads/1.json
  def update
    respond_to do |format|
      if @head.update(head_params)
        format.html { redirect_to head_url(@head), notice: "Head was successfully updated." }
        format.json { render :show, status: :ok, location: @head }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @head.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heads/1 or /heads/1.json
  def destroy
    @head.destroy

    respond_to do |format|
      format.html { redirect_to heads_url, notice: "Head was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_head
      @head = Head.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def head_params
      params.require(:head).permit(:cedula, :name, :sur_name, :birthdate, :user_id)
    end
end

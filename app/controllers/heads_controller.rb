class HeadsController < ApplicationController
  before_action :set_head, only: %i[ show edit update destroy ]

  # GET /heads or /heads.json
  def index
    
    if params[:query].present?
      @heads = Head.includes(:user).where(user_id: current_user.id).search_by_full_name(params[:query])
    else
      @heads = Head.includes(:user).where(user_id: current_user.id)
    end
    @count = @heads.size
  end

  # GET /heads/1 or /heads/1.json
  def show
    @heads = Head.includes(:user).where(user_id: current_user.id)
    @members = Member.includes(:head).where(head_id: @head.id)  
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
        format.html { redirect_to heads_url, notice: "Jefe de Hogar Creado." }
        format.json { render :index, status: :created, location: @head }
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
        format.html { redirect_to heads_url, notice: "Jefe de Hogar Actulizado." }
        format.json { render :index, status: :ok, location: @head }
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
      format.html { redirect_to heads_url, notice: "Jefe de Hogar Eliminado." }
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

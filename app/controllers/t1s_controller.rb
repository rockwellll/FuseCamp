class T1sController < ApplicationController
  before_action :set_t1, only: [:show, :edit, :update, :destroy]

  # GET /t1s
  # GET /t1s.json
  def index
    @t1s = T1.all
  end

  # GET /t1s/1
  # GET /t1s/1.json
  def show
  end

  # GET /t1s/new
  def new
    @t1 = T1.new
  end

  # GET /t1s/1/edit
  def edit
  end

  # POST /t1s
  # POST /t1s.json
  def create
    @t1 = T1.new(t1_params)

    respond_to do |format|
      if @t1.save
        format.html { redirect_to @t1, notice: 'T1 was successfully created.' }
        format.json { render :show, status: :created, location: @t1 }
      else
        format.html { render :new }
        format.json { render json: @t1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /t1s/1
  # PATCH/PUT /t1s/1.json
  def update
    respond_to do |format|
      if @t1.update(t1_params)
        format.html { redirect_to @t1, notice: 'T1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @t1 }
      else
        format.html { render :edit }
        format.json { render json: @t1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /t1s/1
  # DELETE /t1s/1.json
  def destroy
    @t1.destroy
    respond_to do |format|
      format.html { redirect_to t1s_url, notice: 'T1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t1
      @t1 = T1.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t1_params
      params.fetch(:t1, {})
    end
end

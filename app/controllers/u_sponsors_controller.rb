class USponsorsController < ApplicationController
  before_action :set_u_sponsor, only: [:show, :update, :destroy]

  # GET /u_sponsors
  def index
    @u_sponsors = USponsor.all.page(1).per(25)
    render json: @u_sponsors
  end

  # GET /u_sponsors/1
  def show
    render json: @u_sponsor
  end

  # POST /u_sponsors
  def create
    @u_sponsor = USponsor.new(u_sponsor_params)

    if @u_sponsor.save
      render json: @u_sponsor, status: :created, location: @u_sponsor
    else
      render json: @u_sponsor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /u_sponsors/1
  def update
    if @u_sponsor.update(u_sponsor_params)
      render json: @u_sponsor
    else
      render json: @u_sponsor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /u_sponsors/1
  def destroy
    @u_sponsor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_u_sponsor
      @u_sponsor = USponsor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def u_sponsor_params
      params.fetch(:u_sponsor, {})
    end
end

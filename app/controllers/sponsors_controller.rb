class SponsorsController < ApplicationController
  before_action :set_sponsor, only: [:show]
  def index
    @sponsors = Sponsor.paginate(page: params[:page], per_page: 50)
    render json: @sponsors
  end

  # GET /studies/1
  def show
    render json: @sponsor
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sponsor
      params.fetch(:sponsor, {})
    end
end

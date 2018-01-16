class ResponsiblePartiesController < ApplicationController
  before_action :set_study, only: [:show]
  def index
    @responsible_parties = ResponsibleParty.paginate(page: params[:page], per_page: 50)
    render json: @responsible_parties
  end

  # GET /studies/1
  def show
    render json: @responsible_party
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @responsible_party = ResponsibleParty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def responsible_party
      params.fetch(:responsible_party, {})
    end
end

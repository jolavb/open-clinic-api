class StudiesController < ApplicationController
  before_action :set_study, only: [:show]
  # GET /studies
  def index

    info = {
      page: params[:page] || 1,
      size: params[:per_page] || 10
    }


    @studies = Study.title(params[:officialTitle])
                    .phase(params[:selectedPhases])
                    .order('nct_id DESC')
                    .page(info[:page]).per(info[:size])

    render json: @studies, params: info, meta: pagination_dict(@studies)
  end

  # GET /studies/1
  def show
    render json: @study, showdetails: true
  end

  # POST /studies
  # def create
  #   @study = Study.new(study_params)
  #
  #   if @study.save
  #     render json: @study, status: :created, location: @study
  #   else
  #     render json: @study.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /studies/1
  # def update
  #   if @study.update(study_params)
  #     render json: @study
  #   else
  #     render json: @study.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /studies/1
  # def destroy
  #   @study.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      @study = Study.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def study_params
      params.fetch(:study, {})
    end
end

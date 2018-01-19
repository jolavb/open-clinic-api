class StudiesController < ApplicationController
  before_action :set_study, only: [:show]
  # GET /studies
  def index
    # if params[:filter]
    #     puts params[:filter]
    # end
    params.permit!
    if params[:phase]
      @studies = Study.where(phase: params['phase']).paginate(page: params[:page], per_page: 50)
    else
      @studies = Study.all.paginate(page: params[:page], per_page: 50)
    end
    render json: @studies
  end

  # GET /studies/1
  def show
    render json: @study
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

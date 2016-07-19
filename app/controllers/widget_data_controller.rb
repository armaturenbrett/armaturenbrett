class WidgetDataController < ApplicationController
  before_action :set_widget_datum, only: [:show, :edit, :update, :destroy]

  # GET /widget_datum_data
  def index
    @widget_data = WidgetDatum.all
    render json: @widget_data
  end

  # GET /widget_datum_data/example
  def show
    render json: @widget_datum
  end

  # POST /widget_datum_data.json
  def create
    @widget_datum = WidgetDatum.new(widget_datum_params)
    if @widget_datum.save
      render :show, status: :created, location: @widget_datum
    else
      render json: @widget_datum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /widget_datum_data/1.json
  def update
    if @widget_datum.update(widget_datum_params)
      render :show, status: :ok, location: @widget_datum
    else
      render json: @widget_datum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /widget_datum_data/1.json
  def destroy
    @widget_datum.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_widget_datum
    @widget_datum = WidgetDatum.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def widget_datum_params
    params.require(:widget_datum).permit(:name, :data)
  end
end

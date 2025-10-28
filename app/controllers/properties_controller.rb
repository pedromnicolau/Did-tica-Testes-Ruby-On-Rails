class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  def index
    props = Property.all
    props = props.in_city(params[:city]) if params[:city].present?
    props = props.priced_up_to(params[:max_price].to_i) if params[:max_price].present?

    respond_to do |format|
      format.html # renders app/views/properties/index.html.erb
      format.json { render json: props.as_json(only: %i[id title city state price_cents status]) }
    end
  end

  def show
    respond_to do |format|
      format.html # renders app/views/properties/show.html.erb
      format.json do
        render json: @property.as_json(
          only: %i[id title address city state zip price_cents status owner_id],
          include: { owner: { only: %i[id name email] } }
        )
      end
    end
  end

  def new
    @property = Property.new
  end

  def create
    property = Property.new(property_params)

    respond_to do |format|
      if property.save
        format.html { redirect_to property_path(property), notice: "Propriedade criada." }
        format.json { render json: property, status: :created }
      else
        format.html do
          @property = property
          render :new, status: :unprocessable_entity
        end
        format.json { render json: { errors: property.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # @property is set by before_action
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "Propriedade atualizada." }
        format.json { render json: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: { errors: @property.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy!
    respond_to do |format|
      format.html { redirect_to properties_path, notice: "Propriedade removida." }
      format.json { head :no_content }
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:title, :address, :city, :state, :zip, :price_cents, :status, :owner_id)
  end
end

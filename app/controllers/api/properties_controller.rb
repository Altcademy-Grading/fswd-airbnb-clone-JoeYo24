module Api
  class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :update, :destroy]
    before_action :authorize_user, only: [:update, :create, :destroy]

    def index
      @properties = Property.order(created_at: :desc).page(params[:page]).per(6)
      return render json: { error: 'not_found' }, status: :not_found if !@properties

      render 'api/properties/index', status: :ok
    end

    def create 
      authorize_user
        
      begin
        @property = Property.create(property_params)
        render 'api/properties/create', status: :created
      rescue ArgumentError => e 
        render json: { error: e.message }, status: :bad_request
      end
    end

    def update 
      authorize_user
    
      set_property
      
      begin
        @property.update(property_params)
        render 'api/properties/update', status: :ok
      rescue ArgumentError => e
        render json: { error: e.message }, status: :bad_request
      rescue => e 
        render json: { error: e.message }, status: :bad_request
      end    
    end
        
    def destroy 
      authorize_user
        
      set_property

      @property.destroy
      render 'api/properties/destroy', status: :no_content
    end

    def show
      @property = Property.find_by(id: params[:id])
      return render json: { error: 'not_found' }, status: :not_found if !@property

      render 'api/properties/show', status: :ok
    end

    private

    def set_property
      @property = Property.find(params[:id])
      return render json: { error: 'cannot find property' }, status: :not_found if !@property
    end

    def authorize_user
      session = current_session
      return render json: { error: 'user not logged in' }, status: :unauthorized if !session

      if @property.user_id != session.user.id
        return render json: { error: 'user not authorized to update property' }, status: :unauthorized
      end
    end

    def property_params
      params.require(:property).permit(:title, :description, :city, :country, :property_type, :price_per_night, :max_guests, :bedrooms, :beds, :baths, images: [])
    end    
  end
end
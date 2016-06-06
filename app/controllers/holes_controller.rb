class HolesController < ApplicationController


      respond_to :html, :json

      def index
        @holes = Hole.all
        @geojson = Array.new

        @holes.each do |hole|
          @geojson << {
            type: 'Feature',
            geometry: {
              type: 'Point',
              coordinates: [hole.lng, hole.lat]
            },
            properties: {
              name: hole.ID,
              :'marker-color' => '#00607d',
              :'marker-symbol' => 'default_marker',
              :'marker-size' => 'medium'
            }
          }
        end

        respond_with(@geojson)
      end

      def show
        @hole = Hole.find(params[:id])
      end

      def new
        @hole = Hole.new
      end

      def edit
        @hole = Hole.find(params[:id])
      end

      def create
        @hole = Hole.new(hole_params)

        if @hole.save
          redirect_to holes_path
        else
          render :new
        end
      end

      def update
        @hole = Hole.find(params[:id])

        if @hole.update_attributes(hole_params)
          redirect_to hole_path(@hole)
        else
          render :edit
        end
      end

      def destroy
        @hole = Hole.find(params[:id])
        @hole.destroy
        redirect_to holes_path
      end

      def import
        Hole.import(params[:file])
      end

      protected

      def hole_params
        params.require(:hole).permit(
          :ID, :date, :lat, :lng, :description
        )
      end

    end
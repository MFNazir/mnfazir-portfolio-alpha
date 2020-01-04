class PortfoliosController < ApplicationController
layout 'portfolio'
access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

    def index 
        @portfolios = Portfolio.by_position
    end

    def sort 
      params[:order].each do |key, value|
        Portfolio.find(value[:id]).update(position: value[:position])
    end

    render body: nil

  end

    def angular
      @angular_portfolio_items = Portfolio.angular

    end

    def new 
        @portfolio = Portfolio.new
        3.times { @portfolio.technologies.build}
    end 

    def show
      @portfolio = Portfolio.find(params[:id])

    end

    def create
        @portfolio = Portfolio.new(portfolio_params)
    
        respond_to do |format|
          if @portfolio.save
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
            format.json { render :show, status: :created, location: @portfolio }
          else
            format.html { render :new }
            format.json { render json: @portfolio.errors, status: :unprocessable_entity }
          end
        end
      end

      def edit
        @portfolio = Portfolio.find(params[:id])
        

      end

      def update
        @portfolio = Portfolio.find(params[:id])

        respond_to do |format|
          if @portfolio.update(portfolio_params)
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
            format.json { render :show, status: :ok, location: @portfolio }
          else
            format.html { render :edit }
            format.json { render json: @portfolio.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        #[Performs the lookup]
        @portfolio = Portfolio.find(params[:id])

        @portfolio.destroy
        respond_to do |format|
          format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
      private
    # Use callbacks to share common setup or constraints between actions.
    def portfolio_params
      params.require(:portfolio).permit(:title,:subtitle,:body, :main_image, :thumb_image, technologies_attributes: [:name])
    end

    
end



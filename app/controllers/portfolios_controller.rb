class PortfoliosController < ApplicationController

    def index 
        @portfolios = Portfolio.all     
    end

    def new 
        @portfolio = Portfolio.new
    end 

    def create
        @portfolio = Portfolio.new(blog_params)
    
        respond_to do |format|
          if @blog.save
            format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
            format.json { render :show, status: :created, location: @blog }
          else
            format.html { render :new }
            format.json { render json: @blog.errors, status: :unprocessable_entity }
          end
        end
      end
end

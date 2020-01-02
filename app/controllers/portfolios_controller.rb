class PortfoliosController < ApplicationController
    before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

    def index
        @portfolio_items = Portfolio.all
    end

    def show
    end

    def new
        @portfolio = Portfolio.new
    end

    def edit
    end

    def create 
        @portfolio = Portfolio.new(portfolio_params)

        respond_to do |format|
            if @portfolio.save
              format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
            else
              format.html { render :new }
            end
          end
    end

    def update
        respond_to do |format|
          if @portfolio.update(portfolio_params)
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
    end

    def destroy
        @portfolio.destroy
        respond_to do |format|
          format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
        end
    end
    
    def ruby_on_rails
        @portfolio_items = Portfolio.ruby_on_rails
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end

end

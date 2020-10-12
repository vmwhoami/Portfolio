class RecentworksController < ApplicationController
  layout "home"
  def index
  @portfolios = Recentwork.all
  end

   def new
    @portfolio_item = Recentwork.new
   3.times{ @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item  = Recentwork.new(permited_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to recentworks_path, notice: 'Portfolio item was successfully created' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end



def edit
  @portfolio_item = Recentwork.find(params[:id])
end

  def update
    @portfolio_item = Recentwork.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(permited_params)
        format.html { redirect_to recentworks_path, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @portfolio_item = Recentwork.find(params[:id])
  end
 
  def destroy
    @portfolio_item = Recentwork.find(params[:id])
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to recentworks_path, notice: 'Portfolio items was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def permited_params
    params.require(:recentwork).permit(:title,:subtitle,:body, technologies_attributes: [:name])
  end
end

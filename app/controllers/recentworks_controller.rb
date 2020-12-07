# frozen_string_literal: true

class RecentworksController < ApplicationController
  before_action :find_id, only: %i[edit update show destroy]
  access all: %i[show index], user: { except: %i[destroy new create edit update] }, site_admin: :all

  def index
    @portfolios = Recentwork.all
  end

  def home
    @main_title = 'Vitalie Melnic portfolio website'
  end

  def new
    @portfolio_item = Recentwork.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Recentwork.new(permited_params)
    3.times { @portfolio_item.technologies.build }

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolio_path, notice: 'Portfolio item was successfully created' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @portfolio_item.update(permited_params)
        format.html { redirect_to portfolio_path, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_path, notice: 'Portfolio items was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_id
    @portfolio_item = Recentwork.find(params[:id])
  end

  def permited_params
    params.require(:recentwork).permit(:title, :subtitle, :body, :github_link, :live_link, :main_image, :thumb_image, technologies_attributes: [:name])
  end
end

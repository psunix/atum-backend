class PvSitesController < ApplicationController

  # GET /api/pv_sites
  def index
    pv_sites = PvSite.all

    render json: pv_sites
  end

  # GET /pv_sites/1
  def show
    render json: pv_site
  end

  # POST /pv_sites
  def create
    #meteo_client.create_pv_site(params)
  end

  # PATCH/PUT /pv_sites/1
  def update
    if pv_site.update(pv_site_params)
      render json: pv_site
    else
      render json: pv_site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pv_sites/1
  def destroy
    pv_site.destroy
  end

  private
  def pv_site
    @pv_site ||= PvSite.find(params[:id])
  end

  def pv_site_params
    params.require(:pv_site).permit(:label, :location, :max_production, :direction)
  end
end

class SpeciesController < ApplicationController
  respond_to :json

  def index
    respond_with Species.all
  end

  def show
    respond_with Sequence.where(species_id: params[:id])
  end
end

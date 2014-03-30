class SequencesController < ApplicationController
  respond_to :json
  def show
    respond_with Sequence.where(gene: params[:id])
  end
end

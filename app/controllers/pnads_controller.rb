class PnadsController < ApplicationController
  def index
  end

  # GET /pnads/1
  # GET /pnads/1.json
  def show
    @dados = []

    logger.debug(params)

    if params
      @dados = getPnads(params)
    end

    respond_to do |format|
      format.js
    end
  end

end

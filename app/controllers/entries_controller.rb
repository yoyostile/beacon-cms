class EntriesController < ApplicationController

  def show
    @entry = Entry.find_by(uuid: params[:uuid], major: params[:major], minor: params[:minor])

    if @entry
      respond_to do |format|
        format.html
        format.json { render json: { status: 'success', entry: @entry.as_json } }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Beacon not found!' }
        format.json { render json: { status: 'failed', error: 'Not found' } }
      end
    end
  end

end
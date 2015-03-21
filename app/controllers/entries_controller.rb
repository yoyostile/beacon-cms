class EntriesController < ApplicationController
  after_filter :set_access_control_headers, only: [:show, :index]

  def show
    @entry = Entry.find_by(uuid: params[:uuid].downcase, major: params[:major], minor: params[:minor])

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

  def index
    @entries = Entry.all

    if @entries
      respond_to do |format|
        format.html
        format.json { render json: { status: 'success', entries: @entries.as_json } }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'No entries found!' }
        format.json { render json: { status: 'failed', error: 'No entries found' } }
      end
    end
  end

  private

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end
end

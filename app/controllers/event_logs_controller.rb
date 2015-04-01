class EventLogsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?

  def create
    @event_log = EventLog.new(event_params)
    if @event_log.save
      render json: @event_log
    else
      render status: :unprocessable_entity,
        json: @event_log.as_json.merge!({ errors: @event_log.errors })
    end
  end

  def index
    @event_logs = EventLog.all
    respond_to do |format|
      format.html
      format.json { render json: @event_logs }
    end
  end

  private

  def event_params
    params.require(:event_log).permit(
      :uuid,
      :major,
      :minor,
      :rssi,
      :proximity
    )
  end

  def json_request?
    request.format.json?
  end

end

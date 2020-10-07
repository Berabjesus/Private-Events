module EventsHelper
  def errors_checker event
    if event.errors.any?
      render '/events/errors'
    end
  end
end

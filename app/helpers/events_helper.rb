module EventsHelper
  def errors_checker(event)
    render '/events/errors' if event.errors.any?
  end
end

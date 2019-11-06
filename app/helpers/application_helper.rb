module ApplicationHelper
  def validation_errors(object)
    object.errors.full_messages.join("<br>")
  end
end

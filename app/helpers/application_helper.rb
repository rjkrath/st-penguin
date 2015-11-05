module ApplicationHelper

  def flash_for_type(flash_type)
    flash_for = flash[flash_type] || ''

    if flash_for.is_a?(Array)
      flash_for.map{ |msg| "<div>#{msg}</div>" }.join
    else
      flash_for
    end
  end
end

class Statement
# Understands how to render transactions into a statement view

  def format_date(date)
    date.strftime("%e/%m/%Y")
  end

end

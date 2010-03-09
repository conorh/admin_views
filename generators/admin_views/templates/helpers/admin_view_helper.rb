module Admin::AdminViewHelper
  def order_param(col_name)
    order = params[:order]

    if order == "#{col_name}_asc"
      "#{col_name}_desc"
    elsif order == "#{col_name}_desc"
      "#{col_name}_asc"
    else
      "#{col_name}_asc"
    end
  end

  def order_sql(params)
    if params[:order]
      split = params[:order].split("_")
      order = split.last.upcase
      column = split[0..-2].join("_")
      "#{column} #{order}"
    end
  end
end
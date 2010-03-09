class Admin::AdminController < ApplicationController
  before_filter :admin_required
  layout 'admin/layouts/admin'

  protected
    def admin_required
      unless current_user && current_user.admin?
        flash[:notice] = "You do not have permission to do that."
        redirect_to root_url
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

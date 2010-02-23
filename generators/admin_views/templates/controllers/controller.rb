class Admin::<%= pluralize(model_class) %>Controller < Admin::AdminController
  # http://github.com/hcatlin/make_resourceful
  make_resourceful do
    actions :all
  end

  def index
    # TODO: Add in sorting

    if params[:search]
      # TODO: By default search all text fields
      @<%= model_plural %> = <%= model_class %>.paginate(:all, :page => params[:page])
    else
      @<%= model_plural %> = <%= model_class %>.paginate(:all, :page => params[:page])
    end
  end
end
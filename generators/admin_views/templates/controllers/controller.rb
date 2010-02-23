class Admin::<%= pluralize(model_class) %>Controller < Admin::AdminController
  # GET /admin/<%= model_plural %>
  def index
    if params[:search]
      # TODO: By default search all text fields
      @<%= model_plural %> = <%= model_class %>.paginate(:all, :page => params[:page])
    else
      @<%= model_plural %> = <%= model_class %>.paginate(:all, :page => params[:page])
    end
  end
 
  # GET /admin/<%= model_plural %>/1
  def show
    @<%= model_name %> = <%= model_class %>.find(params[:id])
  end
 
  # GET /admin/<%= model_plural %>/new
  def new
    @<%= model_name %> = <%= model_class %>.new
  end
 
  # GET /admin/<%= model_plural %>/1/edit
  def edit
    @<%= model_name %> = <%= model_class %>.find(params[:id])
  end
 
  # POST /admin/<%= model_plural %>
  def create
    @<%= model_name %> = <%= model_class %>.new(params[:<%= model_name %>])
 
    if @<%= model_name %>.save
      redirect_to(@<%= model_name %>, :notice => '<%= class_name %> was successfully created.')
    else
      render :action => "new"
    end
  end
 
  # PUT /admin/<%= model_plural %>/1
  def update
    @<%= model_name %> = <%= model_class %>.find(params[:id])
 
    if @<%= model_name %>.update_attributes(params[:<%= model_name %>])
      redirect_to(admin_<%= model_plural %>_url(@<%= model_name %>), :notice => '<%= model_class %> was successfully updated.')
    else
      render :action => "edit"
    end
  end
 
  # DELETE /admin/<%= model_plural %>/1
  def destroy
    @<%= model_name %> = <%= model_class %>.find(params[:id])
    @<%= model_name %>.destroy

    redirect_to(admin_<%= model_plural %>_url)
  end
end

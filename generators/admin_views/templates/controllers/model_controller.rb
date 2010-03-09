class Admin::<%= name.pluralize %>Controller < Admin::AdminController
  helper 'admin/admin_view'

  # GET /admin/<%= plural_name %>
  def index
    if params[:search]
      sql, sql_params = [], []
      # By default searches all text fields
<% search_cols = columns.find_all {|col| [:text, :string].include?(col.type) }.collect {|col| "'#{col.name}'" }.join(",") -%>
      [<%= search_cols %>].each do |col|
        sql << "#{col} LIKE ?"
        sql_params << "%#{params[:search]}%"
      end
      conditions = [sql.join(" OR "), sql_params].flatten
      @<%= plural_name %> = <%= name %>.paginate(:all, :page => params[:page], :conditions => conditions, :order => order_sql(params))
    else
      @<%= plural_name %> = <%= name %>.paginate(:all, :page => params[:page], :order => order_sql(params))
    end
  end
 
  # GET /admin/<%= plural_name %>/1
  def show
    @<%= singular_name %> = <%= name %>.find(params[:id])
  end
 
  # GET /admin/<%= plural_name %>/new
  def new
    @<%= singular_name %> = <%= name %>.new
  end
 
  # GET /admin/<%= plural_name %>/1/edit
  def edit
    @<%= singular_name %> = <%= name %>.find(params[:id])
  end
 
  # POST /admin/<%= plural_name %>
  def create
    @<%= singular_name %> = <%= name %>.new(params[:<%= singular_name %>])
 
    if @<%= singular_name %>.save
      redirect_to(admin_<%= singular_name %>_url(@<%= singular_name %>), :notice => '<%= class_name %> was successfully created.')
    else
      render :action => "new"
    end
  end
 
  # PUT /admin/<%= plural_name %>/1
  def update
    @<%= singular_name %> = <%= name %>.find(params[:id])
 
    if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
      redirect_to(admin_<%= singular_name %>_url(@<%= singular_name %>), :notice => '<%= name %> was successfully updated.')
    else
      render :action => "edit"
    end
  end
 
  # DELETE /admin/<%= plural_name %>/1
  def destroy
    @<%= singular_name %> = <%= name %>.find(params[:id])
    @<%= singular_name %>.destroy

    redirect_to(admin_<%= plural_name %>_url)
  end
end

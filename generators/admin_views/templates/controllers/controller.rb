class Admin::<%= pluralize(model_class) %>Controller < Admin::AdminController
  helper_method :order_param
  
  # GET /admin/<%= model_plural %>
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
      @<%= model_plural %> = <%= model_class %>.paginate(:all, :page => params[:page], :conditions => conditions, :order => order_sql(params))
    else
      @<%= model_plural %> = <%= model_class %>.paginate(:all, :page => params[:page], :order => order_sql(params))
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
  
  private
    def order_sql(params)
      if params[:order]
        split = params[:order].split("_")
        order = split.last.upcase
        column = split[0..-2].join("_")
        "#{column} #{order}"
      end
    end
  
    def order_param(col_name)
      order = params[:order]
      
      if order == "#{col_name}_asc"
        "#{col_name}_asc"
      elsif order == "#{col_name}_desc"
        "#{col_name}_desc"
      else
        "#{col_name}_asc"
      end
    end
end

require 'active_support/inflector'

class AdminViewsGenerator < Rails::Generator::NamedBase
  include ActiveSupport::Inflector

  attr_reader :model_class, :model_name, :plural_name, :columns

  def initialize(runtime_args, runtime_options = {})
    super

    #@model_class = name
    #@model_human = name.underscore.humanize
    #@model_name = @model_class.underscore

    @columns = Object.const_get(name).columns
  end

  def manifest
    record do |m|
      m.directory("app/controllers/admin")
      m.template('controllers/model_controller.rb', "app/controllers/admin/#{plural_name}_controller.rb")

      m.directory("app/helpers/admin")
      m.template('helpers/admin_view_helper.rb', "app/helpers/admin/admin_view_helper.rb")

      m.directory("app/views/admin/#{plural_name}")
      m.template('views/model/_form.html.erb', "app/views/admin/#{plural_name}/_form.html.erb")
      m.template('views/model/edit.html.erb', "app/views/admin/#{plural_name}/edit.html.erb")
      m.template('views/model/index.html.erb', "app/views/admin/#{plural_name}/index.html.erb")
      m.template('views/model/new.html.erb', "app/views/admin/#{plural_name}/new.html.erb")
      m.template('views/model/show.html.erb', "app/views/admin/#{plural_name}/show.html.erb")
    end
  end
end
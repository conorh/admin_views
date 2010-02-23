require 'active_support/inflector'

class AdminViewsGenerator < Rails::Generator::NamedBase
  include ActiveSupport::Inflector

  attr_reader :model_class, :model_name, :model_plural, :columns

  def initialize(runtime_args, runtime_options = {})
    super

    @model_class = name
    @model_name = underscore(@model_class)
    @model_plural = underscore(pluralize(@model_class))
    @columns = Object.const_get(@model_class).columns
  end

  def manifest
    record do |m|
      m.directory("app/controllers/admin")
      m.template('controllers/controller.rb', "app/controllers/admin/#{model_plural}_controller.rb")

      m.directory("app/views/admin/#{model_plural}")
      m.template('views/_form.html.erb', "app/views/admin/#{model_plural}/_form.html.erb")
      m.template('views/_model.html.erb', "app/views/admin/#{model_plural}/_#{model_name}.html.erb")
      m.template('views/edit.html.erb', "app/views/admin/#{model_plural}/edit.html.erb")
      m.template('views/index.html.erb', "app/views/admin/#{model_plural}/index.html.erb")
      m.template('views/new.html.erb', "app/views/admin/#{model_plural}/new.html.erb")
      m.template('views/show.html.erb', "app/views/admin/#{model_plural}/show.html.erb")
    end
  end
end
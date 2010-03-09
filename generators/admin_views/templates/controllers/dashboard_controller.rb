class Admin::DashboardController < Admin::AdminController
  helper_method :output_graph
  
  def index
    plot(Users)
  end

  protected
    def plot(klass)
      models = klass.find(:all,
        :select => "*, count(*) AS count",
        :group => "DATE_FORMAT(created_at,'%y-%m-%d')"
      )

      series = TimeFlot.new do |f|
        f.series_for(klass.to_s, cumulative(models), :x => :created_at, :y => :count)
      end
      eval("@#{klass.to_s.underscore}_flot = series")
      @flot_plots ||= []
      @flot_plots << {:name =>, :plot => }
    end
  
    def cumulative(models)
      total = 0
      models.each {|a| total = a.count = a.count.to_i + total }
    end
end
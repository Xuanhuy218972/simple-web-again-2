class HomeController
  def initialize(env)
    @env = env
    @session = @env['rack.session']
  end
  def show
    
    @session[:views] ||= 0
    @session[:views] += 1
    "<p>Welcome to the Home Page #{@session[:views]} lan </p>"
  end
end
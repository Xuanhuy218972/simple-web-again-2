class HomeController
  def initialize(env)
    @env = env
  end
  def show
    "<h1>Welcome to the Home Page</h1>"
  end
end
require_relative 'lib/frack/router'
require_relative 'lib/frack/application'
require_relative 'app/controllers/home_controller'

use Frack::Router do
    get '/' => 'home#show'
end

run Frack::Application.new
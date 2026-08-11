require_relative 'lib/frack/router'
require_relative 'lib/frack/application'
require_relative 'app/controllers/home_controller'

use Rack::Session::Cookie, key: 'rack.session',
                           path: '/',
                           secret: 'mot_chuoi_bi_mat_bat_ky_de_ma_hoa'

use Frack::Router do
    get '/' => 'home#show'
end

run Frack::Application.new
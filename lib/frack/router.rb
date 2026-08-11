module Frack
    class Router
        def call(env)
            if env['PATH_INFO'] == '/'
                [200, { 'Content-Type' => 'text/html' }, ['Hello!']]
            else
                [404, { 'Content-Type' => 'text/html' }, ['Not Found']]
            end
        end
    end
end
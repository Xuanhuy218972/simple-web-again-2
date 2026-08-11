module Frack
    class Router
        def initialize(app, &block)
            @app = app
            @routes = []
            instance_eval(&block) if block_given?
        end

        def get(route_hash)
            path = route_hash.keys.first
            target = route_hash.values.first

            @routes << { method: 'GET', path: path, target: target }
        end

        def call(env)
            match = @routes.find do |route|
                route[:method] == env['REQUEST_METHOD'] && route[:path] == env['PATH_INFO']
            end

            if match
                controller_name, action_name = match[:target].split('#')
                env['frack.controller'] = controller_name
                env['frack.action'] = action_name
                @app.call(env)
                else
                [404, { 'Content-Type' => 'text/plain' }, ['Not Found']]
            end
        end
    end
end
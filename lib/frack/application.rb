module Frack
    class Application
        def call(env)
            @controller_name = env['frack.controller']
            action_name = env['frack.action']
            class_name = "#{@controller_name.capitalize}Controller"
            controller_class = Object.const_get(class_name)
            controller = controller_class.new(env)
            body = controller.send(action_name)
            [200, { 'Content-Type' => 'text/html' }, [body]]
        end
    end
end
module Simpler
  class Router
    class Route

      attr_reader :controller, :action, :params

      def initialize(method, path, controller, action)
        @method = method
        @path = path
        @controller = controller
        @action = action
        @params = {}
      end

      def match?(method, path)
        @method == method && path_selector(path)
      end

      private

      def path_selector(path)
        split_path = path.split('/').reject!(&:empty?)
        split_route_path = @path.split('/').reject!(&:empty?)
        # byebug
        if split_path.length == 1 && path.match(@path)
          true
        elsif  split_path.length == split_route_path.length &&
              (split_path[0] == split_route_path[0] )
          params[split_route_path[-1]] = split_path[-1] 
          true
        else
          false
        end
      end

    end
  end
end

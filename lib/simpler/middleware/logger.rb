require 'logger'

module Simpler
  class SimplerLogger
    
    def initialize(app, **options)
      @logger = Logger.new(options[:log_path || STDOUT])
      @app = app
    end

    def call(env)
      @logger.info("Request: #{env["REQUEST_METHOD"]} #{env["REQUEST_URI"]}")

      status, headers, body = @app.call(env)

      @logger.info("Handler: #{env["simpler.controller"].name}##{env["simpler.action"]}")
      @logger.info("Parameters: #{env["QUERY_STRING"]}")
      @logger.info("Response: #{status} #{headers['Content-Type']} #{env['simpler.template']}")
      byebug

      [status, headers, body]
    end

  end
end

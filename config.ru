require_relative 'lib/simpler/middleware/logger'
require_relative 'config/environment'

use Simpler::SimplerLogger, log_path: File.expand_path('app/log/app.log', __dir__)
run Simpler.application

use Rack::ContentType, "text/plain"

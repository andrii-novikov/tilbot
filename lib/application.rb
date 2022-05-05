require 'bundler'
Bundler.require(:default, :development)

Dotenv.load('.env.development', '.env')

require 'telegram/bot'
require 'net/http'

loader = Zeitwerk::Loader.new
loader.push_dir('lib')
loader.setup

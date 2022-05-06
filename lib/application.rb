require 'bundler'
Bundler.require(:default, :development)

Dotenv.load('.env.development', '.env')

require 'telegram/bot'
require 'net/http'

# TODO: move to config/initializers.rb
loader = Zeitwerk::Loader.new
loader.push_dir('lib')
loader.setup

# dynamoid
Dynamoid.configure do |config|
  config.access_key = ENV['AWS_ACCESS_KEY_ID']
  config.secret_key = ENV['AWS_SECRET_ACCESS_KEY']
  config.region = ENV['AWS_REGION']

  config.models_dir = './lib/model'

  # To namespace tables created by Dynamoid from other tables you might have.
  # Set to nil to avoid namespacing.
  config.namespace = ENV['DYNAMODB_NAMESPACE'] if ENV['DYNAMODB_NAMESPACE']

  # [Optional]. If provided, it communicates with the DB listening at the endpoint.
  # This is useful for testing with [DynamoDB Local] (http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html).
  config.endpoint = ENV['DYNAMODB_ENDPOINT'] if ENV['DYNAMODB_ENDPOINT']
end

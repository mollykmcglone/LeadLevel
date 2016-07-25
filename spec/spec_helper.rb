ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require("capybara/rspec")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require("./app")

RSpec.configure do |config|
  config.after(:each) do
    Contact.all().each() do |contact|
      contact.destroy()
    end
    Place.all().each() do |place|
      place.destroy()
    end
    Result.all().each() do |result|
      result.destroy()
    end
    User.all().each() do |user|
      user.destroy()
    end
  end
end

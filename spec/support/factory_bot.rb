RSpec.configure do |config|
  # Prevents us from having to do FactoryBot.create(:thing)
  # We can just do create(:thing)
  config.include FactoryBot::Syntax::Methods
end
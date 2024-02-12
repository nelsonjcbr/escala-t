require 'rufus-scheduler'

return if defined?(Rails::Console) || Rails.env.test? || File.split($PROGRAM_NAME).last == 'rake'

s = Rufus::Scheduler.singleton

# s.every '50s' do
#   puts "\n\n\n\n"
#   p "Tá schedulado manito 5s"
# end

# s.every '100s' do
#   p "Tá schedulado manito 10s"
# end
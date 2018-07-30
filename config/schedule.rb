# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
job_type :my_runner, "cd :path && bin/rails runner -e development ':task' :output"

every 1.day do
  my_runner "FriendNotifierMailer.send_mail.deliver_now"
end

# every 3.hours do # 1.minute 1.day 1.week 1.month 1.year is also supported
#   runner "MyModel.some_process"
#   rake "my:rake:task"
#   command "/usr/bin/my_great_command"
# end

# every 1.day, at: '4:30 am' do
#   runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
# end

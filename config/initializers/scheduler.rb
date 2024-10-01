require "rufus-scheduler"

scheduler = Rufus::Scheduler.new

# scheduler.every "10s" do
#     puts "This scheduler is printed every 10 seconds"
# end

# runs everyday at 12 PM
scheduler.cron "0 6 * * *" do
    User.where("last_login IS NULL OR last_login < ?", (1.day.ago + 6.hours)).destroy_all
    puts "Scheduler: Deleted inactive users who were active 1 day ago"
end
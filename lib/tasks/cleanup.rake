namespace :cleanup do
    desc "Delete inactive users who haven't logged in for a day"
    task delete_inactive_users: :environment do
        User.where("last_login IS NULL OR last_login < ?", (1.day.ago + 6.hours)).destroy_all
        puts "Deleted inactive users who were active 1 day ago"
    end
end

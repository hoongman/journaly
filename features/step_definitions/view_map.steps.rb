Given(/^a user is on the create trips page$/) do
  visit '/'
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |field_name, trip_name|
  fill_in field_name, :with => trip_name
end


Given(/^I press "(.*?)"$/) do |create_trip_button|
  click_on(create_trip_button)
end

Then(/^I should see "(.*?)"$/) do |trip_name|
  page.should have_content(trip_name)
end
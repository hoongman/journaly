Feature: A user can add points to a map
 In order to use Journaly
 As John
 I want to add points to a map

 What we know:
 =============
 - a user can see a map
 - a user can add points to a map

Open Questions:
===============
- what api will we use?
- how are the routes going to look

Scenario: Add points to a map
Given I am on the create a trip page
Then I should see a map
And I should be able to add places to the map


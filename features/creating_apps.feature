Feature: Creating apps
  In order to have apps users can use
  As a user
  I want to create them easily

  Scenario: Creating an app
  Given I am on the homepage
  When I follow "New App"
  And I fill in "Name" with "Angry Birds"
  And I fill in "app_bundle_id" with "com.rovio.angry_birds"
  And I press "Create App"
  Then I should see "App has been created."
  And I should be on the app page for "Angry Birds"
  And I should see "Angry Birds - Apps - BundleBee"
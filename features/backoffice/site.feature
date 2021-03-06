Feature: Manage my site
  In order to manage my site
  As an administrator
  I want to edit/delete my site

  Background:
    Given I have the site: "test site" set up

  Scenario: Site settings are not accessible for non authenticated accounts
    Given I am not authenticated
    When I go to the site settings
    Then I should see "You need to sign in or sign up before continuing"

  Scenario: Add a new site
    Given I am an authenticated user
    When I go to the account settings
    And I follow "new site"
    Then I should see "Fill in the form below to create your new site."
    When I fill in "Name" with "Acme"
    And I fill in "Subdomain" with "acme"
    And I press "Create"
    Then I should see "Site was successfully created."
    And I should be a administrator of the "Acme" site

  @javascript
  Scenario: Adding a domain to a site
    Given I am an authenticated user
    Then I should be able to add a domain to my site

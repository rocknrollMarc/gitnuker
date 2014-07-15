Feature: Checkout repo
  In order to get my files onto a new computer
  I want a one-command way to keep them up to date
  So I dont have to do it myself

  Scenario: Basic UI
    When I get help for "gitnuker"
    Then the exit status should be 0
    And the banner should be present
    And there should be a one line summary of what the app does
    And the banner should include the version
    And the banner should document that this app takes options
    And the banner should document that this app's arguments are:
      | repo_url  | which is required |

  Scenario: Happy Path
    Given a git repo with some test files at "/tmp/Projects.git"
    When I successfully run `gitnuker file:///tmp/Projects.git`
    Then the files should be checked out in the directory "~/Projects"


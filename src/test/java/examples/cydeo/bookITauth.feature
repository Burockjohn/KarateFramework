Feature: We generate a token for API user so we can do other API requests

  Scenario: get token
    Given url 'https://qa.api.book-it.today/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = 'blyst6@si.edu'
    And param password = 'barbabaslyst'
    When method GET
    Then status 200
    And def token = response.accessToken
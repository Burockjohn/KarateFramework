Feature: Get token from other feature and verify API user information
  Background:
    * def baseUrl = 'https://qa.api.book-it.today/'
    # following is done to connect Auth feature and get response of auth API call and store it into object
    * def AuthFeature = call read('classpath:examples/cydeo/bookITauth.feature')
    # calls the token variable of AuthFeature object
    * def accessToken = AuthFeature.token
    * def expectedUser =
    """
    {
    "id": 11516,
    "firstName": "Barbabas",
    "lastName": "Lyst",
    "role": "teacher"
    }
    """

  @wip
  Scenario: Verify user information
    Given url baseUrl
    And path "api/users/me"
    # in Karate to concatinate we use , comma sign
    And header Authorization = 'Bearer',accessToken
    When method GET
    Then match response == expectedUser
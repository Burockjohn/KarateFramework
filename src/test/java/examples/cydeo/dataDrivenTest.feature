Feature: Execute Data Driven tests

  Background:
    * def baseUrl = 'https://qa.api.book-it.today/'

  @wip
  Scenario Outline: Get tokens for more users than print them all
    Given url baseUrl
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    Then status 200
    And def token = response.accessToken
    And print token
    Examples:
      | email                    | password     |
      | blyst6@si.edu            | barbabaslyst |
      | lfinnisz@yolasite.com    | lissiefinnis |
      | mforkerh@dailymail.co.uk | mariusforker |
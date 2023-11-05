Feature: Testing different End Points with Spartans API

  Background:
    * def spartanUrl = "http://54.172.243.231:8000/"
    * def expectedSpartan = read("classpath:examples/testData/oneSpartan.json")

  Scenario: Get one spartan with path parameter and verify
    Given url spartanUrl
    And path "api/spartans"
    And path "88"
    And header Accept = 'application/json'
    When method get
    Then status 200
    Then match response == expectedSpartan

  Scenario: Execute query parameters
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'j'
    And param gender = 'Female'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match each response.content[*].gender == 'Female'
    Then match response.totalElement == 6

    @wip
    Scenario: POST a new spartan to API and use spartan generator Java File
      When def SpartanDG = Java.type("examples.utilities.SpartanDataGenerator")
      And def newSpartan = SpartanDG.createSpartan()
      Given url spartanUrl
      And path "api/spartans"
      And header Accept = "application/json"
      And header Content-Type = "application/json"
      And request newSpartan
      And method post
      Then status 201
      And match response.success == "A Spartan is Born!"
      And match response.data.name == newSpartan.name



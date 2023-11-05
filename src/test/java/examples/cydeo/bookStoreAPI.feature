Feature: Book Store API Testing

  Background: Get all books
    Given url "https://demoqa.com/BookStore/v1/Books"
    When method get

  Scenario: Get all books and verify status and headers
    Then status 200
    And match header content-type == 'application/json; charset=utf-8'
    And match header content-length == '#present'
    And match response.books[0].title == 'Git Pocket Guide'
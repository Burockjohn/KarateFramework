Feature: Learning Basics with Karate Framework

  Scenario: Test Variables
    Given print "hello world"
    When def result = 2 + 2
    Then print result
    # all same with arithmetic operations of Java
    * def name = "Burockjohn"
    # single or double quotation does not matter
    * def age = 37
    # we are using all kind of Data Types just one key word 'def'
    * def oneSpartan =
    """
    {
    "id": 88,
    "name": "Julie",
    "gender": "Male",
    "phone": 1279288759
    }
    """
    * print oneSpartan.name
@wip
    Scenario: Read a data from a file
      When def spartans = read("classpath:examples/testData/fourSpartans.json")
      * print spartans
      * print spartans[2].name
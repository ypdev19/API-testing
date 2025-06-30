Feature: Restful Booker Basic API Automation

  Background: Common Configuration
    # We set the basic common configuration for all scenarios
    * url baseUrl
    * print baseUrl
    Given header Content-Type = 'application/json'

  Scenario: Get Product list successfully
    Given path '/productsList'
    When method GET
    Then status 200
    And match response != null
    And match response.products == '#array'

  Scenario: Get Brand list successfully
    Given path '/brandsList'
    When method GET
    Then status 200
    And match response != null
    And match response.brands == '#array'

  Scenario Outline: Search product <product>
    Given path '/searchProduct'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field search_product = "<product>"
    When method POST
    Then status 200
    And match response.products == '#array'
    And match each response.products[*].category.category == "Jeans"
    Examples:
      | product |
      | jean    |

  Scenario: Send an invalid payload while searching a product
    Given path '/searchProduct'
    When method POST
    Then status 200
    And response.responseCode == 400
    And response.message == "Bad request, search_product parameter is missing in POST request."

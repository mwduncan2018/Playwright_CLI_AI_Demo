@fuzzyMatching
Feature: Fuzzy matching
    Fuzzy matching indicates a match if either manufacturer or model match.

    Scenario Outline: Manufacturer match, model match
        Given a product is added with manufacturer "<productManufacturer>" and model "<productModel>"
        And an entry is added with manufacturer "<entryManufacturer>" and model "<entryModel>"
        When fuzzy matching is enabled
        Then the product with manufacturer "<productManufacturer>" and model "<productModel>" is a standard match

        Examples:
            | productManufacturer | productModel               | entryManufacturer | entryModel                 |
            | Wendy's             | Taco Salad                 | Wendy's           | Taco Salad                 |
            | Wendy's             | Apple Pecan Salad          | Wendy's           | Apple Pecan Salad          |
            | Wendy's             | Jalapeno Popper Salad      | Wendy's           | Jalapeno Popper Salad      |
            | Wendy's             | Bourbon Bacon Cheeseburger | Wendy's           | Bourbon Bacon Cheeseburger |


    Scenario Outline: Manufacturer no match, model no match
        Given a product is added with manufacturer "<productManufacturer>" and model "<productModel>"
        And an entry is added with manufacturer "<entryManufacturer>" and model "<entryModel>"
        When fuzzy matching is enabled
        Then the product with manufacturer "<productManufacturer>" and model "<productModel>" is not a match

        Examples:
            | productManufacturer | productModel           | entryManufacturer | entryModel           |
            | Taco Bell           | Grilled Cheese Burrito | Burger King       | Impossible Whopper   |
            | Taco Bell           | Veggie Burrito Supreme | Burger King       | Texas Double Whopper |
            | Taco Bell           | Quesarito              | Burger King       | Bacon King           |

    Scenario Outline: Manufacturer match, model no match
        Given a product is added with manufacturer "<productManufacturer>" and model "<productModel>"
        And an entry is added with manufacturer "<entryManufacturer>" and model "<entryModel>"
        When fuzzy matching is enabled
        Then the product with manufacturer "<productManufacturer>" and model "<productModel>" is a fuzzy match

        Examples:
            | productManufacturer | productModel             | entryManufacturer | entryModel              |
            | Burger King         | Italian Original Chicken | Burger King       | Four nuggets            |
            | Burger King         | Spicy Chicken Sandwich   | Burger King       | Chicken Deluxe Sandwich |

    Scenario Outline: Manufacturer no match, model match
        Given a product is added with manufacturer "<productManufacturer>" and model "<productModel>"
        And an entry is added with manufacturer "<entryManufacturer>" and model "<entryModel>"
        When fuzzy matching is enabled
        Then the product with manufacturer "<productManufacturer>" and model "<productModel>" is a fuzzy match

        Examples:
            | productManufacturer | productModel     | entryManufacturer | entryModel       |
            | Popeyes             | Chicken Sandwich | Burger King       | Chicken Sandwich |
            | McDonald's          | Hamburger        | Sonic             | Hamburger        |
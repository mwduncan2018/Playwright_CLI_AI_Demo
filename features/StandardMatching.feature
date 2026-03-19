@standardMatching
Feature: Standard matching
    Standard matching requires that both manufacturer and model match.

    Scenario Outline: Manufacturer match, model match
        Given a product is added with manufacturer "<productManufacturer>" and model "<productModel>"
        And an entry is added with manufacturer "<entryManufacturer>" and model "<entryModel>"
        When standard matching is enabled
        Then the product with manufacturer "<productManufacturer>" and model "<productModel>" is a standard match

        Examples:
            | productManufacturer | productModel | entryManufacturer | entryModel |
            | Porsche             | Cayenne      | Porsche           | Cayenne    |
            | Porsche             | Boxster      | Porsche           | Boxster    |

    Scenario Outline: Manufacturer no match, model no match
        Given a product is added with manufacturer "<productManufacturer>" and model "<productModel>"
        And an entry is added with manufacturer "<entryManufacturer>" and model "<entryModel>"
        When standard matching is enabled
        Then the product with manufacturer "<productManufacturer>" and model "<productModel>" is not a match

        Examples:
            | productManufacturer | productModel | entryManufacturer | entryModel |
            | Porsche             | 911          | Toyota            | Corolla    |
            | Porsche             | Cayman       | Toyota            | Camry      |

    Scenario Outline: Manufacturer match, model no match
        Given a product is added with manufacturer "<productManufacturer>" and model "<productModel>"
        And an entry is added with manufacturer "<entryManufacturer>" and model "<entryModel>"
        When standard matching is enabled
        Then the product with manufacturer "<productManufacturer>" and model "<productModel>" is not a match

        Examples:
            | productManufacturer | productModel | entryManufacturer | entryModel |
            | Porsche             | Taycan       | Porsche           | Panamera   |
            | Toyota              | Land Cruiser | Toyota            | Supra      |

    Scenario Outline: Manufacturer no match, model match
        Given a product is added with manufacturer "<productManufacturer>" and model "<productModel>"
        And an entry is added with manufacturer "<entryManufacturer>" and model "<entryModel>"
        When standard matching is enabled
        Then the product with manufacturer "<productManufacturer>" and model "<productModel>" is not a match

        Examples:
            | productManufacturer | productModel | entryManufacturer | entryModel |
            | BMW                 | Sports Car   | Tesla             | Sports Car |
            | Honda               | SUV          | General Motors    | SUV        |
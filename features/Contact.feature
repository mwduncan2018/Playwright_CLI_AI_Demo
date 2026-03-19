@contact
Feature: Contact

    Scenario: Duncan safe product
        When the Contact page is viewed
        Then the following text should display in the footer
            """
            (Duncan Safe Product!)
            """

    Scenario: GitHub link
        When the Contact page is viewed
        Then a GitHub link should be provided
            """
            https://github.com/mwduncan2018
            """

    Scenario: Technical skills are displayed
        When the Contact page is viewed
        Then the following skills should be listed
            | skills     |
            | Playwright |
            | Cypress    |
            | Appium     |
            | Selenium   |
            | Docker     |
            | JUnit      |
            | TestNG     |
            | pytest     |
            | pytest-bdd |
            | SpecFlow   |
            | Cucumber   |
            | C# MVC     |
            | Java       |
            | Python     |
            | TypeScript |
            | JavaScript |
            | C#         |
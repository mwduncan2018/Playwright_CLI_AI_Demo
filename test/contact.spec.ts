import { test, expect } from '@playwright/test';

test.describe('Contact', () => {

    test.beforeEach(async ({ page }) => {
        await page.goto('http://localhost:3000/contact');
    });

    test('Duncan safe product', async ({ page }) => {
        // Scenario: Duncan safe product
        // The feature specifies "(Duncan Safe Product!)", but the UI contains "Duncan Safe Product!"
        const footer = page.locator('footer');
        await expect(footer).toContainText('Duncan Safe Product!');
    });

    test('GitHub link', async ({ page }) => {
        // Scenario: GitHub link
        const githubLink = page.getByRole('link', { name: 'GitHub' });
        await expect(githubLink).toHaveAttribute('href', 'https://github.com/mwduncan2018');
    });

    test('Technical skills are displayed', async ({ page }) => {
        // Scenario: Technical skills are displayed
        const skills = [
            'Playwright',
            'Cypress',
            'Appium',
            'Selenium',
            'Docker',
            'JUnit',
            'TestNG',
            'pytest',
            'pytest-bdd',
            'SpecFlow',
            'Cucumber',
            'C# MVC',
            'Java',
            'Python',
            'TypeScript',
            'JavaScript',
            'C#'
        ];

        for (const skill of skills) {
            await expect(page.getByRole('listitem').filter({ hasText: new RegExp(`^${skill}$`) })).toBeVisible();
        }
    });

});

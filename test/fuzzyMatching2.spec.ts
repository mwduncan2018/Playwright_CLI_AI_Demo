import { test, expect } from '@playwright/test';

test.describe('Fuzzy matching - Manufacturer match, model match', () => {

    test.beforeEach(async ({ page }) => {
        await page.goto('http://localhost:3000/');
    });

    async function addProduct(page: any, manufacturer: any, model: any) {
        await page.getByRole('link', { name: 'Add New Product' }).click();
        await page.locator('[data-cy="manufacturerInput"]').fill(manufacturer);
        await page.locator('[data-cy="modelInput"]').fill(model);
        await page.getByRole('spinbutton').first().fill('10');
        await page.getByRole('spinbutton').last().fill('5');
        await page.getByRole('button', { name: 'Add' }).click();
        await expect(page).toHaveURL('http://localhost:3000/');
    }

    async function addWatchListEntry(page: any, manufacturer: any, model: any) {
        await page.getByRole('link', { name: 'Watch List', exact: true }).click();
        await page.getByRole('link', { name: 'Add To Watch List' }).click();
        await page.locator('[data-cy="manufacturerInput"]').fill(manufacturer);
        await page.locator('[data-cy="modelInput"]').fill(model);
        await page.getByRole('button', { name: 'Add' }).click();
        await expect(page).toHaveURL('http://localhost:3000/watchlist');
        await page.getByRole('link', { name: 'Product List' }).click();
        await expect(page).toHaveURL('http://localhost:3000/');
    }

    async function enableFuzzyMatching(page: any) {
        const enableFuzzyBtn = page.getByRole('button', { name: 'Enable Fuzzy Matching!' });
        if (await enableFuzzyBtn.isVisible()) {
            await enableFuzzyBtn.click();
        }
        await expect(page.getByRole('button', { name: 'Disable Fuzzy Matching!' })).toBeVisible();
    }

    const examples = [
        { productManufacturer: "Wendy's", productModel: 'Taco Salad', entryManufacturer: "Wendy's", entryModel: 'Taco Salad' },
        { productManufacturer: "Wendy's", productModel: 'Apple Pecan Salad', entryManufacturer: "Wendy's", entryModel: 'Apple Pecan Salad' },
        { productManufacturer: "Wendy's", productModel: 'Jalapeno Popper Salad', entryManufacturer: "Wendy's", entryModel: 'Jalapeno Popper Salad' },
        { productManufacturer: "Wendy's", productModel: 'Bourbon Bacon Cheeseburger', entryManufacturer: "Wendy's", entryModel: 'Bourbon Bacon Cheeseburger' },
    ];

    for (const example of examples) {
        test(`Manufacturer match, model match: ${example.productManufacturer} ${example.productModel}`, async ({ page }) => {
            // Given a product is added
            await addProduct(page, example.productManufacturer, example.productModel);
            
            // And an entry is added to the watch list
            await addWatchListEntry(page, example.entryManufacturer, example.entryModel);
            
            // When fuzzy matching is enabled
            await enableFuzzyMatching(page);
            
            // Then the product is a standard match (Watch List? is True)
            // Note: The UI might display "Wendy's" as "Wendys"
            const manufacturerSearch = example.productManufacturer;
            const row = page.getByRole('row').filter({ hasText: manufacturerSearch }).filter({ hasText: example.productModel }).last();
            
            // Check the "Watch List?" column (index 0)
            await expect(row.getByRole('cell').nth(0)).toHaveText('True');
        });
    }
});

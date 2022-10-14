[Udemy-Playwright](https://www.udemy.com/course/automated-software-testing-with-playwright/)

# Project Setup

``` 
npm init // configuration of package.json
npm install prettier
```
Create `.prettierrc`
[Prettier options](https://prettier.io/docs/en/options.html)

```
npm install @playwright/test
npx playwright install
```

# Playwright Test

```
npx playwright test //run test
npx playwright test --headed //with browser
npx playwright test --browser=firefox
npx playwright test --headed --browser=firefox
npx playwright test --browser=all
npx playwright test tests/example.spec.ts // run only specific test
```

## Selectors

```
// text
await page.click('text=some text')
// Css Selectors
await page.click('button')
await page.click('#id')
await page.click('.class')
// Only visible Css Selector
await page.click('.submit-button:visible')
//Combinations
await page.click('#username .first')
//XPath
await page.click('//button')
```

## Assertions

```
//nonExistingElement
const nonExistingElement = await page.locator('h5')
await expect(nonExistingElement).not.toBeVisible
```

## Annotations

https://playwright.dev/docs/test-annotations

## Node scripts

Scripts are in package.json -> scripts
To run: `npm run <script-name>`
To override: `npm run <script-name> -- --headed`
E.g. `npm run tests:ff -- --grep @astrato`

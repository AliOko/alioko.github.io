import { test, expect } from '@playwright/test'
import { loadHomepage, assertTitle } from '../helpers'

test.describe('Astrato', () => {
    test('Simple basic test @astrato', async ({ page }) => {
        await page.goto('https://app.astrato.io')
        const pageTitle = await page.locator('h1.title')
        await expect(pageTitle).toContainText('Login')
    })
})
test.describe('Zero.webappsecurity.com', () => {
    test('Clicikng on Elements @zero', async ({ page }) => {
        await page.goto("http://zero.webappsecurity.com/index.html")
        await page.click('#signin_button')
        await page.click('text=Sign in')
        const errorMessage = await page.locator('.alert-error')
        await expect(errorMessage).toContainText('Login and/or password are wrong.')
    })
    test.skip("Selectors", async ({ page }) => {
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
    })

    test('Working with Inputs @zero', async ({ page }) => {
        await page.goto("http://zero.webappsecurity.com/index.html")
        await page.click('#signin_button')

        await page.type('#user_login', 'some username')
        await page.type('#user_password', 'some pwd')
        await page.click('text=Sign in')

        const errorMessage = await page.locator('.alert-error')
        await expect(errorMessage).toContainText('Login and/or password are wrong.')
    })
})

test.describe.parallel.only('Astrato with hooks', () => {
    test.beforeEach(async ({ page }) => {
        await page.goto('https://app.astrato.io')
    })
    test.skip(({ browserName }) => browserName === 'webkit', 'Skip webkit for Astrato')
    test('Assertion @astrato', async ({ page }) => {
        await expect(page).toHaveURL('https://app.astrato.io/auth-login/sign-in?returnTo=')
        await expect(page).toHaveTitle('Sign into Astrato Workspace')

        const element = await page.locator('h1.middle-container__heading')
        await expect(element).toBeVisible()
        await expect(element).toHaveText('Reinventing Business Intelligence')
        await expect(element).toHaveCount(1)

        const nonExistingElement = await page.locator('h5')
        await expect(nonExistingElement).not.toBeVisible
    })
    test.describe.skip('Screenshots', () => {

        test('Full page screenshot @astrato', async ({ page }) => {
            // 1. step is load website (beforeEach hook)
            // 2. take screenshot of full page
            await page.screenshot({ path: 'screnshot.png', fullPage: true })
        })
        test('Single element screenshot h1 @astrato', async ({ page }) => {
            const element = await page.$('h1')
            await element.screenshot({ path: 'single_element_h1_screnshot.png' })
        })
        test('Single element screenshot astrato-sign-in-info @astrato', async ({ page }) => {
            const element = await page.$('astrato-sign-in-info')
            await element.screenshot({ path: 'single_element_screnshot.png' })
        })

    })
})

test('Custom helpers @astrato', async ({ page }) => {
    await loadHomepage(page)
    // await page.pause() // show inspector for debug
    await assertTitle(page)
})
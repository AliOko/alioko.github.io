import {test, expect} from '@playwright/test'

test.describe.parallel('Login / Logout flow', () => {
    test.beforeEach(async ({page}) => {
        await page.goto('http://zero.webappsecurity.com/')
        await page.click('#signin_button')
        await page.waitForURL('**/login.html')
    })
    test('Negative scenario for login', async ({page}) => {
        await page.type('#user_login', 'invalid username')
        await page.type('#user_password', 'invalid pwd')
        await page.click('text=Sign in')

        const errorMessage = await page.locator('.alert-error')
        await expect(errorMessage).toContainText('Login and/or password are wrong.')
        await expect(page.locator('h3')).toContainText(`Troubles entering the site?`)
    })
    test('Positive scenario for login + logout', async({page}) => {
        await page.type('#user_login', 'username')
        await page.type('#user_password', 'password')
        await page.click('text=Sign in')
        
        await expect(page).toHaveURL('chrome-error://chromewebdata/')
        await page.goto('http://zero.webappsecurity.com/bank/account-summary.html')
        await page.waitForURL('**/bank/account-summary.html')

        const userDropdownToggle = await page.locator('text=username')
        await expect(userDropdownToggle).toBeVisible()
        const navTabs = await page.locator('.nav.nav-tabs li')
        await expect(navTabs).toHaveText(['Account Summary', 'Account Activity', 'Transfer Funds', 'Pay Bills', 'My Money Map', 'Online Statements'])

        await page.click('text=username')
        const logoutLink = await page.locator('#logout_link')
        await expect(logoutLink).toHaveText('Logout')
        await expect(logoutLink).toBeVisible()
        await page.click('#logout_link')

        await page.waitForURL('**/index.html')
    })
})
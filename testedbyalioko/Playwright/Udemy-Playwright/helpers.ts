export async function loadHomepage(page) {
    await page.goto('https://app.astrato.io')
}

export async function assertTitle(page) {
    await page.waitForSelector('h1')
}
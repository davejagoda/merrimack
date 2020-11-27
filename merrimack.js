const puppeteer = require('puppeteer');

async function run() {
  const start_epoch = new Date();
  console.log(start_epoch.toISOString() + ' start');
  const url = process.env.URL;
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  const response = await page.goto(url);
  console.log(response.headers());
  const status = response.status();
  console.log(status);
  const filename = 'merrimack' + start_epoch.toISOString() + '.png';
  await page.screenshot({path: filename, fullPage: true});
  const title = await page.title();
  await browser.close();
  const end_epoch = new Date();
  console.log(end_epoch.toISOString() + ' ' + title);
}

run();

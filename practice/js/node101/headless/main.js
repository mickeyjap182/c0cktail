const pptr = require('puppeteer');
const awaitDelay = require('./lib/utils/awaitDelay.js')
var nodemailer = require('nodemailer');


// mail設定ここから
// Gmailで試す場合は、アカウントで[安全性の低いアプリの許可]を行うこと。
// @see https://www.atmarkit.co.jp/ait/articles/1409/03/news109.html#cause01
var senderEmailAddress = '<youaremail>@gmail.com'
var senderEmailPassword = '<yourpassword>'
var receiverEmailAddress = 'sendto@email.addr'
// mail設定ここまで


var transporter = nodemailer.createTransport({
  host: 'smtp.gmail.com',
//  port: 587,
  port: 465,
  secure: true, // SSL	
  auth: {
    user: senderEmailAddress,
    pass: senderEmailPassword
  }
});
var mailOptions1 = {
  from: senderEmailAddress,
  to: receiverEmailAddress,
  subject: 'こんにちは',
  text: 'メール送信テストです。'
};

async function run(){
    const browser = await pptr.launch({})
    const page = await browser.newPage()
    const len = 3
    console.log("ループ")

    // sleepの検証
    for (let i = 0; i < len; i++) {

        console.log(await i.toString() + "回目のループ")
        await awaitDelay(1000)

    }

    // 画面遷移
    await page.setViewport({ width: 640, height: 720 })

    await page.goto('https://angular.io')
    const title = await page.title() 
    console.log("ページへアクセスしました。対象ページ :" + title)

    await page.type('input[aria-label=search]', 'pwa') // 要素に文字列cliを入力
    await page.waitFor(5000) // sleep
    await page.screenshot({path: 'page.png'})

    await browser.close()

    // 対象ページ
    mailOptions1.text = mailOptions1.text + "\n取得したタイトルは[" + title + "]です。"
    transporter.sendMail(mailOptions1, function (error, info) {
        
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
        }
    });
}

run()

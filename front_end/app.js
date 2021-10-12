

const electron = require('electron')
const app = electron.app
const BrowserWindow = electron.BrowserWindow

let url
if (process.env.NODE_ENV === 'DEV') {
  url = 'http://localhost:8080/'
} else {
  url = `file://${process.cwd()}/dist/index.html`
}

app.on('ready', () => {
  let window = new BrowserWindow({width: 800, height: 600})
  window.loadURL(url)
})

//For production - https://medium.com/@mikeal/vue-js-electron-the-easy-way-adc3ca09234a
module.exports = {
	configureWebpack: config => {
	  if (process.env.NODE_ENV === 'production') {
		config.output.publicPath = `${process.cwd()}/dist/`
	  }
	}
  }

  
// Runs electron app
const { app, BrowserWindow } = require('electron');

const url = require("url");
const path = require("path");

let mainWindow

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1080,
    height: 720,
    minWidth: 100,
    minHeight: 300,
    maxWidth: 1500,
    'min-height': 700,
    'min-width': 700,
    frame: true,
    title: 'Pokemon Database - COMP3380',
    webPreferences: {
      nodeIntegration: true,
      nodeIntegrationInWorker: true,
      webSecurity: false,
    }
  })

  //mainWindow.setMenu(null);
  mainWindow.setTitle("Pokemon Database - COMP3380")

  mainWindow.setAspectRatio(16/9);

  mainWindow.loadURL(
    url.format({
      pathname: path.join(__dirname, `./dist/index.html`),
      protocol: "file:",
      slashes: true
    })
  );

  mainWindow.on('closed', function () {
    mainWindow = null
  })
}
//console.log(app);
app.on('ready', createWindow)

app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})

app.on('activate', function () {
  if (mainWindow === null) createWindow()
})
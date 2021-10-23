// Runs electron app
const { app, BrowserWindow } = require('electron');

const url = require("url");
const path = require("path");

let mainWindow

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1080,
    height: 720,
    maxWidth: 1500,
    frame: true,
    title: 'Pokemon Database - COMP3380',
    webPreferences: {
      nodeIntegration: true,
      nodeIntegrationInWorker: true,
      webSecurity: false,
    }
  })


  // aspect ratio can be adjusted
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

  // loads in the title from the package file - can change to whatever we want
  mainWindow.webContents.on('did-finish-load', () =>{
    let name = require('./package.json').productName;
    mainWindow.setTitle(name);
  });

}
//console.log(app);
app.on('ready', createWindow)

app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})

app.on('activate', function () {
  if (mainWindow === null) createWindow()
})


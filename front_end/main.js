// Runs electron app
const { app, BrowserWindow } = require('electron');

const url = require("url");
const path = require("path");

let mainWindow;

//Build app function
function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1080,
    height: 720,
    //maxWidth: 1500,//optional max size of application
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
 
  //Default code i believe
  //No idea what it does - seems to work wihout since we're not re-loading anything
  /*
  mainWindow.on('closed', function () {
    mainWindow = null;
  })*/

  // loads in the title from the package file - can change to whatever we want
  mainWindow.webContents.on('did-finish-load', () =>{
    let name = require('./package.json').productName;
    mainWindow.setTitle(name);
  });

  //Catch close event - works on MacOS, needs to be verfied on Windows/Linux
  mainWindow.on('close', function() { 
    app.exit();
  });

}

//Direct App interactions
app.on('ready', createWindow);

app.on('activate', function () {
  if (mainWindow === null) createWindow()
})

app.on('window-all-closed', app.quit);
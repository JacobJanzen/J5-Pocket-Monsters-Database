const { app, BrowserWindow } = require("electron");
const path = require("path");

//https://www.twilio.com/blog/an-introduction-to-building-desktop-applications-with-electron

const loadMainWindow = () => {
    const mainWindow = new BrowserWindow({
        width : 900,
        height: 600,
        webPreferences: {
            nodeIntegration: true
        }
    });

    mainWindow.loadFile(path.join(__dirname, "../html/index.html"));
}

app.on("window-all-closed", () => {
	if (process.platform !== "darwin") {
	  app.quit();
	}
});

app.on("activate", () => {
    if (BrowserWindow.getAllWindows().length === 0) {
        loadMainWindow();
    }
});

app.on("ready", loadMainWindow);
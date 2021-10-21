# Front End
Set up Electron and Vue.   
Anyone wishing to view/work with the front end must install the node modules (listed below) in the front_end directory locally.  
## Project setup
In order to install electron node modules
```
npm install --save-dev electron@latest
```
In order to install Vue2
```
npm install --save @vue/cli
```
**It'll probably have a some errors**

## Compiles and hot-reloads to a LocalHost
```
npm run serve
```

## Compiles and hot-reloads for development (in electron) Images Not Working
```
npm start
```

References:  
[Electron Boilerplate](https://www.electronforge.io)  
[Vue2 Documentation](https://vuejs.org/v2/guide/)  
[Custom icon for final build](https://erikmartinjordan.com/electron-builder-custom-icon) (current icon in ```/build``` is non-transparent, *also dumb*)



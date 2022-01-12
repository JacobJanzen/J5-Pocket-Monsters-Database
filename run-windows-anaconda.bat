cd back_end
call conda activate base
call cmd.exe /c conda install pip
python -m venv venv
call venv\Scripts\activate
pip install -r requirements
start cmd.exe /c run.bat

cd ..\front_end
call cmd.exe /c npm ci
set NODE_OPTIONS=--openssl-legacy-provider
npm run serve

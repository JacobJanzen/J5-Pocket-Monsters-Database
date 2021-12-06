cd back_end
python3 -m venv venv
call venv\Scripts\activate
pip install -r requirements
start cmd.exe /c run.bat

cd ..\front_end
call cmd.exe /c npm ci
npm run serve

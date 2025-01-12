# Django 가상환경
## 패키지 설치
```
sudo apt install python3
sudo apt install python3-venv
```
## 가상환경 실행
```
python3 -m venv {VENV_PATH}
source {VENV_PATH}/bin/activate     // Linux, Mac
```
## 가상환경 종료
```
deactivate
```

# Django DRF 설치
```
pip install django
pip install djangorestframework
```

# Django 에러 해결 방법
## MAKEMIGRATIONS
```
python manage.py makemigrations {APP_NAME}
```
makemigrations 가 자동으로 되지 않아 앱별로 해주어야 할 때가 있다. 오류가 나면 확인해보자.
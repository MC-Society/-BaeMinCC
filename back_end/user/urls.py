from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserViewSet

router = DefaultRouter()
router.register(r'user', UserViewSet)

urlpatterns = [
    path('user/auth/', UserViewSet.isLoginValid),
    path('', include(router.urls)),
]

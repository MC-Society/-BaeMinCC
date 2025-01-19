from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserViewSet, Authorize

router = DefaultRouter()
router.register(r'user', UserViewSet)

urlpatterns = [
    path('user/auth/', Authorize, name = "Authorize"),
    path('', include(router.urls)),
]

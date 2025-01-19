from rest_framework import viewsets
from .models import Favorite
from .serializers import FavoriteSerializer
from django_filters.rest_framework import DjangoFilterBackend

class FavoriteViewSet(viewsets.ModelViewSet):
    queryset = Favorite.objects.all()
    serializer_class = FavoriteSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['userId','storeId']

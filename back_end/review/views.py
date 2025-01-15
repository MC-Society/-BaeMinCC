from rest_framework import viewsets
from .models import Review
from .serializers import ReviewSerializer

class StoreViewSet(viewsets.ModelViewSet):
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer

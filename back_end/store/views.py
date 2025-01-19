from rest_framework import viewsets
from .models import Store
from .serializers import StoreSerializer
from django_filters.rest_framework import DjangoFilterBackend, CharFilter, FilterSet

class CategoryModelFilter(FilterSet):
    category = CharFilter(method='filter_category')

    class Meta:
        model = Store
        fields = []

    def filter_category(self, queryset, name, value):
        return queryset.filter(category__icontains=value)

class StoreViewSet(viewsets.ModelViewSet):
    queryset = Store.objects.all()
    serializer_class = StoreSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = CategoryModelFilter


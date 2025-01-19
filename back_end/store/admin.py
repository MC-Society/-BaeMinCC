from django.contrib import admin
from .models import Store

@admin.register(Store)
class StoreAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'number', 'address','category')  # 리스트에 표시할 필드
    search_fields = ('name', 'address','category')  # 검색 가능 필드

# 또는 아래와 같이 간단하게 등록할 수도 있습니다.
# admin.site.register(Store)

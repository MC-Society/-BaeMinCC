from django.contrib import admin
from .models import User

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('id', 'UserID', 'pw', 'nickname','address')  # 리스트에 표시할 필드
    search_fields = ('UserID','pw','nickname', 'address')  # 검색 가능 필드

# 또는 아래와 같이 간단하게 등록할 수도 있습니다.
# admin.site.register(Store)

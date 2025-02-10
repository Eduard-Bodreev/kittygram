from rest_framework import routers
from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static
from cats.views import AchievementViewSet, CatViewSet
from django.http import HttpResponse

router = routers.DefaultRouter()
router.register(r"cats", CatViewSet)
router.register(r"achievements", AchievementViewSet)


# ✅ Функция для корневого пути "/"
def index(request):
    return HttpResponse("Kittygram is running!")


urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/", include(router.urls)),
    path("api/", include("djoser.urls")),
    path("api/", include("djoser.urls.authtoken")),
    path("", index),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

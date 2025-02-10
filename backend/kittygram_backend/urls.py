import logging
from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static
from rest_framework import routers
from django.http import HttpResponse

from cats.views import AchievementViewSet, CatViewSet

logger = logging.getLogger(__name__)

router = routers.DefaultRouter()
router.register(r"cats", CatViewSet)
router.register(r"achievements", AchievementViewSet)


def index(request):
    print("Запрос на / дошел до Django!")
    logger.info("Запрос на / дошел до Django!")
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

from rest_framework import viewsets

from portal.link.models import Link
from portal.api.serializers import LinkSerializer

class LinkViewSets(viewsets.ModelViewSet):
    """ Link Viewset """
    queryset = Link.objects.all()
    serializer_class = LinkSerializer


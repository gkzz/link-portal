from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from portal.link.models import Link

import logging
logger = logging.getLogger(__name__)

def index(request):
    """ view link's list page """
    logger.debug(request)
    link_latest_list = Link.objects.order_by('-updated_at').all()
    context = {'link_latest_list': link_latest_list}
    return render(request, "link/index.html", context, status=200)
    
def detail(request, pk):
    """ view the pk's link page """
    logger.debug(request)
    logger.debug(pk)
    link = Link.objects.get(id=pk)
    context = {'link': link}
    return render(request, "link/detail.html", context, status=200)


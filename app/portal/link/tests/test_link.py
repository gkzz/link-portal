from django.test import TestCase, Client

from portal.link.models import Link


class LinkTest(TestCase):
    def setUp(self):
        self.client = Client()

    def tearDown(self):
        self.client = None

    def test_ok_link(self):
        """ Get link page """

        response = self.client.get('/links')
        import pdb; pdb.set_trace()
        self.assertNotEqual(response.status_code, 400)

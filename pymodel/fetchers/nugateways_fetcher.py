# -*- coding: utf-8 -*-

from bambou import NURESTFetcher


class NUGatewaysFetcher(NURESTFetcher):
    """ Gateway fetcher """

    @classmethod
    def managed_class(cls):
        """ Managed class """

        from .. import NUGateway
        return NUGateway
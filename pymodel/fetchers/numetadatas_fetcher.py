# -*- coding: utf-8 -*-

from bambou import NURESTFetcher


class NUMetadatasFetcher(NURESTFetcher):
    """ Metadata fetcher """

    @classmethod
    def managed_class(cls):
        """ Managed class """

        from .. import NUMetadata
        return NUMetadata
# -*- coding: utf-8 -*-

from bambou import NURESTFetcher


class NUPolicyGroupTemplatesFetcher(NURESTFetcher):
    """ PolicyGroupTemplate fetcher """

    @classmethod
    def managed_class(cls):
        """ Managed class """

        from .. import NUPolicyGroupTemplate
        return NUPolicyGroupTemplate
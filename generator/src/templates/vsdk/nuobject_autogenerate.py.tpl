# -*- coding: utf-8 -*-

# Copyright 2014 Alcatel-Lucent USA Inc.
# NU{{ model.name }}
# {{ model.description }}

{% for relation in model.relations %}
from ..fetchers import NU{{ relation.plural_name }}Fetcher{% endfor %}
from bambou import NURESTObject
from bambou.utils.decorators import classproperty{% if model.has_time_attribute %}
from time import time{% endif %}


class NU{{ model.name }}(NURESTObject):
    """ Represents a {{ model.name }} object

        IMPORTANT: This file has been autogenerated. Do not override it !

    """

    def __init__(self, **kwargs):
        """ Initializes a {{ model.name }} instance

        """
        super(NU{{ model.name }}, self).__init__()

        # Read/Write Attributes
        {% for attribute in model.attributes %}
        self._{{ attribute.local_name|lower }} = None{% endfor %}
        {% for attribute in model.attributes %}
        self.expose_attribute(local_name=u"{{ attribute.local_name|lower }}", remote_name=u"{{ attribute.remote_name }}", attribute_type={{ attribute.local_type }}{% if attribute.is_required %}, is_required=True{% endif %}{% if attribute.is_unique %}, is_unique=True{% endif %}{% if attribute.choices %}, choices={{ attribute.choices|sort|trim }}{% endif %}){% endfor %}
        {% if model.relations|length > 0 %}
        # Fetchers
        {% for relation in model.relations %}
        self.{{ relation.instance_plural_name }} = []
        self.{{ relation.instance_plural_name }}_fetcher = NU{{ relation.plural_name }}Fetcher.fetcher_with_object(nurest_object=self, local_name=u"{{relation.instance_plural_name}}")
        {% endfor %}{% endif %}

        self._compute_args(**kwargs)

    # Properties
    {% for attribute in model.attributes %}
    def _get_{{ attribute.local_name }}(self):
        """ Get attribute {{ attribute.local_name }}

            {{ attribute.description }}

        """
        return self._{{ attribute.local_name }}

    def _set_{{ attribute.local_name }}(self, value):
        """ Set attribute {{ attribute.local_name }}

            {{ attribute.description }}

        """
        self._{{ attribute.local_name }} = value

    {{ attribute.local_name }} = property(_get_{{ attribute.local_name }}, _set_{{ attribute.local_name }})
    {% endfor %}
    # Methods

    @classproperty
    def rest_name(cls):
        """ REST name that will be used to generates URI

        """
        return u"{{ model.remote_name }}"

    def get_fetcher_name(self):
        """ Return the fetcher name that will be used in objects parents

        """
        return u"{{ model.instance_plural_name }}_fetcher"


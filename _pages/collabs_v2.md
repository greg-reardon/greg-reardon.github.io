---
layout: archive
title: "Collaborators"
permalink: /collabs_v2/
author_profile: true
---

I have had the pleasure of working with many talented researchers from across the globe:

{% if site.talkmap_link == true %}
<iframe src="{{ '/talkmap/map_v2.html' | relative_url }}" title="Collaborator map" height="425" width="700" style="display:block; width:700px; max-width:100%; border:0"></iframe>
{% endif %}

{% include base_path %}

{% for post in site.collabs %}
  {% include reardon/reardon_collab.html %}
{% endfor %}

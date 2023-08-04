---
layout: archive
title: "Collaborators"
permalink: /collabs/
author_profile: true
---

I have had the pleasure of working with many talented researchers from across the globe: 


{% if site.talkmap_link == true %}
<iframe src="/talkmap/map.html" height="425" width="625" style="border:none; bottom-margin:0"></iframe>
{% endif %}
<!--
Inject the talk map code to generate collaborator network
-->

{% include base_path %}

{% for post in site.collabs %}
  {% include reardon/reardon_collab.html %}
{% endfor %}
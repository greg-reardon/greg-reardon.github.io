---
layout: archive
title: "Selected Publications"
permalink: /publications/
author_profile: true
research_areas: compact
googlescholar: https://scholar.google.com/citations?user=JQDPQpkAAAAJ&hl=en&oi=ao
---

{% include base_path %}

<div style="display: flex; flex-direction: row; flex-wrap: wrap; align-items: stretch; width:100%">
{% for post in site.publications reversed %}

{% if post.show == true %}

{% comment %}Previous card fill: #efefef (rgb(239, 239, 239)).{% endcomment %}
<a class="publication-card-v2" href="{{ post.url | relative_url }}" aria-label="{{ post.title | strip_html | escape }}" style="display:flex; position:relative; align-items:stretch; flex-shrink:4; min-width:0; max-width:450px; background-color:#fff; box-sizing:border-box; padding:15px; margin:20px; border-radius:14px; flex-basis:300px; flex-grow:2">

  {% include reardon/reardon_pub_v2.html %}
</a>

{% endif %}
{% endfor %}
</div>

{% if page.googlescholar %}
  You can also find my publications on <a href="{{ page.googlescholar }}" target="_blank">my Google Scholar profile</a>.
{% endif %}

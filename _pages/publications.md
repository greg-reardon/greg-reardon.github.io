---
layout: archive
title: "Select Publications"
permalink: /publications/
author_profile: true
googlescholar: https://scholar.google.com/citations?hl=en&user=VEdujacAAAAJ
---

{% include base_path %}

<div style="display: flex; flex-direction: row; flex-wrap: wrap; width:100%">
{% for post in site.publications reversed %}

{% if post.show == true %}

<div style="display:flex; position:relative; align-items:center; justify-content: center; flex-shrink: 4; min-width: 80px; max-width:450px; background-color:rgb(245, 245, 245); box-shadow: 0 0 4px #ccc; padding: 5px 15px 5px 15px; margin: 20px; border-radius:25px;flex-basis: 300px; flex-grow: 2">

  {% include reardon/reardon_pub.html %}
</div>

{% endif %}
{% endfor %}
</div>

{% if page.googlescholar %}
  You can also find my publications on <a href="{{ page.googlescholar }}" target="_blank">my Google Scholar profile</a>.
{% endif %}


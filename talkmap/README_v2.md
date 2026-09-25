# Collaborator map v2

The Collaborators navigation link opens `/collabs_v2/`. You can also open
`/talkmap/map_v2.html` directly. The original map remains at `/talkmap/map.html`.

Jekyll generates `org-locations_v2.js` from `_collabs/*.md` on each build. Each
collaborator has a marker with their name, affiliation, city, and website link.
People in the same city share coordinates and are grouped into a cluster;
clicking through the cluster spreads overlapping markers so each can be selected.

To add or move a collaborator, update their `location` field. If the city is
already in `_data/collaborator_locations_v2.yml`, no other changes are needed.
For a new city, add a matching key and `[latitude, longitude]` pair to that file:

```yaml
"Pisa, Italy": [43.716667, 10.4]
```

City names must match exactly, except for surrounding whitespace. Missing or
invalid coordinates skip that marker and produce a browser console warning;
the collaborator still appears in the list below the map. No geocoding service
or Python script is required. Keep editing the source files rather than `_site`.

To also use v2 at the original `/collabs/` URL, change that page's iframe source
to `/talkmap/map_v2.html`.

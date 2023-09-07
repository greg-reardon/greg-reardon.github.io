

# # Leaflet cluster map of talk locations
#
# (c) 2016-2017 R. Stuart Geiger, released under the MIT license
#
# Run this from the _talks/ directory, which contains .md files of all your talks. 
# This scrapes the location YAML field from each .md file, geolocates it with
# geopy/Nominatim, and uses the getorg library to output data, HTML,
# and Javascript for a standalone cluster map.
#
# Requires: glob, getorg, geopy

import glob
import getorg
#import geopy
from geopy import Nominatim
from time import sleep
from geopy.exc import GeocoderTimedOut

def do_geocode(address, geocoder, attempt=1, max_attempts=5):
    try:
        return geocoder.geocode(address)
        sleep(1)
    except GeocoderTimedOut:
        if attempt <= max_attempts:
            return do_geocode(address, geocoder, attempt=attempt+1)
        raise

g = glob.glob("*.md")


geocoder = Nominatim()
location_dict = {}
locations = []
uniqueLocations = []
#location = ""
permalink = ""
title = ""

for file in g:
    with open(file, 'r') as f:
        lines = f.read()
        if lines.find('location: "') > 1:
            loc_start = lines.find('location: "') + 11
            lines_trim = lines[loc_start:]
            loc_end = lines_trim.find('"')
            locations.append(lines_trim[:loc_end])
                            
          
        #location_dict[location] = geocoder.geocode(location)
        #sleep(1)
        #print(location, "\n", location_dict[location])
        #break

#get only unique locs in list and coordinates
uniqueLocations = list(set(locations))
for loc in uniqueLocations:
    #location_dict[loc] = geocoder.geocode(loc)
    #sleep(2)
    location_dict[loc] = do_geocode(loc, geocoder)
    sleep(1.1)
    #location_dict[loc] = 2
    print(loc, "\n", location_dict[loc])

#write all locations and coordinates to .js file
f = open("../talkmap/org-locations.js", "w")
output = 'var addressPoints = ['
temp = ''
for key in locations:
    loc = location_dict[key]
    temp = ' [ "' + key + '", ' + str(loc.latitude) + ', ' + str(loc.longitude) + ' ], '
    output = output + temp
f.write(output + '];')
f.close()

# m = getorg.orgmap.create_map_obj()
# getorg.orgmap.output_html_cluster_map(location_dict, folder_name="../talkmap", hashed_usernames=False)





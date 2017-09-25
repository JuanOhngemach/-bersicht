# The best way to display a photo is to store it locally as you see below
# in the "pic-display.widget/Pics/" folder.

# You can also use a URL, e.g. "echo http://i.imgur.com/d9T8eJV.png"
# However this method doesn't work when offline.



# Any web image format -- including animated GIFs -- will work.

command: "echo https://i1.wp.com/media.boingboing.net/wp-content/uploads/2015/10/oqnfwbC2.gif?w=970" 
refreshFrequency: 300000 # 5 Minutes

render: (output)-> """
<img src="#{output}" style="width:100%" >
""" #                             ^ Change size here.

style: """
	position: absolute
	left: 29%
	top: 20%
""" #    ^ Change placement here.


#possible wallpapers:

# Astronaut: command: "echo https://i2.wp.com/thetechhacker.com/wp-content/uploads/2014/12/Best-Websites-To-Create-Gifs-Online.gif?fit=1680%2C1050&ssl=1" 
# style: 0% each

# Matrix: command: "echo https://media.giphy.com/media/WoD6JZnwap6s8/giphy.gif" 
# style: 0% each

# Anime: command: "echo http://www.hdwallpapersdesktop.com/Anime/AnimeHDWallpaper/images/Anime%20HD%20Wallaper%20131.gif" 
# style: 0% each

# Mario: command: "echo https://i.pinimg.com/originals/ef/a5/4b/efa54b24be55c2ae77aa9e03e4043caf.gif" 

# Satisfying command: "echo https://media.giphy.com/media/BhoiaaYGHecjS/source.gif" 
# Style
# top: 0.06%
# style="width:120%"

# white thing: command: "echo https://i2.wp.com/media.boingboing.net/wp-content/uploads/2015/10/P1Chi6u1.gif?w=970" 
# 	left: 33% 	top: 20%
# white wallpaper

# red thing: command: "echo https://i1.wp.com/media.boingboing.net/wp-content/uploads/2015/10/oqnfwbC2.gif?w=970" 
# 	left: 29%	top: 20%
# black wallpaper




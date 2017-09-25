# Time Until widget for Übersicht by John Mathews (github.com/johnmathews/time_since)
# Enter the date and time you want to measure from on line 5
#
# Built from the Fuzzy Time widget by Ruurd Pels (github.com/ruurd/justthedate) 
# and the SideBar widget created by Jonathan MacQueen (https://github.com/jmacqueen) 
# and then Pe8er (https://github.com/Pe8er)

options =
  # Set the start date to count from.
  theDate     : "26/9/2017 23:31"
  # Set the opening and closing phrase
  startPhrase : "Time untill uni... "    
  endPhrase   : "" 
  shorten     : false # Must be true for abreviations 
  detail      : 1 # 1 includes seconds, 2 includes minutes, etc.    
  
options : options

# Adjust the styles as you like
style =
  # Define the maximum width of the widget.
  width: "30%"

  # Define the position, where to display the date.
  # Set properties you don't need to "auto"
  position:
    top:    "130px"
    left:   "25px"
    
  # Misc
  text_align:     "left"
  text_transform: "none"

  # Font properties
  font_family:     "Helvetica Neue"
  font_color:      "#A9A9A9"
  font_size:       "21.5px"
  font_weight:     "200"
  letter_spacing:  "0.065em"
  line_height:     "1.2em"
  text_shadow:     "0 1px 2px black"
      
command: "osascript 'time_until.widget/Time_Until.applescript' \"#{options.theDate}\""

# Lower the frequency for more accuracy.
refreshFrequency: 1000 * 1 # (1000 * n) seconds

render: (o) -> """
  <head>
    <link href="https://fonts.googleapis.com/css?family=Galada|Lemonada|Lobster+Two|Ubuntu|Yellowtail|Butterfly+Kids|Dr+Sugiyama|Miniver" rel="stylesheet">
  </head>
  <div id="content">
     <span id="time"></span> 
  </div>
"""

update: (output, dom) -> 
  values = output.slice(0,-1).split(" ")
  y1 = y = ' ' + values[1] 
  m1 = m = ' ' + values[3] 
  d1 = d = ' ' + values[5] 
  h1 = h = ' ' + values[7] 
  min1 = min = ' ' + values[9] 
  s1 = s = ' ' + values[11] 
    
  spcr = ' '
  a_d = 'and '
  
  out = []
  mid = []
    
  if options.shorten
        spcr = ''
        a_d = '& '
        y1 = y = 'y'
        m1 = m = 'm'
        d1 = d = 'd'
        h1 = h = 'h'
        min1 = min = 'm'
        s1 = s = 's'
        
  # If years = 0 then don't show year    
  if values[0] == '0' || options.detail > 6
        values[0] = ''
        y = ''
  else out.push values[0] + y
  
  # If months = 0 then don't show month        
  if values[2] == '0' || options.detail > 5
        values[2] = ''
        m = ''
  else out.push values[2] + m
        
  # If days = 0 then don't show day        
  if values[4] == '0' || options.detail > 4
        values[4] = ''
        d = ''
  else out.push values[4] + d
    
  # If hours = 0 then don't show hour        
  if values[6] == '0' || options.detail > 3
        values[6] = ''
        h = ''
  else out.push values[6] + h

  # If minute = 0 then don't show minute        
  if values[8] == '0' || options.detail > 2
        values[8] = ''
        min = ''
  else out.push values[8] + min
              
  # If seconds = 0 then don't show second        
  if values[10] == '0' || options.detail > 1
        values[10] = ''
        s = ''
  else out.push values[10] + s
  
  max_l = 6 - (options.detail - 1)      
  arr_length = out.length - 1
            
  arr = []
  arr.push( ', ' ) while arr.length isnt arr_length   
  arr[arr.length-1] = [' '+a_d+' ']           

  for value, key in out
    mid.push out[key]
    mid.push arr[key]
    
  time_str =  options.startPhrase + mid.join("") + options.endPhrase
        
  $(dom).find("#time").html(time_str)
   
style: """
  top: #{style.position.top}
  bottom: #{style.position.bottom}
  right: #{style.position.right}
  left: #{style.position.left}
  width: #{style.width}
  padding: 1.0em 0
  height: 0em
  font-family: #{style.font_family}
  color: #{style.font_color}
  font-weight: #{style.font_weight}
  text-align: #{style.text_align}
  text-transform: #{style.text_transform}
  text-shadow: 0 0 0.2em black
  font-size: #{style.font_size}
  letter-spacing: #{style.letter_spacing}
  text-shadow: #{style.text_shadow}
  line-height: #{style.line_height}
  z-index: 1
  
"""

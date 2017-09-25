command: """
read -r running <<<"$(ps -ef | grep \"MacOS/Spotify\" | grep -v \"grep\" | wc -l)" &&
test $running != 0 &&
IFS='|' read -r theArtist theName <<<"$(osascript <<<'tell application "Spotify"
        set theTrack to current track
        set theArtist to artist of theTrack
        set theName to name of theTrack
        return theArtist & "|" & theName
    end tell')" &&
if [ -z "$theArtist" ]
then
    echo ""
else
    echo "$theArtist - $theName" || echo "Not Connected To Spotify"
fi
"""

refreshFrequency: 2000

style: """
  bottom: 20px
  right: 20px
  color: #A9A9a9		

  .output
    font-family: Helvetica Neue
    font-size: 20px
    font-weight: 200
    text-shadow: 0 1px 2px #000000;
    z-index: 1
"""

render: (output) -> """
	<div class="output">#{output}</div>
"""

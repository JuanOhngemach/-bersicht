command: "ps axro \"%cpu,ucomm,pid\" | awk 'FNR>1' | tail +2 | head -n 4 | sed -e 's/^[ ]*\\([0-9][0-9]*\\.[0-9][0-9]*\\)\\ /\\1\\%\\,/g' -e 's/\\ \\ *\\([0-9][0-9]*$\\)/\\,\\1/g'"

refreshFrequency: 2000

style: """
  top: 20px
  left: 20px
  color: #808080	
  font-family: Helvetica Neue
  z-index: 1

  table
    border-collapse: collapse
    table-layout: fixed

    &:after
      content: 'cpu'
      position: absolute
      left: 0
      top: -14px
      font-size: 8px

  td
    border: 1px solid #696969		
    font-size: 20px
    font-weight: 100
    width: 100px
    max-width: 89px
    overflow: hidden
    text-shadow: 0 0 1px rgba(#000, 0.5)

  .wrapper
    padding: 4px 6px 4px 6px
    position: relative

  .col1
    background: rgba(#fff, 0.2)

  .col2
    background: rgba(#fff, 0.1)

  p
    padding: 0
    margin: 0
    font-size: 8px
    font-weight: normal
    max-width: 100%
    color: #808080	
    text-overflow: ellipsis
    text-shadow: 10

  .pid
    position: absolute
    top: 2px
    right: 2px
    font-size: 7px
    font-weight: normal

"""


render: -> """
  <table>
    <tr>
      <td class='col1'></td>
      <td class='col2'></td>
      <td class='col3'></td>
      <td class='col4'></td>		  
    </tr>
  </table>
"""

update: (output, domEl) ->
  processes = output.split('\n')
  table     = $(domEl).find('table')

  renderProcess = (cpu, name, id) ->
    "<div class='wrapper'>" +
      "#{cpu}<p>#{name}</p>" +
      "<div class='pid'>#{id}</div>" +
    "</div>"

  for process, i in processes
    args = process.split(',')
    table.find(".col#{i+1}").html renderProcess(args...)


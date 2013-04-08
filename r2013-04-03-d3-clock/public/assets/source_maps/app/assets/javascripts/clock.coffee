window.app =
  ready: ->
    setInterval(app.update_time, 1000)
    setInterval(app.show_stairs, 1000)
  update_time: ->
    time = moment().format('MMMM Do YYYY, h:mm:ss a')
    $('#time').text(time)
  show_stairs: ->
    height = 500
    sec = moment().format('s').toNumber()
    rects = d3.select('svg').selectAll('rect').data([1..sec])
    rects.enter()
         .append('rect')
         .attr('width', 20)
         .attr('height', 5)
         .attr('x', (d) -> (d - 1) * 20)
         .attr('y', (d) -> height - ((d - 1) * 5))
         .transition()
         .style('fill', "rgb(#{Number.random(1,255)}, #{Number.random(1,255)}, #{Number.random(1,255)})")
    rects.exit()
         .transition()
         .attr('width', 0)
         .attr('height', 0)
         .remove()

  show_clock: ->
    colors = ['#ff0000', '#00ff00', '#0000ff', '#990000', '#009900', '#000099', '#660000', '#006600', '#000066', '#330000']
    sec = moment().format('s').toNumber()
    three = sec % 3
    d3.select('.three')
      .transition()
      .duration(1000)
      .attr('r', three * 50)
      .style('fill', colors[three])

    ten = sec % 10
    d3.select('.ten')
      .transition()
      .duration(1000)
      .attr('r', ten * 10)
      .style('fill', colors[ten])

$(document).ready(app.ready)

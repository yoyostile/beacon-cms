$ ->
  $container = $('#heatmap')

  heatmap = h337.create({
    container: $container[0]
  })

  $series = JSON.parse($container.attr('data-series'))
  for serie in $series
    serie.x = serie.x * $container.width()
    serie.y = serie.y * $container.height()

  heatmap.setData({
    max: 2,
    data: $series
  })

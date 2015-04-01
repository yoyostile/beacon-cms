$ ->
  $container = $('#heatmap')

  heatmap = h337.create({
    container: $container[0]
  })

  $series = JSON.parse($container.attr('data-series'))
  $maxValue = 0
  for serie in $series
    serie.x = serie.x * $container.width()
    serie.y = serie.y * $container.height()
    $maxValue = serie.value if serie.value > $maxValue

  heatmap.setData({
    min: 0,
    max: $maxValue,
    radius: 30,
    data: $series
  })

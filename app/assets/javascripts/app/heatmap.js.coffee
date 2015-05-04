$ ->
  $container = $('#heatmap')

  heatmap = h337.create({
    container: $container[0],
    radius: 100,
    minOpacity: .1,
    maxOpacity: .9,
    blur: .9
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
    data: $series
  })

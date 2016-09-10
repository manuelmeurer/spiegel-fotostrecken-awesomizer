initGallery = (images) ->
  $container = $('.biga-entries').empty()
  $gallery = $('<div id="gallery" data-nav="thumbs" data-navposition="top" data-keyboard="true" data-trackpad="true" data-loop="true" data-width="100%" data-maxheight="580" data-auto="false"></div>').appendTo($container)
  $caption = $('<div id="gallery-caption"></div>').appendTo($container)
  images.sort (a, b) ->
    a[0] - b[0]
  for image in images
    $gallery.append("<img src='#{image[1]}'>")
  $gallery
    .on 'fotorama:show', (e, fotorama) ->
      $caption.html images[fotorama.activeFrame.i - 1][2]
    .fotorama()

$ ->
  maxPage = parseInt($('.biga-control > span').get(0).innerText.match(/\/\s+(\d+)/)[1])
  page = 1
  images = []
  while page <= maxPage
    suffix = if page == 1 then '' else "-#{page}"
    url = window.location.href.replace(/(?:-\d{1,2})?\.html$/, "#{suffix}.html")
    $.get url, (data) ->
      $doc = $($.parseHTML(data))
      fetchedPage = parseInt(@url.match(/(?:-(\d{1,2}))?\.html$/)[1] || '1')
      $imageWrapper = $doc.find('.biga-image')
      image = $imageWrapper.find('img').attr('src')
      text = $imageWrapper.find('p').html()
      images.push [fetchedPage, image, text]
      initGallery images if images.length == maxPage
    page++

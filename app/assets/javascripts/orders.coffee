# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.add_to_cart', ->
  ths = $(this)
  prod = ths.parent().parent().parent().find('.prod_id').val()
  qty = ths.parent().parent().parent().find('.qty').val()
  $.ajax
    url: '/basket'
    method: 'POST'
    dataType: 'script'
    data:
      prod: prod
      qty: qty
    success: (response) ->
      $('#checkout').show();
  return
  
Number::formatMoney = (c, d, t) ->
  `var c`
  `var d`
  `var t`
  n = this
  c = if isNaN(c = Math.abs(c)) then 2 else c
  d = if d == undefined then '.' else d
  t = if t == undefined then ',' else t
  s = if n < 0 then '-' else ''
  i = String(parseInt(n = Math.abs(Number(n) or 0).toFixed(c)))
  j = if (j = i.length) > 3 then j % 3 else 0
  '€' + s + (if j then i.substr(0, j) + t else '') + i.substr(j).replace(/(\d{3})(?=\d)/g, '$1' + t) + (if c then d + Math.abs(n - i).toFixed(c).slice(2) else '')

$(document).on 'change', '.change_qty', ->
  ths = $(this)
  basket = ths.parent().find('#basket').val()
  sub_total_basket = ths.parent().parent().find('.sub_total_basket')
  sub_total = ths.parent().parent().find('.basket_price')
  total_price = ths.parent().parent().find('.total_price')
  sub_total_order = ths.parent().parent().parent().find('.sub_total_order')
  discount_tab = ths.parent().parent().parent().find('.discount')
  total_order = ths.parent().parent().parent().find('.total_order')
  $.ajax
    url: '/update_basket'
    method: 'PUT'
    dataType: 'json'
    data:
      basket: basket
      qty: ths.val()
    success: (response) ->
      `var discounted`
      sub_total_basket.val response['basket']['sub_total']
      sub_total.html response['basket']['sub_total_format']
      total = 0
      $('.sub_total_basket').each ->
        total += parseFloat($(this).val())
        return
      if total >= 70
        discounted = total * 12 / 100
        sub_total_order.html total.formatMoney(2, '.', ',')
        discount_tab.html discounted.formatMoney(2, '.', ',')
        total_order.html (total - discounted).formatMoney(2, '.', ',')
      else
        discounted = 0 * 12 / 100
        sub_total_order.html total.formatMoney(2, '.', ',')
        discount_tab.html discounted.formatMoney(2, '.', ',')
        total_order.html total.formatMoney(2, '.', ',')
      if total == 0
        $('#checkout').hide();
      else
        $('#checkout').show();
      return
  return
  
$(document).on 'click', '.remove_product', ->
  ths = $(this)
  basket = ths.parent().parent().parent().find('#basket').val()
  remove_order = ths.parent().parent().parent()
  sub_total_order = ths.parent().parent().parent().parent().find('.sub_total_order')
  discount_tab = ths.parent().parent().parent().parent().find('.discount')
  total_order = ths.parent().parent().parent().parent().find('.total_order')
  $.ajax
    url: '/remove_order'
    method: 'DELETE'
    dataType: 'json'
    data: basket: basket
    success: (response) ->
      `var discounted`
      remove_order.remove()
      total = 0
      $('.sub_total_basket').each ->
        total += parseFloat($(this).val())
        return
      if total >= 70
        discounted = total * 12 / 100
        sub_total_order.html total.formatMoney(2, '.', ',')
        discount_tab.html discounted.formatMoney(2, '.', ',')
        total_order.html (total - discounted).formatMoney(2, '.', ',')
      else
        discounted = 0 * 12 / 100
        sub_total_order.html total.formatMoney(2, '.', ',')
        discount_tab.html discounted.formatMoney(2, '.', ',')
        total_order.html total.formatMoney(2, '.', ',')
      if total == 0
        $('#checkout').hide();
      else
        $('#checkout').show();        
      return
  return
  

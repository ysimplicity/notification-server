# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('[data-log-token="true"]').on 'dblclick', ->
    $this = $(this)
    
    uid = $this.find('[data-uid]').data('uid')
    token = $this.find('[data-token]').data('token')
    
    console.log "---\nUID\n---\n#{uid}"
    console.log "-----\nTOKEN\n-----\n#{token}"

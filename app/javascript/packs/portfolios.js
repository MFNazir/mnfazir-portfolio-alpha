require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery') 
require("packs/html.sortable") 
require("packs/sorts.coffee")  
import "bootstrap";
import "@fortawesome/fontawesome-free/js/all";
import "../stylesheets/portfolios"





document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()

})
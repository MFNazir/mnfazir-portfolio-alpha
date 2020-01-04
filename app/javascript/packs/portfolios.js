require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery') 
require("packs/sorts.coffee")  
require("packs/html.sortable")   
import "bootstrap";
import "@fortawesome/fontawesome-free/js/all";
import "../stylesheets/portfolios";
import "cocoon";






document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()

})
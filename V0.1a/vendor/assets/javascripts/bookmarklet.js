//= require easymarklet/simple

(function(){
  
  var FvbSimpleBookmarklet = {
    css : ['/assets/fvb_simple_bookmarklet.css'], // could be an array or a single string
    init : function(full_host){
      full_host = full_host == undefined ? '' : full_host
      var div = document.createElement('div')
      div.id = 'fvb_simple_insert'

      var go = document.createElement('a')
      go.appendChild(document.createTextNode('Add this listing to Abodely.'))
      go.onclick = function(){
        var dest = full_host + "/bookmarklets?url=" + encodeURIComponent(document.location)
        document.location = dest;
      }

      var no = document.createElement('a')
      no.appendChild(document.createTextNode(' Nevermind.'))
      no.onclick = function(){
        document.body.removeChild(div);
      }

      div.appendChild(go)
      div.appendChild(no)
      document.body.appendChild(div);
    }
  }
  
  window.FvbSimpleBookmarklet = FvbSimpleBookmarklet;

})();

var fvb_simple_simple = new Easymarklet.Simple(FvbSimpleBookmarklet);
fvb_simple_simple.init('http://0.0.0.0:3000');



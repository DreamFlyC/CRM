var loadRs = [
              	"jquery.min.js","front.js","../plugin/bootstrap3.3.2/js/bootstrap.min.js",
              	"../plugin/slide/slider.js","../plugin/bootstrap3.3.2/css/bootstrap.min.css",
              	"../plugin/slide/slider.css","../css/style.css"
             ];
while(loadRs.length){try{importScripts(loadRs.shift());}catch(e){}}
// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function ajax_eval(url) {
  new Ajax.Request(url, {
    asynchronous:true,
    evalScripts:true,
    onComplete: function(r){
      eval(r.responseText);
      }
    });
  }

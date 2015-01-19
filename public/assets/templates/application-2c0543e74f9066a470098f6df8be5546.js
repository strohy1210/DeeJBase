Ember.TEMPLATES["application"] = Ember.Handlebars.template({"1":function(depth0,helpers,partials,data) {
  data.buffer.push("Venue Pages");
  },"3":function(depth0,helpers,partials,data) {
  data.buffer.push("List");
  },"compiler":[6,">= 2.0.0-beta.1"],"main":function(depth0,helpers,partials,data) {
  var stack1, helperMissing=helpers.helperMissing, buffer = '';
  data.buffer.push("<div id=\"ember-container\" class=\"navbar navbar-default navbar-fixed-top\">\n  <div class= \"container\"> \n    <div class='navbar-header hidden-xs'><a href='/' class='navbar-brand'><img src=\"assets/logo_white.png\" alt=\"Find NYCs Rawest Talent\" ></a></div>\n    <ul class=\"nav navbar-nav\">\n    <li>");
  stack1 = ((helpers['link-to'] || (depth0 && depth0['link-to']) || helperMissing).call(depth0, "index", {"name":"link-to","hash":{},"hashTypes":{},"hashContexts":{},"fn":this.program(1, data),"inverse":this.noop,"types":["STRING"],"contexts":[depth0],"data":data}));
  if (stack1 != null) { data.buffer.push(stack1); }
  data.buffer.push("</li>\n    <li><a href=\"/\">DJ Pages</a></li>\n    <li>");
  stack1 = ((helpers['link-to'] || (depth0 && depth0['link-to']) || helperMissing).call(depth0, "venues", {"name":"link-to","hash":{},"hashTypes":{},"hashContexts":{},"fn":this.program(3, data),"inverse":this.noop,"types":["STRING"],"contexts":[depth0],"data":data}));
  if (stack1 != null) { data.buffer.push(stack1); }
  data.buffer.push("</li>\n    </ul>\n        \n  </div>\n</div>\n<div class=\"container\">\n\n");
  stack1 = helpers._triageMustache.call(depth0, "outlet", {"name":"_triageMustache","hash":{},"hashTypes":{},"hashContexts":{},"types":["ID"],"contexts":[depth0],"data":data});
  if (stack1 != null) { data.buffer.push(stack1); }
  data.buffer.push("\n</div>\n\n\n<footer class='container'>\n\n</footer>\n");
  return buffer;
},"useData":true});

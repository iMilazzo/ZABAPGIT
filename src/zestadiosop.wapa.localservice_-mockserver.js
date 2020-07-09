sap.ui.define(["sap/ui/core/util/MockServer"],function(e){"use strict";var t,a="EstadiosOP.EstadiosOP/",r=a+"localService/mockdata";return{init:function(){var s=jQuery.sap.getUriParameters(),n=jQuery.sap.getModulePath(r),i=jQuery.sap.getModulePath(a+"man+
ifest",".json"),o="EstadiosSet",u=s.get("errorType"),p=u==="badRequest"?400:500,c=jQuery.sap.syncGetJSON(i).data,d=c["sap.app"].dataSources,l=d.mainService,f=jQuery.sap.getModulePath(a+l.settings.localUri.replace(".xml",""),".xml"),g=/.*\/$/.test(l.uri)?+
l.uri:l.uri+"/",m=l.settings.annotations;t=new e({rootUri:g});e.config({autoRespond:true,autoRespondAfter:s.get("serverDelay")||1e3});t.simulate(f,{sMockdataBaseUrl:n,bGenerateMissingMockData:true});var y=t.getRequests(),h=function(e,t,a){a.response=func+
tion(a){a.respond(e,{"Content-Type":"text/plain;charset=utf-8"},t)}};if(s.get("metadataError")){y.forEach(function(e){if(e.path.toString().indexOf("$metadata")>-1){h(500,"metadata Error",e)}})}if(u){y.forEach(function(e){if(e.path.toString().indexOf(o)>-+
1){h(p,u,e)}})}t.start();jQuery.sap.log.info("Running the app with mock data");m.forEach(function(t){var r=d[t],s=r.uri,n=jQuery.sap.getModulePath(a+r.settings.localUri.replace(".xml",""),".xml");new e({rootUri:s,requests:[{method:"GET",path:new RegExp("+
"),response:function(e){jQuery.sap.require("jquery.sap.xml");var t=jQuery.sap.sjax({url:n,dataType:"xml"}).data;e.respondXML(200,{},jQuery.sap.serializeXML(t));return true}}]}).start()})},getMockServer:function(){return t}}});                             
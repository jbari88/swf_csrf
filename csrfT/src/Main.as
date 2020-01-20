package {
import flash.display.Sprite;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLRequestHeader;
import flash.net.URLRequestMethod;
public class Main extends Sprite {
    public function Main() {
        super ();
        var request:URLRequest=null;
        var data:String = this.root.loaderInfo.parameters.data;
        var endpoint:String = this.root.loaderInfo.parameters.endpoint;
        var php_url:String = !!this.root.loaderInfo.parameters.php_url?this.root.loaderInfo.parameters.php_url:"";
        var url:String = php_url!=""?php_url:endpoint;
        var contentType:String = !!this.root.loaderInfo.parameters.ct?this.root.loaderInfo.parameters.ct:"application/json";
        var header:String= !!this.root.loaderInfo.parameters.header?this.root.loaderInfo.parameters.header:"X-Requested-With";
        var value:String= !!this.root.loaderInfo.parameters.value?this.root.loaderInfo.parameters.value:"XMLHttpRequest";
        var type:String= !!this.root.loaderInfo.parameters.type?this.root.loaderInfo.parameters.type:"json";
        var reqMethod:String = !!this.root.loaderInfo.parameters.req_method?this.root.loaderInfo.parameters.req_method:"GET";

        if(type != "json" ){
            data = data.replace(",","&");
        }

        if(php_url != ""){
            request = new URLRequest(url+"?endpoint="+endpoint);
        }else{
            request = new URLRequest(url);

        }

        request.requestHeaders.push(new URLRequestHeader("Content-Type",contentType));
        request.requestHeaders.push(new URLRequestHeader(header,value));
        request.data = reqMethod=="GET"?"":data;
        request.method = reqMethod;

        var myLoader:URLLoader = new URLLoader();
        try{
            myLoader.load(request);
            return;
        }catch(e:Error){
            trace(e);
            return;
        }

    }
}
}

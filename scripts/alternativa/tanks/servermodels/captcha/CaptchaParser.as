package alternativa.tanks.servermodels.captcha
{
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class CaptchaParser
   {
      public function CaptchaParser()
      {
         super();
      }
      
      public static function parse(param1:Vector.<int>, param2:Function, param3:CaptchaLocation) : void
      {
         var loader:Loader = null;
         var onBitmapParsedHandler:Function = null;
         var location:CaptchaLocation = null;
         loader = null;
         var captcha:Vector.<int> = param1;
         onBitmapParsedHandler = param2;
         location = param3;
         var byteArray:ByteArray = new ByteArray();
         var i:int = 0;
         while(i < captcha.length)
         {
            byteArray.writeByte(captcha[i]);
            i++;
         }
         loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            onBitmapParsedHandler.apply(null,[loader.content as Bitmap,location]);
            (param1.target as EventDispatcher).removeEventListener(param1.type,arguments.callee);
         });
         loader.loadBytes(byteArray);
      }
   }
}


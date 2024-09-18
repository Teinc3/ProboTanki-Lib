package Renamed464
{
   import alternativa.tanks.model.shop.ShopModel;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import Renamed385.Renamed4886;
   
   public class Renamed9292 extends Renamed4886
   {
      private static var Renamed9293:ShopModel;
      
      public var modelId:int;
      
      public function Renamed9292()
      {
         super();
         this.modelId = 16;
         Renamed9293 = new ShopModel();
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9281.Renamed9282:
               this.Renamed2227();
               break;
            case Renamed9281.Renamed9286:
               this.Renamed2229();
               break;
            case Renamed9281.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed9281.Renamed9285:
               this.Renamed9294(param1);
         }
      }
      
      private function Renamed2227() : void
      {
         Renamed9293.Renamed2227();
      }
      
      private function Renamed2229() : void
      {
         Renamed9293.Renamed2229();
      }
      
      private function Renamed5162(param1:Object) : void
      {
         Renamed9293.init(param1.data);
      }
      
      private function Renamed9294(param1:Object) : void
      {
         var _loc2_:URLRequest = new URLRequest();
         _loc2_.url = param1.url;
         navigateToURL(_loc2_,"_blank");
      }
   }
}


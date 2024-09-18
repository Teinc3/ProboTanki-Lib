package Renamed214
{
   import alternativa.types.Long;
   import Renamed61.Renamed62;
   import Renamed385.Renamed4886;
   import Renamed68.Renamed69;
   
   public class Renamed6229 extends Renamed4886
   {
      private var Renamed6230:Renamed62;
      
      private var Renamed113:Renamed69;
      
      public var modelId:int;
      
      public function Renamed6229()
      {
         super();
         this.modelId = 65;
         this.Renamed6230 = Renamed62(modelRegistry.getModel(Long.getLong(118876660,-1267889929)));
         this.Renamed113 = Renamed69(modelRegistry.getModel(Long.getLong(1634943251,-386616582)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6231.Renamed6232:
               this.Renamed6233(param1);
               break;
            case Renamed6231.Renamed6234:
               this.Renamed6235(param1);
               break;
            case Renamed6231.Renamed6236:
               this.Renamed6237(param1);
         }
      }
      
      private function Renamed6233(param1:Object) : void
      {
         this.Renamed6230.Renamed6233(Renamed2775.Renamed695(param1.uid));
      }
      
      private function Renamed6235(param1:Object) : void
      {
         this.Renamed113.Renamed6235(param1.text,param1.uid);
      }
      
      private function Renamed6237(param1:Object) : void
      {
         this.Renamed113.Renamed6237(null,param1.text,param1.sound);
      }
   }
}


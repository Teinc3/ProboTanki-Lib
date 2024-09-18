package Renamed389
{
   import alternativa.types.Long;
   import Renamed63.Renamed64;
   import Renamed385.Renamed4886;
   
   public class Renamed8408 extends Renamed4886
   {
      private var Renamed108:Renamed64;
      
      public var modelId:int;
      
      public function Renamed8408()
      {
         super();
         this.modelId = 53;
         this.Renamed108 = Renamed64(modelRegistry.getModel(Long.getLong(592429654,1339096271)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8404.Renamed6870:
               this.Renamed4934(param1);
               break;
            case Renamed8404.Renamed6871:
               this.fire(param1);
         }
      }
      
      private function Renamed4934(param1:Object) : void
      {
         this.Renamed108.Renamed4934(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function fire(param1:Object) : void
      {
         this.Renamed108.fire(Renamed2775.Renamed695(param1.shooter),param1.shotDirectionX,param1.shotDirectionY,param1.shotDirectionZ);
      }
   }
}


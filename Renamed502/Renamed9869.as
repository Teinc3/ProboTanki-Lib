package Renamed502
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import Renamed443.Renamed4480;
   
   public class Renamed9869 extends Renamed4886
   {
      private var Renamed9870:Renamed4480;
      
      public var modelId:int;
      
      public function Renamed9869()
      {
         super();
         this.modelId = 26;
         this.Renamed9870 = Renamed4480(modelRegistry.getModel(Long.getLong(0,300070017)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9871.Renamed9872:
               this.Renamed7821(param1);
         }
      }
      
      private function Renamed7821(param1:Object) : void
      {
         this.Renamed9870.Renamed7821(param1.timeLeftInSec);
      }
   }
}


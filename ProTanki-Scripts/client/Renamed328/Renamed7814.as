package Renamed328
{
   import Renamed218.Renamed4802;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed7814 extends Renamed4886
   {
      private var Renamed7815:Renamed4802;
      
      public var modelId:int;
      
      public function Renamed7814()
      {
         super();
         this.modelId = 72;
         this.Renamed7815 = Renamed4802(modelRegistry.getModel(Long.getLong(1118509469,-35521391)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7812.Renamed7813:
               this.Renamed6044(param1);
         }
      }
      
      private function Renamed6044(param1:Object) : void
      {
         this.Renamed7815.Renamed6044(param1.lifeTimeInSecondsFromCurrentDateTime,param1.crystalBonusInPercent,param1.scoreBonusInPercent);
      }
   }
}


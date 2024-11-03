package Renamed377
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import projects.tanks.clients.flash.commons.models.battlelinkactivator.BattleLinkActivatorModel;
   
   public class Renamed8324 extends Renamed4886
   {
      private var Renamed8325:BattleLinkActivatorModel;
      
      public var modelId:int;
      
      public function Renamed8324()
      {
         super();
         this.modelId = 14;
         this.Renamed8325 = BattleLinkActivatorModel(modelRegistry.getModel(Long.getLong(0,300070009)));
         this.Renamed8325.objectLoaded();
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8317.Renamed8320:
               this.alive(param1);
               break;
            case Renamed8317.Renamed8318:
               this.dead(param1);
         }
      }
      
      private function alive(param1:Object) : void
      {
         this.Renamed8325.alive(param1.battleId);
      }
      
      private function dead(param1:Object) : void
      {
         this.Renamed8325.dead(param1.battleId);
      }
   }
}


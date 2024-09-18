package §function set true§
{
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import projects.tanks.clients.flash.commons.models.battlelinkactivator.BattleLinkActivatorModel;
   
   public class §case var get§ extends §return package if§
   {
      private var §?M§:BattleLinkActivatorModel;
      
      public var modelId:int;
      
      public function §case var get§()
      {
         super();
         this.modelId = 14;
         this.§?M§ = BattleLinkActivatorModel(modelRegistry.getModel(Long.getLong(0,300070009)));
         this.§?M§.objectLoaded();
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §'#v§.§function for finally§:
               this.alive(param1);
               break;
            case §'#v§.§var var get§:
               this.dead(param1);
         }
      }
      
      private function alive(param1:Object) : void
      {
         this.§?M§.alive(param1.battleId);
      }
      
      private function dead(param1:Object) : void
      {
         this.§?M§.dead(param1.battleId);
      }
   }
}


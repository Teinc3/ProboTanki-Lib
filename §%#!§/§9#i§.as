package §%#!§
{
   import alternativa.tanks.model.garage.rankupsupplybonus.RankUpSupplyBonusModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.garage.rankupsupplybonus.RankUpSupplyBonusInfo;
   
   public class §9#i§ extends §return package if§
   {
      private var §;!Z§:RankUpSupplyBonusModel;
      
      public var modelId:int;
      
      public function §9#i§()
      {
         super();
         this.modelId = 66;
         this.§;!Z§ = RankUpSupplyBonusModel(modelRegistry.getModel(Long.getLong(0,300050085)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §package break§.§false for§:
               this.showRankUpSupplyBonusAlerts(param1);
         }
      }
      
      private function showRankUpSupplyBonusAlerts(param1:Object) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:RankUpSupplyBonusInfo = null;
         var _loc2_:Object = JSON.parse(param1.json);
         var _loc3_:Vector.<RankUpSupplyBonusInfo> = new Vector.<RankUpSupplyBonusInfo>();
         for each(_loc4_ in _loc2_.items)
         {
            (_loc5_ = new RankUpSupplyBonusInfo()).count = _loc4_.count;
            _loc5_.text = _loc4_.text;
            _loc5_.preview = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.preview)));
            _loc3_.push(_loc5_);
         }
         this.§;!Z§.showRankUpSupplyBonusAlerts(_loc3_);
      }
   }
}


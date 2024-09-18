package Renamed156
{
   import alternativa.tanks.model.garage.rankupsupplybonus.RankUpSupplyBonusModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.garage.rankupsupplybonus.RankUpSupplyBonusInfo;
   
   public class Renamed5192 extends Renamed4886
   {
      private var Renamed5193:RankUpSupplyBonusModel;
      
      public var modelId:int;
      
      public function Renamed5192()
      {
         super();
         this.modelId = 66;
         this.Renamed5193 = RankUpSupplyBonusModel(modelRegistry.getModel(Long.getLong(0,300050085)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed5194.Renamed5195:
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
         this.Renamed5193.showRankUpSupplyBonusAlerts(_loc3_);
      }
   }
}


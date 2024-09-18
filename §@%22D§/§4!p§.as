package §@"D§
{
   import alternativa.tanks.model.achievement.AchievementModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §4!p§ extends §return package if§
   {
      private var §for package with§:AchievementModel;
      
      public var modelId:int;
      
      public function §4!p§()
      {
         super();
         this.modelId = 67;
         this.§for package with§ = AchievementModel(modelRegistry.getModel(Long.getLong(0,300110001)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §26§.§<H§:
               this.activateAchievement(param1);
               break;
            case §26§.§@"o§:
               this.completeAchievement(param1);
               break;
            case §26§.§;!K§:
               this.§`#%§(param1);
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         this.§for package with§.putInitParams(param1.initParams);
         this.§for package with§.objectLoaded();
      }
      
      private function completeAchievement(param1:Object) : void
      {
         this.§for package with§.completeAchievement(param1.achievement,param1.message,0);
      }
      
      private function activateAchievement(param1:Object) : void
      {
         this.§for package with§.activateAchievement(param1.achievement);
      }
      
      private function setPanelPartition(param1:Object) : void
      {
         this.§for package with§.setPanelPartition(param1.partition);
      }
   }
}


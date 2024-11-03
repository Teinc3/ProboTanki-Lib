package Renamed7581
{
   import alternativa.tanks.model.achievement.AchievementModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed7587 extends Renamed4886
   {
      private var Renamed7588:AchievementModel;
      
      public var modelId:int;
      
      public function Renamed7587()
      {
         super();
         this.modelId = 67;
         this.Renamed7588 = AchievementModel(modelRegistry.getModel(Long.getLong(0,300110001)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7584.Renamed7585:
               this.activateAchievement(param1);
               break;
            case Renamed7584.Renamed7586:
               this.completeAchievement(param1);
               break;
            case Renamed7584.Renamed5161:
               this.Renamed5162(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed7588.putInitParams(param1.initParams);
         this.Renamed7588.objectLoaded();
      }
      
      private function completeAchievement(param1:Object) : void
      {
         this.Renamed7588.completeAchievement(param1.achievement,param1.message,0);
      }
      
      private function activateAchievement(param1:Object) : void
      {
         this.Renamed7588.activateAchievement(param1.achievement);
      }
      
      private function setPanelPartition(param1:Object) : void
      {
         this.Renamed7588.setPanelPartition(param1.partition);
      }
   }
}


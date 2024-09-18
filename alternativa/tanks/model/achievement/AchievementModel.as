package alternativa.tanks.model.achievement
{
   import alternativa.tanks.service.achievement.IAchievementService;
   import flash.geom.Point;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import projects.tanks.client.achievements.model.achievements.§null package extends§;
   import §set catch if§.§false var class§;
   import §set catch if§.§import var true§;
   
   public class AchievementModel extends §false var class§ implements §import var true§, IAchievement, IObjectLoadListener
   {
      [Inject]
      public static var achievementService:IAchievementService;
      
      public function AchievementModel()
      {
         super();
      }
      
      public function completeAchievement(param1:§null package extends§, param2:String, param3:int) : void
      {
         achievementService.completeAchievement(param1,param2,param3);
      }
      
      public function activateAchievement(param1:§null package extends§) : void
      {
         achievementService.activateAchievement(param1);
      }
      
      public function setPanelPartition(param1:int) : void
      {
         achievementService.setPanelPartition(param1);
      }
      
      public function setGarageBuyButtonTargetPoint(param1:Point) : void
      {
         achievementService.setGarageBuyButtonTargetPoint(param1);
      }
      
      public function setBattleStartButtonTargetPoint(param1:Point) : void
      {
         achievementService.setBattleStartButtonTargetPoint(param1);
      }
      
      public function setPaymentResumeButtonTargetPoint(param1:Point) : void
      {
         achievementService.setPaymentResumeButtonTargetPoint(param1);
      }
      
      public function hideAllBubbles(param1:Boolean) : void
      {
         achievementService.hideAllBubbles(param1);
      }
      
      public function showStartButtonHelper() : void
      {
         achievementService.showStartButtonHelper();
      }
      
      public function hideStartButtonHelper() : void
      {
         achievementService.hideStartButtonHelper();
      }
      
      public function privateAchievementBubbleIsNotNeededAnymore() : void
      {
         achievementService.privateAchievementBubbleIsNotNeededAnymore();
      }
      
      public function objectLoaded() : void
      {
         achievementService.§get const import§(getInitParam().§false catch super§);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}


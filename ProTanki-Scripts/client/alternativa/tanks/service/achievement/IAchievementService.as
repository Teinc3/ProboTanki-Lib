package alternativa.tanks.service.achievement
{
   import flash.geom.Point;
   import projects.tanks.client.achievements.model.achievements.Renamed2072;
   
   public interface IAchievementService
   {
      function setPanelPartition(param1:int) : void;
      
      function setGarageBuyButtonTargetPoint(param1:Point) : void;
      
      function setBattleStartButtonTargetPoint(param1:Point) : void;
      
      function setPaymentResumeButtonTargetPoint(param1:Point) : void;
      
      function hideAllBubbles(param1:Boolean) : void;
      
      function showStartButtonHelper() : void;
      
      function hideStartButtonHelper() : void;
      
      function privateAchievementBubbleIsNotNeededAnymore() : void;
      
      function completeAchievement(param1:Renamed2072, param2:String, param3:int) : void;
      
      function activateAchievement(param1:Renamed2072) : void;
      
      function Renamed2075(param1:Vector.<Renamed2072>) : void;
      
      function Renamed3607() : void;
      
      function Renamed3608() : void;
   }
}


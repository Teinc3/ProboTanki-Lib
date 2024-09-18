package alternativa.tanks.model.achievement
{
   import flash.geom.Point;
   
   public interface IAchievement
   {
      function setPanelPartition(param1:int) : void;
      
      function setGarageBuyButtonTargetPoint(param1:Point) : void;
      
      function setBattleStartButtonTargetPoint(param1:Point) : void;
      
      function setPaymentResumeButtonTargetPoint(param1:Point) : void;
      
      function hideAllBubbles(param1:Boolean) : void;
      
      function showStartButtonHelper() : void;
      
      function hideStartButtonHelper() : void;
      
      function privateAchievementBubbleIsNotNeededAnymore() : void;
   }
}


package Renamed195
{
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import Renamed453.Renamed4748;
   import Renamed453.Renamed5930;
   
   public class Renamed4749 extends Renamed5930 implements Renamed4748, Renamed4750, IObjectLoadListener
   {
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      public function Renamed4749()
      {
         super();
      }
      
      public function getEnterPrice() : int
      {
         return getInitParam().proBattleEnterPrice;
      }
      
      public function getTimeLeftInSec() : int
      {
         if(getInitParam() == null)
         {
            return 0;
         }
         return getInitParam().timeLeftInSec;
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:Timer = null;
         var _loc2_:int = this.getTimeLeftInSec();
      }
      
      public function objectUnloaded() : void
      {
         var _loc1_:Timer = null;
         var _loc2_:int = this.getTimeLeftInSec();
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:Timer = null;
         var _loc3_:int = (getTimer() - int(getData(int))) / 1000;
         if(_loc3_ > this.getTimeLeftInSec())
         {
            _loc2_ = Timer(getData(Timer));
            _loc2_.removeEventListener(TimerEvent.TIMER,getFunctionWrapper(this.onTimer));
            _loc2_.stop();
            battleInfoFormService.Renamed3629();
         }
      }
   }
}


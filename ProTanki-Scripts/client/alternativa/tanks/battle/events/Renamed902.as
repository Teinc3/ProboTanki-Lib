package alternativa.tanks.battle.events
{
   import flash.utils.Dictionary;
   
   public class Renamed902 implements Renamed511
   {
      private var dispatcher:BattleEventDispatcher;
      
      private var listener:Renamed511;
      
      private var Renamed903:Dictionary;
      
      public function Renamed902(param1:BattleEventDispatcher, param2:Renamed511 = null)
      {
         this.Renamed903 = new Dictionary();
         super();
         this.dispatcher = param1;
         if(param2 == null)
         {
            param2 = this;
         }
         this.listener = param2;
      }
      
      public function Renamed904(param1:Class, param2:Function) : void
      {
         this.Renamed903[param1] = param2;
      }
      
      public function Renamed905() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.Renamed903)
         {
            this.dispatcher.Renamed539(_loc1_,this.listener);
         }
      }
      
      public function Renamed906() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.Renamed903)
         {
            this.dispatcher.Renamed866(_loc1_,this.listener);
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Function = this.Renamed903[param1.constructor];
         if(_loc2_ != null)
         {
            _loc2_(param1);
         }
      }
      
      public function dispatchEvent(param1:Object) : void
      {
         this.dispatcher.dispatchEvent(param1);
      }
   }
}


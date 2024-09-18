package alternativa.tanks.battle.events
{
   import flash.utils.Dictionary;
   
   public class §var use§ implements §throw package continue§
   {
      private var dispatcher:BattleEventDispatcher;
      
      private var listener:§throw package continue§;
      
      private var §+!"§:Dictionary;
      
      public function §var use§(param1:BattleEventDispatcher, param2:§throw package continue§ = null)
      {
         this.§+!"§ = new Dictionary();
         super();
         this.dispatcher = param1;
         if(param2 == null)
         {
            param2 = this;
         }
         this.listener = param2;
      }
      
      public function §#"<§(param1:Class, param2:Function) : void
      {
         this.§+!"§[param1] = param2;
      }
      
      public function §throw var set§() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.§+!"§)
         {
            this.dispatcher.§set for each§(_loc1_,this.listener);
         }
      }
      
      public function §#!V§() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.§+!"§)
         {
            this.dispatcher.§7!3§(_loc1_,this.listener);
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Function = this.§+!"§[param1.constructor];
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


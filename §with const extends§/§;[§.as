package §with const extends§
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.§include include§;
   import flash.utils.getTimer;
   
   public class §;[§ implements §8!X§
   {
      private var type:int;
      
      private var §false package include§:§#"5§;
      
      private var blinker:§include include§;
      
      private var §if for try§:int;
      
      public function §;[§(param1:int, param2:§#"5§, param3:§include include§, param4:int)
      {
         super();
         this.type = param1;
         this.§false package include§ = param2;
         this.blinker = param3;
         this.§if for try§ = param4;
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function start() : void
      {
         this.blinker.start(getTimer());
         this.§false package include§.§?#^§.visible = true;
         this.§false package include§.§?#^§.alpha = 1;
         this.§false package include§.§null catch extends§.visible = false;
         this.§false package include§.§if catch dynamic§.visible = true;
         this.§false package include§.§if catch dynamic§.alpha = 0;
      }
      
      public function stop() : void
      {
         this.blinker.stop();
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:Number = this.blinker.values[this.§if for try§];
         this.§false package include§.§?#^§.alpha = _loc3_;
         this.§false package include§.§if catch dynamic§.alpha = 1 - _loc3_;
      }
   }
}


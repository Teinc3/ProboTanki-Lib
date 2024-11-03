package Renamed460
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.Renamed2682;
   import flash.utils.getTimer;
   
   public class Renamed9144 implements Renamed9141
   {
      private var type:int;
      
      private var Renamed3328:Renamed2657;
      
      private var blinker:Renamed2682;
      
      private var Renamed9152:int;
      
      public function Renamed9144(param1:int, param2:Renamed2657, param3:Renamed2682, param4:int)
      {
         super();
         this.type = param1;
         this.Renamed3328 = param2;
         this.blinker = param3;
         this.Renamed9152 = param4;
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function start() : void
      {
         this.blinker.start(getTimer());
         this.Renamed3328.Renamed9139.visible = true;
         this.Renamed3328.Renamed9139.alpha = 1;
         this.Renamed3328.Renamed2695.visible = false;
         this.Renamed3328.Renamed9140.visible = true;
         this.Renamed3328.Renamed9140.alpha = 0;
      }
      
      public function stop() : void
      {
         this.blinker.stop();
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:Number = this.blinker.values[this.Renamed9152];
         this.Renamed3328.Renamed9139.alpha = _loc3_;
         this.Renamed3328.Renamed9140.alpha = 1 - _loc3_;
      }
   }
}


package Renamed460
{
   public class Renamed9142 implements Renamed9141
   {
      private var type:int;
      
      private var Renamed3328:Renamed2657;
      
      public function Renamed9142(param1:int, param2:Renamed2657)
      {
         super();
         this.type = param1;
         this.Renamed3328 = param2;
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function start() : void
      {
         this.Renamed3328.Renamed9139.visible = true;
         this.Renamed3328.Renamed9139.alpha = 1;
         this.Renamed3328.Renamed2695.visible = false;
         this.Renamed3328.Renamed9140.visible = false;
      }
      
      public function stop() : void
      {
      }
      
      public function update(param1:int, param2:int) : void
      {
      }
   }
}


package alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf
{
   public class Renamed2680
   {
      public var Renamed2684:uint;
      
      private var Renamed2696:Number;
      
      private var Renamed2697:Number;
      
      private var Renamed2698:Number;
      
      public function Renamed2680(param1:uint, param2:uint)
      {
         super();
         this.Renamed2684 = param1;
         this.Renamed2696 = (param2 >> 16 & 0xFF) - (param1 >> 16 & 0xFF);
         this.Renamed2697 = (param2 >> 8 & 0xFF) - (param1 >> 8 & 0xFF);
         this.Renamed2698 = (param2 & 0xFF) - (param1 & 0xFF);
      }
      
      public function interpolate(param1:Number) : uint
      {
         var _loc2_:int = (this.Renamed2684 >> 16 & 0xFF) + param1 * this.Renamed2696;
         var _loc3_:int = (this.Renamed2684 >> 8 & 0xFF) + param1 * this.Renamed2697;
         var _loc4_:int = (this.Renamed2684 & 0xFF) + param1 * this.Renamed2698;
         return _loc2_ << 16 | _loc3_ << 8 | _loc4_;
      }
   }
}


package Renamed465
{
   import assets.icons.BattleInfoIcons;
   
   public class Renamed9306 extends Renamed9310 implements Renamed2658
   {
      private static const Renamed2674:int = 21;
      
      private static const Renamed9311:int = 9;
      
      private var icon:BattleInfoIcons;
      
      public function Renamed9306()
      {
         super();
         this.icon = new BattleInfoIcons();
         this.icon.type = BattleInfoIcons.Renamed3958;
         addChild(this.icon);
         this.icon.y = Renamed9311;
      }
      
      override protected function calculateWidth() : int
      {
         var _loc1_:int = 5;
         var _loc2_:int = labelRed.width > Renamed2678.width ? int(labelRed.width) : int(Renamed2678.width);
         labelRed.x = _loc1_ + _loc1_ + (_loc2_ - labelRed.width >> 1);
         this.icon.x = labelRed.x + _loc2_ + _loc1_;
         Renamed2678.x = this.icon.x + Renamed2674 + _loc1_ + (_loc2_ - Renamed2678.width >> 1);
         return Renamed2678.x + _loc2_ + _loc1_ + _loc1_;
      }
   }
}


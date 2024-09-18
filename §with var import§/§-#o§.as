package §with var import§
{
   import assets.icons.BattleInfoIcons;
   
   public class §-#o§ extends §1#I§ implements §continue package var§
   {
      private static const §return catch package§:int = 17;
      
      private static const §super final§:int = 10;
      
      private var icon:BattleInfoIcons;
      
      public function §-#o§()
      {
         super();
         this.icon = new BattleInfoIcons();
         this.icon.type = BattleInfoIcons.KILL_LIMIT;
         addChild(this.icon);
         this.icon.y = §super final§;
      }
      
      override protected function calculateWidth() : int
      {
         var _loc1_:int = 5;
         var _loc2_:int = labelRed.width > §;!a§.width ? int(labelRed.width) : int(§;!a§.width);
         labelRed.x = _loc1_ + _loc1_ + (_loc2_ - labelRed.width >> 1);
         this.icon.x = labelRed.x + _loc2_ + _loc1_;
         §;!a§.x = this.icon.x + §return catch package§ + _loc1_ + (_loc2_ - §;!a§.width >> 1);
         return §;!a§.x + _loc2_ + _loc1_ + _loc1_;
      }
   }
}


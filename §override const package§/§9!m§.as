package §override const package§
{
   import §,#a§.§each package default§;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class §9!m§
   {
      private static const §do package override§:Class = §1"E§;
      
      private static const §]!y§:BitmapData = new §do package override§().bitmapData;
      
      private static const §%_§:Class = §native for case§;
      
      private static const §4#V§:BitmapData = new §%_§().bitmapData;
      
      private static const §0#3§:Class = §4!Y§;
      
      private static const §true try§:BitmapData = new §0#3§().bitmapData;
      
      private static const §'F§:Class = §const for get§;
      
      private static const §super null§:Dictionary = new Dictionary();
      
      private static const §6#z§:int = §true try§.width;
      
      private static const §for package include§:BitmapData = new §'F§().bitmapData;
      
      private static const §6L§:Dictionary = new Dictionary();
      
      §super null§[§each package default§.NEUTRAL] = §4#V§;
      §super null§[§each package default§.BLUE] = §]!y§;
      §super null§[§each package default§.RED] = §true try§;
      
      public function §9!m§()
      {
         super();
      }
      
      public static function §get catch with§(param1:§each package default§) : BitmapData
      {
         return §super null§[param1];
      }
      
      public static function §4!2§(param1:String) : BitmapData
      {
         var _loc2_:Number = param1.charCodeAt(0) - "A".charCodeAt(0);
         var _loc3_:BitmapData = §6L§[_loc2_];
         if(_loc3_ == null)
         {
            _loc3_ = new BitmapData(§6#z§,§for package include§.height,true,0);
            _loc3_.copyPixels(§for package include§,new Rectangle(_loc2_ * §6#z§,0,§6#z§,§for package include§.height),new Point());
            §6L§[_loc2_] = _loc3_;
         }
         return _loc3_;
      }
   }
}


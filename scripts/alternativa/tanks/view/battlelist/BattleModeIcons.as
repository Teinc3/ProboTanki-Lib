package alternativa.tanks.view.battlelist
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class BattleModeIcons
   {
      private static const dmIconClass:Class = BattleModeIcons_dmIconClass;
      
      private static const dmIconBitmapData:BitmapData = Bitmap(new dmIconClass()).bitmapData;
      
      private static const tdmIconClass:Class = BattleModeIcons_tdmIconClass;
      
      private static const tdmIconBitmapData:BitmapData = Bitmap(new tdmIconClass()).bitmapData;
      
      private static const ctfIconClass:Class = BattleModeIcons_ctfIconClass;
      
      private static const ctfIconBitmapData:BitmapData = Bitmap(new ctfIconClass()).bitmapData;
      
      private static const cpIconClass:Class = BattleModeIcons_cpIconClass;
      
      private static const cpIconBitmapData:BitmapData = Bitmap(new cpIconClass()).bitmapData;
      
      public function BattleModeIcons()
      {
         super();
      }
      
      public static function getIcon(param1:Renamed1587) : BitmapData
      {
         var _loc2_:BitmapData = null;
         switch(param1)
         {
            case Renamed1587.DM:
               _loc2_ = dmIconBitmapData;
               break;
            case Renamed1587.TDM:
               _loc2_ = tdmIconBitmapData;
               break;
            case Renamed1587.CTF:
               _loc2_ = ctfIconBitmapData;
               break;
            case Renamed1587.CP:
               _loc2_ = cpIconBitmapData;
         }
         return _loc2_;
      }
   }
}


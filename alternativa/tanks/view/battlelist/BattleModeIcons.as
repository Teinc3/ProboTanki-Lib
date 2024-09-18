package alternativa.tanks.view.battlelist
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import projects.tanks.client.battleservice.§final package import§;
   
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
      
      public static function getIcon(param1:§final package import§) : BitmapData
      {
         var _loc2_:BitmapData = null;
         switch(param1)
         {
            case §final package import§.DM:
               _loc2_ = dmIconBitmapData;
               break;
            case §final package import§.TDM:
               _loc2_ = tdmIconBitmapData;
               break;
            case §final package import§.CTF:
               _loc2_ = ctfIconBitmapData;
               break;
            case §final package import§.CP:
               _loc2_ = cpIconBitmapData;
         }
         return _loc2_;
      }
   }
}


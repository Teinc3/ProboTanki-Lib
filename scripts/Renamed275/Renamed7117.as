package Renamed4607
{
   import Renamed136.Renamed663;
   import Renamed17.MessageColor;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.utils.Dictionary;
   
   public class Renamed7117
   {
      public static const Renamed7118:Renamed4608 = new Renamed4608(MessageColor.Renamed5388,TextConst.TEXT_DOM_WE_CAPTURED_POINT);
      
      public static const Renamed7119:Renamed4608 = new Renamed4608(MessageColor.Renamed5389,TextConst.TEXT_DOM_ENEMIES_CAPTURED_POINT);
      
      public static const Renamed7120:Renamed4608 = new Renamed4608(MessageColor.Renamed5389,TextConst.TEXT_DOM_WE_LOST_POINT);
      
      public static const Renamed7121:Renamed4608 = new Renamed4608(MessageColor.Renamed5388,TextConst.TEXT_DOM_ENEMIES_LOST_POINT);
      
      private static const Renamed7122:Renamed4608 = new Renamed4608(MessageColor.BLUE,TextConst.TEXT_DOM_BLUE_CAPTURED_POINT);
      
      private static const Renamed7123:Renamed4608 = new Renamed4608(MessageColor.RED,TextConst.TEXT_DOM_RED_CAPTURED_POINT);
      
      private static const Renamed7124:Dictionary = new Dictionary();
      
      private static const Renamed7125:Renamed4608 = new Renamed4608(MessageColor.BLUE,TextConst.TEXT_DOM_BLUE_LOST_POINT);
      
      private static const Renamed7126:Renamed4608 = new Renamed4608(MessageColor.RED,TextConst.TEXT_DOM_RED_LOST_POINT);
      
      private static const Renamed7127:Dictionary = new Dictionary();
      
      Renamed7124[Renamed663.BLUE] = Renamed7122;
      Renamed7124[Renamed663.RED] = Renamed7123;
      Renamed7127[Renamed663.BLUE] = Renamed7125;
      Renamed7127[Renamed663.RED] = Renamed7126;
      
      public function Renamed7117()
      {
         super();
      }
      
      public static function Renamed7128(param1:Renamed663) : Renamed4608
      {
         return Renamed7124[param1];
      }
      
      public static function Renamed7129(param1:Renamed663) : Renamed4608
      {
         return Renamed7127[param1];
      }
   }
}


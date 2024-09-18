package Renamed17
{
   import Renamed136.Renamed663;
   
   public class MessageColor
   {
      public static const Renamed5388:uint = 65280;
      
      public static const Renamed5389:uint = 16776960;
      
      public static const BLUE:uint = 4691967;
      
      public static const RED:uint = 15741974;
      
      public static const DEFAULT:uint = 65280;
      
      public static const YELLOW:uint = 16776960;
      
      public static const Renamed5390:uint = 16750081;
      
      public static const WHITE:uint = 14540253;
      
      public function MessageColor()
      {
         super();
      }
      
      public static function Renamed5391(param1:Renamed663) : uint
      {
         switch(param1)
         {
            case Renamed663.BLUE:
               return MessageColor.BLUE;
            case Renamed663.RED:
               return MessageColor.RED;
            default:
               return MessageColor.DEFAULT;
         }
      }
      
      public static function Renamed2649(param1:Renamed663, param2:Boolean) : uint
      {
         if(param2)
         {
            return MessageColor.YELLOW;
         }
         switch(param1)
         {
            case Renamed663.BLUE:
               return MessageColor.BLUE;
            case Renamed663.RED:
               return MessageColor.RED;
            default:
               return MessageColor.DEFAULT;
         }
      }
      
      public static function Renamed2650(param1:Renamed663, param2:Boolean, param3:Boolean) : uint
      {
         if(!param2)
         {
            return MessageColor.WHITE;
         }
         if(param3)
         {
            return 16777071;
         }
         switch(param1)
         {
            case Renamed663.BLUE:
               return 10013694;
            case Renamed663.RED:
               return 16685208;
            default:
               return MessageColor.DEFAULT;
         }
      }
      
      public static function Renamed5392(param1:uint) : Boolean
      {
         return param1 == MessageColor.BLUE || param1 == MessageColor.RED;
      }
   }
}


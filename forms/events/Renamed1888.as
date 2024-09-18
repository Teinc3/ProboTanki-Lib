package forms.events
{
   import flash.events.Event;
   
   public class Renamed1888 extends Event
   {
      public static const Renamed4051:String = "StatListUpdate";
      
      public static const Renamed1891:String = "StatListUpdateSort";
      
      public var Renamed4052:int = 0;
      
      public var Renamed4053:int = 0;
      
      public var Renamed1893:int;
      
      public function Renamed1888(param1:String, param2:int, param3:int, param4:int = 1)
      {
         super(param1,true,false);
         this.Renamed4052 = param2;
         this.Renamed4053 = param3;
         this.Renamed1893 = param4;
      }
   }
}


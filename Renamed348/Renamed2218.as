package Renamed348
{
   import flash.events.Event;
   
   public class Renamed2218 extends Event
   {
      public static const EVENT_TYPE:String = "ShopItemChosenEVENT";
      
      public var item:String;
      
      public function Renamed2218(param1:String)
      {
         super(EVENT_TYPE,true);
         this.item = param1;
      }
   }
}


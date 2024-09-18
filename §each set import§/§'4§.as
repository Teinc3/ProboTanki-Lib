package §each set import§
{
   import flash.events.Event;
   
   public class §'4§ extends Event
   {
      public static const EVENT_TYPE:String = "ShopItemChosenEVENT";
      
      public var item:String;
      
      public function §'4§(param1:String)
      {
         super(EVENT_TYPE,true);
         this.item = param1;
      }
   }
}


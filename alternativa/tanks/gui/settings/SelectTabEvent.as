package alternativa.tanks.gui.settings
{
   import flash.events.Event;
   
   public class SelectTabEvent extends Event
   {
      public static var Renamed1957:String = "SelectTabEvent";
      
      private var selectedCategory:Renamed1958;
      
      public function SelectTabEvent(param1:Renamed1958)
      {
         super(Renamed1957);
         this.selectedCategory = param1;
      }
      
      public function getSelectedCategory() : Renamed1958
      {
         return this.selectedCategory;
      }
   }
}


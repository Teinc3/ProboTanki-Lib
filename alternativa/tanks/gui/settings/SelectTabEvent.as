package alternativa.tanks.gui.settings
{
   import flash.events.Event;
   
   public class SelectTabEvent extends Event
   {
      public static var §@=§:String = "SelectTabEvent";
      
      private var selectedCategory:§const const const§;
      
      public function SelectTabEvent(param1:§const const const§)
      {
         super(§@=§);
         this.selectedCategory = param1;
      }
      
      public function getSelectedCategory() : §const const const§
      {
         return this.selectedCategory;
      }
   }
}


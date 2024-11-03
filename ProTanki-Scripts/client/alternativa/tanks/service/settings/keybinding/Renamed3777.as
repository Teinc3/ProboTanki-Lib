package alternativa.tanks.service.settings.keybinding
{
   import flash.events.Event;
   
   public class Renamed3777 extends Event
   {
      public static const Renamed3778:String = "action changed: ";
      
      private var Renamed3784:Renamed717;
      
      public function Renamed3777(param1:String, param2:Renamed717)
      {
         super(param1,true,false);
         this.Renamed3784 = param2;
      }
      
      public function Renamed35() : Renamed717
      {
         return this.Renamed3784;
      }
   }
}


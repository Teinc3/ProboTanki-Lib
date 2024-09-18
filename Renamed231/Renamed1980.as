package Renamed231
{
   import alternativa.tanks.gui.settings.Renamed1958;
   import controls.buttons.Renamed3994;
   
   public class Renamed1980 extends Renamed3994
   {
      private var category:Renamed1958;
      
      public function Renamed1980(param1:Renamed1958, param2:String, param3:Class)
      {
         super(param2,param3);
         this.category = param1;
      }
      
      public function getCategory() : Renamed1958
      {
         return this.category;
      }
   }
}


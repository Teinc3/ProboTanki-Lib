package Renamed447
{
   import Renamed280.Renamed3291;
   import alternativa.tanks.models.weapon.shaft.Renamed3208;
   
   public class Renamed3302 implements Renamed3291
   {
      private var weapon:Renamed3208;
      
      public function Renamed3302(param1:Renamed3208)
      {
         super();
         this.weapon = param1;
      }
      
      public function execute(param1:*) : void
      {
         if(param1)
         {
            this.weapon.Renamed3224();
         }
      }
   }
}


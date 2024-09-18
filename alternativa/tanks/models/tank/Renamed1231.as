package alternativa.tanks.models.tank
{
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed918;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import Renamed456.Renamed924;
   
   public class Renamed1231
   {
      private var Renamed3008:Renamed2707;
      
      private var Renamed3009:Renamed2717;
      
      public function Renamed1231()
      {
         this.Renamed3008 = new Renamed2707();
         this.Renamed3009 = new Renamed2717();
         super();
      }
      
      public function Renamed996(param1:Tanks3DSResource) : Renamed918
      {
         return this.Renamed3008.Renamed2709(param1);
      }
      
      public function Renamed1057(param1:Tanks3DSResource) : Renamed924
      {
         return this.Renamed3009.Renamed2719(param1);
      }
   }
}


package alternativa.tanks.models.tank
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.Renamed768;
   
   public class Renamed2816 implements Renamed768
   {
      private var Renamed2802:int;
      
      private var user:ClientObject;
      
      public function Renamed2816(param1:int, param2:ClientObject)
      {
         super();
         this.Renamed2802 = param1;
         this.user = param2;
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(param1 > this.Renamed2802)
         {
            Renamed2407(OSGi.getInstance().getService(Renamed2408)).onReadyToActivate();
         }
      }
   }
}


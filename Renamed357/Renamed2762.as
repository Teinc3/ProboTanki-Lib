package Renamed357
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed2762 implements Renamed2764, AutoClosable
   {
      private var Renamed3695:Tank;
      
      public function Renamed2762(param1:Tank)
      {
         super();
         this.Renamed3695 = param1;
      }
      
      public function handleReadyToSpawn() : void
      {
         var _loc1_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         _loc1_.Renamed2861(this.Renamed3695);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed3695 = null;
      }
   }
}


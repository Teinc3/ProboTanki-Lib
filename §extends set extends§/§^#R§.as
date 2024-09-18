package §extends set extends§
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §^#R§ implements §import set finally§, AutoClosable
   {
      private var §false use§:Tank;
      
      public function §^#R§(param1:Tank)
      {
         super();
         this.§false use§ = param1;
      }
      
      public function handleReadyToSpawn() : void
      {
         var _loc1_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         _loc1_.§1"]§(this.§false use§);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.§false use§ = null;
      }
   }
}


package §+!e§
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.objects.tank.§<"]§;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.tank.§function package while§;
   import flash.events.Event;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §]#E§ implements AutoClosable
   {
      [Inject]
      public static var display:IDisplay;
      
      private var §use var class§:ClientObject;
      
      public function §]#E§(param1:ClientObject)
      {
         super();
         this.§use var class§ = param1;
         display.stage.addEventListener(Event.ACTIVATE,this.§9#7§);
         display.stage.addEventListener(Event.DEACTIVATE,this.§else set class§);
      }
      
      private function §9#7§(param1:Event) : void
      {
         var _loc2_:§function package while§ = this.§set set super§();
         _loc2_.§9!-§(§<"]§.CLIENT);
      }
      
      private function §else set class§(param1:Event) : void
      {
         var _loc2_:§function package while§ = this.§set set super§();
         _loc2_.§-!e§(§<"]§.CLIENT,true);
      }
      
      private function §set set super§() : §function package while§
      {
         var _loc1_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         return _loc1_.§set set super§(this.§use var class§);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.§use var class§ = null;
         display.stage.removeEventListener(Event.ACTIVATE,this.§9#7§);
         display.stage.removeEventListener(Event.DEACTIVATE,this.§else set class§);
      }
   }
}


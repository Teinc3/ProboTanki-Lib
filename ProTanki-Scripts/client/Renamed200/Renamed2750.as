package Renamed200
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.objects.tank.Renamed1140;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.tank.Renamed2712;
   import flash.events.Event;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed2750 implements AutoClosable
   {
      [Inject]
      public static var display:IDisplay;
      
      private var Renamed6000:ClientObject;
      
      public function Renamed2750(param1:ClientObject)
      {
         super();
         this.Renamed6000 = param1;
         display.stage.addEventListener(Event.ACTIVATE,this.Renamed6001);
         display.stage.addEventListener(Event.DEACTIVATE,this.Renamed3405);
      }
      
      private function Renamed6001(param1:Event) : void
      {
         var _loc2_:Renamed2712 = this.Renamed2898();
         _loc2_.Renamed2714(Renamed1140.CLIENT);
      }
      
      private function Renamed3405(param1:Event) : void
      {
         var _loc2_:Renamed2712 = this.Renamed2898();
         _loc2_.Renamed2713(Renamed1140.CLIENT,true);
      }
      
      private function Renamed2898() : Renamed2712
      {
         var _loc1_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         return _loc1_.Renamed2898(this.Renamed6000);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed6000 = null;
         display.stage.removeEventListener(Event.ACTIVATE,this.Renamed6001);
         display.stage.removeEventListener(Event.DEACTIVATE,this.Renamed3405);
      }
   }
}


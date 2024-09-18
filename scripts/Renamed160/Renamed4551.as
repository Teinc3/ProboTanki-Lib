package Renamed4548
{
   import Renamed1.Renamed4603;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed1442;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.types.Long;
   import Renamed344.Renamed4664;
   import Renamed344.Renamed5247;
   import flash.media.Sound;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed4551 extends Renamed5247 implements Renamed4664, Renamed4552
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var listener:Renamed4550;
      
      private var Renamed5248:int;
      
      public function Renamed4551()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         if(this.listener == null)
         {
            this.listener = new Renamed4550(null);
         }
         ++this.Renamed5248;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         --this.Renamed5248;
         if(this.Renamed5248 == 0)
         {
            this.listener.close();
            this.listener = null;
         }
      }
      
      public function Renamed5246(param1:Tank, param2:int) : void
      {
         var _loc3_:Tank = param1;
         if(_loc3_.state == Renamed841.DEAD)
         {
            this.Renamed5249(param1.Renamed695(),param2);
         }
         else
         {
            this.Renamed5250(_loc3_,param2);
         }
      }
      
      private function Renamed5249(param1:ClientObject, param2:int) : void
      {
         var _loc3_:Renamed4549 = new Renamed4549(param1,param2);
         param1.putParams(Renamed4549,_loc3_);
      }
      
      private function Renamed5250(param1:Tank, param2:int) : void
      {
         var _loc3_:Renamed4603 = new Renamed4603();
         _loc3_.Renamed5251(param1,param2);
         this.Renamed5252(param1);
      }
      
      private function Renamed5252(param1:Tank) : void
      {
         var _loc2_:Sound = null;
         var _loc3_:Renamed1442 = null;
         var _loc4_:Body = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Renamed1441 = null;
         var _loc7_:Sound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,158174))).sound;
         if(_loc7_ != null)
         {
            _loc2_ = _loc7_;
            _loc3_ = Renamed1442.create(_loc2_);
            _loc4_ = param1.Renamed696();
            _loc5_ = _loc4_.state.position.clone();
            _loc6_ = Renamed1441.create(_loc5_,_loc3_,0,0);
            battleService.Renamed637(_loc6_);
         }
      }
   }
}


package Renamed364
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed2;
   import Renamed1.Renamed609;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.types.Long;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed2765 implements Renamed609
   {
      private static var Renamed2797:IModelService = IModelService(OSGi.getInstance().getService(IModelService));
      
      private var tankData:Renamed775;
      
      private var time:int;
      
      private var Renamed3363:Boolean;
      
      public function Renamed2765(param1:Renamed775)
      {
         super();
         this.tankData = param1;
      }
      
      public function destroy() : void
      {
         this.tankData = null;
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.Renamed3363)
         {
            return false;
         }
         if(this.time >= 0)
         {
            this.Renamed8202();
            return false;
         }
         this.time += param1;
         return true;
      }
      
      public function kill() : void
      {
         this.Renamed3363 = true;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.time = 0;
         this.Renamed3363 = false;
      }
      
      private function Renamed8202() : void
      {
         var _loc1_:Tank = null;
         var _loc2_:Renamed4676 = null;
         try
         {
            _loc1_ = this.tankData.tank;
            _loc1_.Renamed696().clearAccumulators();
            _loc1_.Renamed1075().Renamed1266();
            _loc1_.Renamed696().state.velocity.z = _loc1_.Renamed696().state.velocity.z + 500;
            _loc1_.Renamed696().state.angularVelocity.reset(2,2,2);
            _loc2_ = Renamed4676(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(1983242842,420087132)));
            _loc2_.Renamed3472(null,this.tankData.tank,Renamed2.Renamed6915);
         }
         catch(e:Error)
         {
         }
      }
   }
}


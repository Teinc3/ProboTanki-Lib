package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Shadow;
   import alternativa.tanks.utils.MathUtils;
   import flash.utils.Dictionary;
   
   public class Renamed1322
   {
      private static const Renamed1323:Number = 7000;
      
      private static const Renamed1324:Number = 4000;
      
      private static const Renamed1325:Number = 2000;
      
      private static const Renamed1326:Number = 1000;
      
      private static const Renamed1327:Number = 0.01;
      
      private static const Renamed1328:Number = 60;
      
      private static const Renamed1329:Number = 20;
      
      private var camera:Camera3D;
      
      private var nearDistance:Number = 4000;
      
      private var farDistance:Number = 7000;
      
      private var enabled:Boolean;
      
      private var color:int;
      
      private var alpha:Number = 0.85;
      
      public function Renamed1322(param1:Camera3D)
      {
         this.shadows = new Dictionary();
         super();
         this.camera = param1;
         this.Renamed1330();
      }
      
      public function setup(param1:int) : void
      {
         this.color = param1;
      }
      
      public function add(param1:Shadow) : void
      {
         param1.color = this.color;
         param1.alpha = this.alpha;
         param1.nearDistance = this.nearDistance;
         param1.farDistance = this.farDistance;
         this.shadows[param1] = true;
         if(this.enabled)
         {
            this.camera.addShadow(param1);
         }
      }
      
      public function remove(param1:Shadow) : void
      {
         delete this.shadows[param1];
         if(this.enabled)
         {
            this.camera.removeShadow(param1);
         }
      }
      
      public function enable() : void
      {
         var _loc1_:* = undefined;
         if(!this.enabled)
         {
            this.enabled = true;
            for(_loc1_ in this.shadows)
            {
               this.camera.addShadow(_loc1_);
            }
         }
      }
      
      public function disable() : void
      {
         var _loc1_:* = undefined;
         if(this.enabled)
         {
            this.enabled = false;
            for(_loc1_ in this.shadows)
            {
               this.camera.removeShadow(_loc1_);
            }
         }
      }
      
      public function Renamed1331(param1:Number) : void
      {
         this.Renamed1332(param1);
         this.Renamed1333();
      }
      
      private function Renamed1332(param1:Number) : void
      {
         var _loc2_:Number = MathUtils.clamp((param1 - Renamed1329) / (Renamed1328 - Renamed1329),0,1);
         var _loc3_:Number = Renamed1326 + _loc2_ * (Renamed1324 - Renamed1326);
         this.nearDistance += (_loc3_ - this.nearDistance) * Renamed1327;
         var _loc4_:Number = Renamed1325 + _loc2_ * (Renamed1323 - Renamed1325);
         this.farDistance += (_loc4_ - this.farDistance) * Renamed1327;
      }
      
      private function Renamed1333() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = null;
         for(_loc2_ in this.shadows)
         {
            _loc2_.nearDistance = this.nearDistance;
            _loc2_.farDistance = this.farDistance;
         }
      }
      
      private function Renamed1330() : void
      {
      }
   }
}


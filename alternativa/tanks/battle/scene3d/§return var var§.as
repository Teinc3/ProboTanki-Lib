package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Shadow;
   import alternativa.tanks.utils.MathUtils;
   import flash.utils.Dictionary;
   
   public class §return var var§
   {
      private static const §class catch with§:Number = 7000;
      
      private static const §#"r§:Number = 4000;
      
      private static const §>V§:Number = 2000;
      
      private static const §+#o§:Number = 1000;
      
      private static const §2#E§:Number = 0.01;
      
      private static const §9"I§:Number = 60;
      
      private static const §0"z§:Number = 20;
      
      private var camera:Camera3D;
      
      private var nearDistance:Number = 4000;
      
      private var farDistance:Number = 7000;
      
      private var enabled:Boolean;
      
      private var color:int;
      
      private var alpha:Number = 0.85;
      
      public function §return var var§(param1:Camera3D)
      {
         this.shadows = new Dictionary();
         super();
         this.camera = param1;
         this.§while for const§();
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
      
      public function §throw set extends§(param1:Number) : void
      {
         this.§false for native§(param1);
         this.§throw catch break§();
      }
      
      private function §false for native§(param1:Number) : void
      {
         var _loc2_:Number = MathUtils.clamp((param1 - §0"z§) / (§9"I§ - §0"z§),0,1);
         var _loc3_:Number = §+#o§ + _loc2_ * (§#"r§ - §+#o§);
         this.nearDistance += (_loc3_ - this.nearDistance) * §2#E§;
         var _loc4_:Number = §>V§ + _loc2_ * (§class catch with§ - §>V§);
         this.farDistance += (_loc4_ - this.farDistance) * §2#E§;
      }
      
      private function §throw catch break§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = null;
         for(_loc2_ in this.shadows)
         {
            _loc2_.nearDistance = this.nearDistance;
            _loc2_.farDistance = this.farDistance;
         }
      }
      
      private function §while for const§() : void
      {
      }
   }
}


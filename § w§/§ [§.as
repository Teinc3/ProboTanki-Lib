package § w§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.display.BlendMode;
   
   public class § [§ extends §["D§ implements §finally const package§
   {
      private static const vector:Vector3 = new Vector3();
      
      private var §;"§:Sprite3D;
      
      private var delay:int;
      
      private var time:int;
      
      private var §do const throw§:Number;
      
      private var direction:Boolean;
      
      private var turret:Object3D;
      
      private var state:int;
      
      private var container:§6!<§;
      
      public function § [§(param1:§1Q§)
      {
         super(param1);
         this.§;"§ = new Sprite3D(10,10);
         this.§;"§.blendMode = BlendMode.ADD;
      }
      
      public function init(param1:int, param2:Number, param3:Number, param4:Boolean, param5:Object3D, param6:TextureMaterial) : void
      {
         this.delay = param1;
         this.§;"§.width = param2;
         this.§;"§.height = param2;
         this.§;"§.calculateBounds();
         this.§do const throw§ = param3;
         this.direction = param4;
         this.turret = param5;
         param6.resolution = 5;
         this.§;"§.material = param6;
         this.§;"§.scaleX = 1;
         this.§;"§.scaleY = 1;
         this.§;"§.scaleZ = 1;
         this.§;"§.rotation = 0;
         this.§;"§.alpha = 0;
         this.state = 0;
         this.§;"§.softAttenuation = 150;
         this.§;"§.depthMapAlphaThreshold = 2;
         this.§;"§.shadowMapAlphaThreshold = 2;
         this.§;"§.useShadowMap = false;
         this.§;"§.useLight = false;
         this.time = 0;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§;"§);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(this.state == 2)
         {
            return false;
         }
         var _loc6_:Number = 0.7 * 5;
         var _loc7_:Number = _loc6_ / 3;
         var _loc8_:Number = 0.2;
         _loc3_ = 300;
         vector.x = param2.x - this.turret.x;
         vector.y = param2.y - this.turret.y;
         vector.z = param2.z - this.turret.z;
         vector.normalize();
         vector.scale(_loc3_);
         this.§;"§.x = this.turret.x + vector.x;
         this.§;"§.y = this.turret.y + vector.y;
         this.§;"§.z = this.turret.z + vector.z + 30;
         this.time += param1;
         if(this.time >= this.delay)
         {
            if(this.direction)
            {
               this.§;"§.rotation += _loc8_ * param1 * 0.001;
            }
            else
            {
               this.§;"§.rotation -= _loc8_ * param1 * 0.001;
            }
            if(this.state == 0)
            {
               _loc4_ = _loc6_ * param1 * 0.001;
               this.§;"§.scaleX += _loc4_;
               this.§;"§.scaleY += _loc4_;
               this.§;"§.scaleZ += _loc4_;
               if(this.§;"§.scaleX > this.§do const throw§)
               {
                  this.§;"§.scaleX = this.§do const throw§;
                  this.§;"§.scaleY = this.§do const throw§;
                  this.§;"§.scaleZ = this.§do const throw§;
                  this.state = 1;
               }
               this.§;"§.alpha = (this.§;"§.scaleX - 1) / (this.§do const throw§ - 1);
            }
            else if(this.state == 1)
            {
               _loc5_ = _loc7_ * param1 * 0.001;
               this.§;"§.scaleX -= _loc5_;
               this.§;"§.scaleY -= _loc5_;
               this.§;"§.scaleZ -= _loc5_;
               if(this.§;"§.scaleX < 1)
               {
                  this.§;"§.scaleX = 1;
                  this.§;"§.scaleY = 1;
                  this.§;"§.scaleZ = 1;
                  this.state = 2;
               }
               this.§;"§.alpha = (this.§;"§.scaleX - 1) / (this.§do const throw§ - 1) - 0.1;
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.§;"§);
         this.container = null;
         this.§;"§.material = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.state = 2;
         this.§;"§.alpha = 0;
      }
   }
}


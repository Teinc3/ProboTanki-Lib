package §7"j§
{
   import §-!!§.§6!<§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.lights.TubeLight;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class § "d§ extends §["D§ implements §finally const package§
   {
      private static const §1#P§:Number = 1.5;
      
      private static const position:Vector3 = new Vector3();
      
      private static const §][§:Vector3 = new Vector3();
      
      private var light:TubeLight;
      
      private var §true var var§:§super const class§;
      
      private var §while catch§:§super const class§;
      
      private var animation:§include finally§;
      
      private var currentTime:int;
      
      private var §null package implements§:int;
      
      private var §#![§:Boolean;
      
      private var alive:Boolean;
      
      private var target:Object3D;
      
      private var container:§6!<§;
      
      public function § "d§(param1:§1Q§)
      {
         super(param1);
         this.light = new TubeLight(0,0,0,0,0);
         this.target = new Object3D();
      }
      
      public function init(param1:§super const class§, param2:§super const class§, param3:§include finally§, param4:Boolean = false) : void
      {
         this.§>X§(param1,param2,param3.§dynamic var function§(),param3,param4);
      }
      
      public function §>X§(param1:§super const class§, param2:§super const class§, param3:int, param4:§include finally§, param5:Boolean = false) : void
      {
         this.§true var var§ = param1;
         this.§while catch§ = param2;
         this.§null package implements§ = param3;
         this.currentTime = 0;
         this.animation = param4;
         this.§#![§ = param5;
         this.alive = true;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.light);
         param1.addChild(this.target);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.alive)
         {
            this.animation.§ !Z§(this.light,this.currentTime,this.§null package implements§);
            this.§true var var§.§'!g§(this.light,param2,param1);
            this.§while catch§.§'!g§(this.target,param2,param1);
            this.currentTime += param1;
            position.x = this.light.x;
            position.y = this.light.y;
            position.z = this.light.z;
            §][§.x = this.target.x;
            §][§.y = this.target.y;
            §][§.z = this.target.z;
            _loc3_ = Vector3.distanceBetween(position,§][§);
            _loc4_ = param2.farClipping / §1#P§;
            _loc3_ = _loc3_ > _loc4_ ? Number(_loc4_) : Number(_loc3_);
            this.light.length = _loc3_;
            if(this.currentTime > this.§null package implements§)
            {
               if(this.§#![§)
               {
                  this.currentTime %= this.§null package implements§;
               }
               else
               {
                  this.alive = false;
               }
            }
            this.light.lookAt(this.target.x,this.target.y,this.target.z);
            this.light.falloff = this.light.attenuationEnd - this.light.attenuationBegin;
            return this.alive;
         }
         return false;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.light);
         this.container.removeChild(this.target);
         this.container = null;
         this.animation = null;
         this.§true var var§ = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
   }
}


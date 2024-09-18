package §7"j§
{
   import §-!!§.§6!<§;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public final class §while var if§ extends §["D§ implements §finally const package§
   {
      public static const §?D§:Number = 99999;
      
      private var light:OmniLight;
      
      private var §true var var§:§super const class§;
      
      private var animation:§include finally§;
      
      private var currentTime:int;
      
      private var §null package implements§:int;
      
      private var §#![§:Boolean;
      
      private var alive:Boolean;
      
      private var §1#0§:Number;
      
      private var §in for include§:Number;
      
      private var position:Vector3;
      
      private var container:§6!<§;
      
      public function §while var if§(param1:§1Q§)
      {
         this.position = new Vector3();
         super(param1);
         this.light = new OmniLight(0,0,0);
      }
      
      public function init(param1:§super const class§, param2:§include finally§, param3:Number = 99999, param4:Boolean = false) : void
      {
         this.§>X§(param1,param2.§dynamic var function§(),param2,param3,param4);
      }
      
      public function §>X§(param1:§super const class§, param2:int, param3:§include finally§, param4:Number = 99999, param5:Boolean = false) : void
      {
         this.§true var var§ = param1;
         this.§null package implements§ = param2;
         this.currentTime = 0;
         this.animation = param3;
         this.§#![§ = param5;
         this.alive = true;
         this.§1#0§ = param4;
         this.§in for include§ = param4 / 4 * 3;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.light);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.alive)
         {
            this.animation.§ !Z§(this.light,this.currentTime,this.§null package implements§);
            this.§true var var§.§'!g§(this.light,param2,param1);
            this.currentTime += param1;
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
            this.position.x = this.light.x;
            this.position.y = this.light.y;
            this.position.z = this.light.z;
            _loc3_ = Vector3.distanceBetween(this.position,param2.position);
            if(_loc3_ > this.§in for include§)
            {
               _loc4_ = 1 - (_loc3_ - this.§in for include§) / (this.§1#0§ - this.§in for include§);
               this.light.intensity *= _loc4_;
               this.light.visible = _loc3_ < this.§1#0§;
            }
            return this.alive;
         }
         return false;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.light);
         this.container = null;
         this.animation = null;
         this.§true var var§.destroy();
         this.§true var var§ = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
   }
}


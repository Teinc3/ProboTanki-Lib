package §7"j§
{
   import §-!!§.§6!<§;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.engine3d.§7J§;
   import alternativa.tanks.engine3d.§throw const switch§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.geom.ColorTransform;
   
   public class §extends package switch§ extends §["D§ implements §finally const package§
   {
      private static const §null package static§:Vector3 = new Vector3();
      
      private var sprite:§7J§;
      
      private var currentFrame:Number;
      
      private var §@#1§:Number;
      
      private var §=![§:int;
      
      private var §true var var§:§super const class§;
      
      private var §'#F§:Number;
      
      private var §set var package§:Number;
      
      private var alphaMultiplier:Number;
      
      private var container:§6!<§;
      
      public function §extends package switch§(param1:§1Q§)
      {
         super(param1);
         this.sprite = new §7J§(1,1);
      }
      
      public function init(param1:Number, param2:Number, param3:§throw const switch§, param4:Number, param5:§super const class§, param6:Number = 0.5, param7:Number = 0.5, param8:ColorTransform = null, param9:Number = 130, param10:String = "normal", param11:Number = 1000000, param12:Number = 1000000, param13:Number = 1, param14:Boolean = false) : void
      {
         this.alphaMultiplier = param13;
         this.§static var native§(param1,param2,param4,param6,param7,param8,param3,param9,param10);
         this.§'#F§ = param11;
         this.§set var package§ = param12;
         param5.§do package use§(this.sprite);
         this.§@#1§ = 0.001 * param3.fps;
         this.§true var var§ = param5;
         this.currentFrame = 0;
         this.§=![§ = 1;
         this.sprite.useShadowMap = param14;
         this.sprite.useLight = param14;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.sprite);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         this.sprite.§true const switch§(this.currentFrame);
         this.currentFrame += param1 * this.§@#1§;
         this.§true var var§.§'!g§(this.sprite,param2,param1);
         if(this.§=![§ > 0 && this.currentFrame >= this.sprite.getNumFrames())
         {
            --this.§=![§;
            if(this.§=![§ == 0)
            {
               return false;
            }
            this.currentFrame -= this.sprite.getNumFrames();
         }
         §null package static§.x = this.sprite.x;
         §null package static§.y = this.sprite.y;
         §null package static§.z = this.sprite.z;
         var _loc3_:Number = §null package static§.distanceTo(param2.position);
         if(_loc3_ > this.§set var package§)
         {
            this.sprite.visible = false;
         }
         else
         {
            this.sprite.visible = true;
            if(_loc3_ > this.§'#F§)
            {
               this.sprite.alpha = this.alphaMultiplier * (this.§set var package§ - _loc3_) / (this.§set var package§ - this.§'#F§);
            }
            else
            {
               this.sprite.alpha = this.alphaMultiplier;
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.sprite);
         this.container = null;
         this.sprite.clear();
         this.§true var var§.destroy();
         this.§true var var§ = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.§=![§ = 1;
         this.currentFrame = this.sprite.getNumFrames();
      }
      
      private function §static var native§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:ColorTransform, param7:§throw const switch§, param8:Number, param9:String) : void
      {
         this.sprite.width = param1;
         this.sprite.height = param2;
         this.sprite.rotation = param3;
         this.sprite.originX = param4;
         this.sprite.originY = param5;
         this.sprite.blendMode = param9;
         this.sprite.colorTransform = param6;
         this.sprite.softAttenuation = param8;
         this.sprite.§do var super§(param7);
      }
   }
}


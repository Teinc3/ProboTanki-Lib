package §7"j§
{
   import §-!!§.§6!<§;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.engine3d.§7J§;
   import alternativa.tanks.engine3d.§throw const switch§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.geom.ColorTransform;
   
   public class §<"z§ extends §["D§ implements §finally const package§
   {
      private var sprite:§7J§;
      
      private var currentFrame:Number;
      
      private var §@#1§:Number;
      
      private var §=![§:int;
      
      private var §true var var§:§super const class§;
      
      private var container:§6!<§;
      
      public function §<"z§(param1:§1Q§)
      {
         super(param1);
         this.sprite = new §7J§(1,1);
      }
      
      public function init(param1:Number, param2:Number, param3:§throw const switch§, param4:Number, param5:§super const class§, param6:Number = 0.5, param7:Number = 0.5, param8:ColorTransform = null, param9:Number = 130, param10:String = "normal") : void
      {
         this.§static var native§(param1,param2,param4,param6,param7,param8,param3,param9,param10);
         param5.§do package use§(this.sprite);
         this.§@#1§ = 0.001 * param3.fps;
         this.§true var var§ = param5;
         this.currentFrame = 0;
         this.§=![§ = 1;
      }
      
      public function §switch const use§(param1:Number, param2:Number, param3:§throw const switch§, param4:Number, param5:§super const class§, param6:Number = 0.5, param7:Number = 0.5, param8:ColorTransform = null, param9:Number = 130, param10:String = "normal", param11:int = -1) : void
      {
         this.init(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.§=![§ = param11;
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


package § w§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §static for get§ extends §["D§ implements §finally const package§
   {
      private var §["Q§:Sprite3D;
      
      private var delay:int;
      
      private var time:int;
      
      private var §null super§:Number;
      
      private var §package var var§:Number;
      
      private var §&1§:Number;
      
      private var x:Number;
      
      private var y:Number;
      
      private var z:Number;
      
      private var object:Object3D;
      
      private var container:§6!<§;
      
      public function §static for get§(param1:§1Q§)
      {
         super(param1);
         this.§["Q§ = new Sprite3D(10,10);
      }
      
      public function init(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Object3D, param12:TextureMaterial, param13:String) : void
      {
         this.delay = param1;
         this.§["Q§.width = param2;
         this.§["Q§.height = param3;
         this.§["Q§.calculateBounds();
         this.§["Q§.rotation = param4;
         this.§null super§ = param5;
         this.§package var var§ = param6;
         this.§&1§ = param7;
         this.x = param8;
         this.y = param9;
         this.z = param10;
         this.object = param11;
         this.§["Q§.material = param12;
         this.§["Q§.softAttenuation = 150;
         this.§["Q§.depthMapAlphaThreshold = 2;
         this.§["Q§.shadowMapAlphaThreshold = 2;
         this.§["Q§.useShadowMap = false;
         this.§["Q§.useLight = false;
         this.§["Q§.blendMode = param13;
         this.§["Q§.alpha = 0;
         this.time = 0;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§["Q§);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         var _loc3_:Number = NaN;
         if(this.z >= this.§null super§)
         {
            return false;
         }
         this.§["Q§.x = this.object.x + this.x;
         this.§["Q§.y = this.object.y + this.y;
         this.§["Q§.z = this.object.z + this.z;
         this.time += param1;
         if(this.time >= this.delay)
         {
            this.z += this.§null super§ * this.§&1§ * param1 * 0.001;
            if(this.z < this.§package var var§)
            {
               this.§["Q§.alpha = this.z / this.§package var var§;
            }
            else
            {
               _loc3_ = (this.z - this.§package var var§) / (this.§null super§ - this.§package var var§);
               this.§["Q§.alpha = 1 - _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_ * _loc3_;
            }
            if(this.§["Q§.alpha < 0)
            {
               this.§["Q§.alpha = 0;
            }
            if(this.§["Q§.alpha > 1)
            {
               this.§["Q§.alpha = 1;
            }
         }
         else
         {
            this.§["Q§.alpha = 0;
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.§["Q§);
         this.container = null;
         this.§["Q§.material = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.z = this.§null super§;
         this.§["Q§.alpha = 0;
      }
   }
}


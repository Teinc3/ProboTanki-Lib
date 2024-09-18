package §class for§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import §7"j§.§null catch while§;
   import alternativa.engine3d.materials.Material;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §extends const set§ extends §["D§ implements §finally const package§
   {
      private var container:§6!<§;
      
      private var §each package include§:§#!u§;
      
      private var §const with§:Vector3;
      
      private var direction:Vector3;
      
      private var §throw set final§:Number;
      
      private var §switch false§:Number;
      
      private var §7#]§:Number;
      
      private var §function catch import§:int;
      
      private var time:int;
      
      public function §extends const set§(param1:§1Q§)
      {
         this.§const with§ = new Vector3();
         this.direction = new Vector3();
         super(param1);
         this.§each package include§ = new §#!u§();
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Material, param4:Number, param5:Number, param6:Number, param7:Number, param8:int) : void
      {
         this.§const with§.copy(param1);
         this.direction.diff(param2,param1);
         var _loc9_:Number = this.direction.length();
         this.direction.scale(1 / _loc9_);
         this.§throw set final§ = param5;
         this.§switch false§ = param6;
         this.§7#]§ = param7;
         this.§function catch import§ = param8;
         this.§each package include§.init(param4,_loc9_,param3,param7);
         this.time = 0;
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.time > this.§function catch import§)
         {
            return false;
         }
         §null catch while§.§native var static§(this.§each package include§,this.§const with§,this.direction,param2.position);
         _loc4_ = this.time / this.§function catch import§;
         _loc3_ = Math.sqrt(_loc4_);
         this.§each package include§.scaleX = this.§throw set final§ + (this.§switch false§ - this.§throw set final§) * _loc3_;
         this.§each package include§.alpha = 1 - _loc4_;
         this.§each package include§.update(_loc3_);
         this.time += param1;
         return true;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§each package include§);
      }
      
      public function destroy() : void
      {
         this.§each package include§.clear();
         this.container.removeChild(this.§each package include§);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.time = this.§function catch import§ + 1;
      }
   }
}


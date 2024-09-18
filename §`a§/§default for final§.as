package §`a§
{
   import §-!!§.§6!<§;
   import §7"j§.§null catch while§;
   import alternativa.engine3d.materials.Material;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §default for final§ extends §["D§ implements §2#?§
   {
      public static const WIDTH:Number = 48;
      
      private var position:Vector3;
      
      private var direction:Vector3;
      
      private var §2#H§:Number;
      
      private var §null package implements§:int;
      
      private var §-#E§:§[a§;
      
      private var container:§6!<§;
      
      public function §default for final§(param1:§1Q§)
      {
         this.position = new Vector3();
         this.direction = new Vector3();
         super(param1);
         this.§-#E§ = new §[a§();
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number, param4:Number, param5:Material, param6:int) : void
      {
         this.position.copy(param1);
         this.direction.copy(param2);
         this.§null package implements§ = param6;
         this.§2#H§ = 1 / param6;
         this.§-#E§.init(WIDTH,param3,param4,param5);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.§null package implements§ < 0)
         {
            return false;
         }
         this.§null package implements§ -= param1;
         this.§-#E§.alpha -= this.§2#H§ * param1;
         §null catch while§.§native var static§(this.§-#E§,this.position,this.direction,param2.position);
         return true;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§-#E§);
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.§-#E§);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.§null package implements§ = -1;
      }
   }
}


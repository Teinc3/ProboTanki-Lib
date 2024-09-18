package §`"Q§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import §7"j§.§null catch while§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.utils.Dictionary;
   
   public class §8#$§ extends §["D§ implements §finally const package§
   {
      private static const §class catch use§:ConsoleVarFloat = new ConsoleVarFloat("beam_zoffset",100,0,1000);
      
      private static const §null var each§:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private var §-#E§:§use for final§;
      
      private var alive:Boolean;
      
      private var object:Object3D;
      
      private var §return use§:Vector3;
      
      private var §!"w§:Dictionary;
      
      private var container:§6!<§;
      
      public function §8#$§(param1:§1Q§)
      {
         this.§return use§ = new Vector3();
         super(param1);
         this.§-#E§ = new §use for final§(1,1,1,0);
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:§function set package§, param4:Dictionary) : void
      {
         this.object = param1;
         this.§return use§.copy(param2);
         this.§-#E§.§7Y§(param3.§["#§,param3.§include do§);
         this.§-#E§.§""`§(param3.§[!%§);
         this.§-#E§.§6#§ = param3.§6#§;
         this.§static const native§(param3.§else for false§);
         this.§-#E§.§3!M§(param3.§var package false§);
         this.§-#E§.alpha = param3.alpha;
         this.alive = true;
         this.§!"w§ = param4;
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         §null var each§.x = this.object.x;
         §null var each§.y = this.object.y;
         §null var each§.z = this.object.z + §class catch use§.value;
         direction.diff(this.§return use§,§null var each§);
         this.§-#E§.setLength(direction.length());
         direction.normalize();
         §null catch while§.§native var static§(this.§-#E§,§null var each§,direction,param2.position);
         this.§-#E§.update(param1 * 0.001);
         return this.alive;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§-#E§);
         this.§!"w§[this.§-#E§] = true;
      }
      
      public function destroy() : void
      {
         this.object = null;
         this.container.removeChild(this.§-#E§);
         this.§-#E§.setMaterialToAllFaces(null);
         delete this.§!"w§[this.§-#E§];
         this.§!"w§ = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function §static const native§(param1:Number) : void
      {
         this.§-#E§.setWidth(param1);
         this.§-#E§.§throw set null§(param1);
      }
   }
}


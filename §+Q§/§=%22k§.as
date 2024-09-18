package §+Q§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.FillMaterial;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.display.BlendMode;
   
   public class §="k§ extends §["D§ implements §finally const package§
   {
      public static const §function catch static§:Number = 120;
      
      private static const §3#u§:Number = 99.75;
      
      private static const §2!i§:Number = 79.5;
      
      private static const §in set set§:Number = 500;
      
      private static const §include for finally§:Number = 1000;
      
      private static const §switch package do§:Number = 1500;
      
      private static const §+!;§:Number = 1500;
      
      private static const §'!m§:Number = 2500;
      
      private static const §default const switch§:Number = 1300;
      
      private static const §7#>§:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const eulerAngles:Vector3 = new Vector3();
      
      private static const §=j§:FillMaterial = new FillMaterial(4294753806);
      
      private static const §with const false§:Matrix4 = new Matrix4();
      
      private static const §8!8§:Matrix3 = new Matrix3();
      
      private static const §switch for static§:Matrix3 = new Matrix3();
      
      private var turret:Object3D;
      
      private var §2x§:Vector3;
      
      private var §if set while§:Sprite3D;
      
      private var §package set native§:Sprite3D;
      
      private var §return var switch§:Sprite3D;
      
      private var §%#=§:§3!E§;
      
      private var §`"I§:§3!E§;
      
      private var §1#g§:§3!E§;
      
      private var §@$$§:Number = 40;
      
      private var §<o§:Number = 75;
      
      private var §for for import§:Number = 80;
      
      private var §override set while§:Number = 0;
      
      private var §]!-§:Number = 0;
      
      private var §^"K§:Number = 0;
      
      private var §do for const§:Number;
      
      private var angle2:Number;
      
      private var §null const true§:Number;
      
      private var §null package implements§:int;
      
      private var container:§6!<§;
      
      public function §="k§(param1:§1Q§)
      {
         super(param1);
         this.§8"N§();
      }
      
      private static function §switch catch finally§(param1:Mesh, param2:Number, param3:Vector3, param4:Vector3, param5:Number, param6:Number, param7:Number) : void
      {
         §8!8§.fromAxisAngle(Vector3.Y_AXIS,param2);
         if(param4.y < -0.99999 || param4.y > 0.99999)
         {
            axis.x = 0;
            axis.y = 0;
            axis.z = 1;
            param2 = param4.y < 0 ? Number(Math.PI) : Number(0);
         }
         else
         {
            axis.x = param4.z;
            axis.y = 0;
            axis.z = -param4.x;
            axis.normalize();
            param2 = Math.acos(param4.y);
         }
         §switch for static§.fromAxisAngle(axis,param2);
         §8!8§.append(§switch for static§);
         §8!8§.getEulerAngles(eulerAngles);
         param1.rotationX = eulerAngles.x;
         param1.rotationY = eulerAngles.y;
         param1.rotationZ = eulerAngles.z;
         param1.x = param3.x + param4.x * param5 + param6 * §8!8§.m00 + param7 * §8!8§.m02;
         param1.y = param3.y + param4.y * param5 + param6 * §8!8§.m10 + param7 * §8!8§.m12;
         param1.z = param3.z + param4.z * param5 + param6 * §8!8§.m20 + param7 * §8!8§.m22;
      }
      
      private static function §get set return§(param1:Number) : Sprite3D
      {
         var _loc2_:Sprite3D = null;
         _loc2_ = new Sprite3D(param1,param1);
         _loc2_.rotation = 2 * Math.PI * Math.random();
         _loc2_.blendMode = BlendMode.SCREEN;
         _loc2_.useShadowMap = false;
         _loc2_.useLight = false;
         return _loc2_;
      }
      
      private static function §final use§(param1:Sprite3D, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         param1.x = param2.x + param3.x * param4;
         param1.y = param2.y + param3.y * param4;
         param1.z = param2.z + param3.z * param4;
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:Material) : void
      {
         this.turret = param1;
         this.§2x§ = param2;
         this.§if set while§.material = param3;
         this.§package set native§.material = param3;
         this.§return var switch§.material = param3;
         this.§null package implements§ = 50;
         this.§@$$§ = 40;
         this.§<o§ = 75;
         this.§for for import§ = 80;
         this.§override set while§ = 0;
         this.§]!-§ = 0;
         this.§^"K§ = 0;
         this.§do for const§ = Math.random() * 2 * Math.PI;
         this.angle2 = Math.random() * 2 * Math.PI;
         this.§null const true§ = Math.random() * 2 * Math.PI;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§if set while§);
         param1.addChild(this.§package set native§);
         param1.addChild(this.§return var switch§);
         param1.addChild(this.§%#=§);
         param1.addChild(this.§`"I§);
         param1.addChild(this.§1#g§);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.§null package implements§ < 0)
         {
            return false;
         }
         §with const false§.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         §with const false§.transformVector(this.§2x§,§7#>§);
         direction.x = §with const false§.m01;
         direction.y = §with const false§.m11;
         direction.z = §with const false§.m21;
         var _loc3_:Number = 0.001 * param1;
         this.§override set while§ += _loc3_ * §+!;§;
         this.§]!-§ += _loc3_ * §'!m§;
         this.§^"K§ += _loc3_ * §default const switch§;
         §final use§(this.§if set while§,§7#>§,direction,this.§@$$§);
         §final use§(this.§package set native§,§7#>§,direction,this.§<o§);
         §final use§(this.§return var switch§,§7#>§,direction,this.§for for import§);
         §switch catch finally§(this.§%#=§,this.§do for const§,§7#>§,direction,this.§override set while§,0,10);
         §switch catch finally§(this.§`"I§,this.angle2,§7#>§,direction,this.§]!-§,-7,0);
         §switch catch finally§(this.§1#g§,this.§null const true§,§7#>§,direction,this.§^"K§,7,0);
         this.§@$$§ += _loc3_ * §in set set§;
         this.§<o§ += _loc3_ * §include for finally§;
         this.§for for import§ += _loc3_ * §switch package do§;
         this.§null package implements§ -= param1;
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.§if set while§);
         this.container.removeChild(this.§package set native§);
         this.container.removeChild(this.§return var switch§);
         this.container.removeChild(this.§%#=§);
         this.container.removeChild(this.§1#g§);
         this.container.removeChild(this.§`"I§);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.§null package implements§ = -1;
      }
      
      private function §8"N§() : void
      {
         this.§if set while§ = §get set return§(§function catch static§);
         this.§package set native§ = §get set return§(§3#u§);
         this.§return var switch§ = §get set return§(§2!i§);
         this.§%#=§ = new §3!E§(0.8,§=j§);
         this.§`"I§ = new §3!E§(0.75,§=j§);
         this.§1#g§ = new §3!E§(0.82,§=j§);
      }
   }
}


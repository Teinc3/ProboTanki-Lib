package §with for class§
{
   import §-!!§.§6!<§;
   import §7"j§.§each var set§;
   import §7"j§.§finally const package§;
   import §7"j§.§null catch while§;
   import §7"j§.set;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.engine3d.§7J§;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.models.weapon.§catch catch§;
   import alternativa.tanks.models.weapon.§final set var§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.display.BlendMode;
   
   public class §"!Y§ extends §["D§ implements §finally const package§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §use const include§:int = 150;
      
      private static const §;#q§:int = 200;
      
      private static const §each native§:int = 50;
      
      private static const §in package set§:Number = 150;
      
      private static const §&"C§:Number = 210;
      
      private static const §false package else§:Number = -10;
      
      private static const §use const for§:Number = 130;
      
      private static const §null const return§:Number = 35;
      
      private static const §%!>§:Number = 60;
      
      private static const §do for true§:Number = 170;
      
      private static const §for get§:Number = 300;
      
      private static const §4#h§:Number = 170;
      
      private static const §catch set each§:Number = 0.3;
      
      private static const §'"`§:Number = 50;
      
      private static const §class var extends§:Number = 22222;
      
      private static const §=#0§:§final set var§ = new §final set var§();
      
      private static const origin:Vector3 = new Vector3();
      
      private static const §for set default§:Vector3 = new Vector3();
      
      private var time:Number = 0;
      
      private var container:§6!<§;
      
      private var §7Q§:§null var§;
      
      private var turret:Object3D;
      
      private var §,#R§:set;
      
      private var §case package case§:Boolean;
      
      private var §5#T§:Boolean;
      
      private var §throw use§:Boolean;
      
      private var §default catch return§:Boolean;
      
      private var §extends const with§:Boolean;
      
      public function §"!Y§(param1:§1Q§)
      {
         this.§4!7§ = new §each var set§(§in package set§,§&"C§,0,§&"C§ * 0.5,0);
         this.§native package package§ = new §each var set§(§use const for§,§use const for§,0,0,0);
         this.§dynamic const include§ = new §7J§(§use const include§,§use const include§);
         this.§%!w§ = new §7J§(§;#q§,§;#q§);
         this.tracer = new §`!D§();
         this.§each package include§ = new §native package super§(§do for true§,§for get§,§4#h§,§catch set each§);
         this.§&#9§ = new Vector3();
         this.§var for import§ = new Vector3();
         super(param1);
         §null catch while§.§each set while§(this.§4!7§);
         §null catch while§.§each set while§(this.§native package package§);
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:§null var§) : void
      {
         this.§7Q§ = param3;
         this.turret = param1;
         this.§var for import§.copy(param2);
         §catch catch§.§for const throw§(param1,param2,§=#0§);
         this.§@!W§(param3);
         this.§&#9§.copy(§=#0§.§6u§);
         this.§each package include§.§final for implements§(param3.smokeTexture);
         this.tracer.init(param3.tracerTexture);
         this.§,#R§ = set(battleService.§class while§().getObject(set));
         this.§,#R§.init(this.§&#9§,§each native§);
         this.§dynamic const include§.§#![§ = true;
         this.§dynamic const include§.§do var super§(param3.sparklesTexture);
         this.§%!w§.§#![§ = true;
         this.§%!w§.§do var super§(param3.tankSparklesTexture);
         this.time = 0;
         this.§throw use§ = false;
         this.§extends const with§ = false;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§4!7§);
         param1.addChild(this.§native package package§);
         param1.addChild(this.tracer);
         param1.addChild(this.§dynamic const include§);
         param1.addChild(this.§%!w§);
         this.§each package include§.§class const continue§(param1);
         this.§each package include§.start();
         this.tracer.visible = true;
         this.§4!7§.visible = true;
         this.§native package package§.visible = true;
         this.§5#T§ = true;
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         §catch catch§.§for const throw§(this.turret,this.§var for import§,§=#0§);
         var _loc3_:Number = param1 / 1000;
         this.§`w§(param2);
         this.§'#9§(_loc3_,param2,param1);
         this.§'!M§(_loc3_);
         this.time += _loc3_;
         return this.§case package case§ || this.§5#T§;
      }
      
      public function §get catch switch§(param1:Vector3, param2:Boolean) : void
      {
         this.§&#9§.copy(param1);
         this.§throw use§ = true;
         this.§default catch return§ = param2;
      }
      
      public function §return const switch§(param1:Boolean) : void
      {
         this.§throw use§ = false;
         this.§extends const with§ = param1;
      }
      
      public function destroy() : void
      {
         this.kill();
         this.§native package package§.clear();
         this.§4!7§.clear();
         this.§each package include§.clear();
         this.§dynamic const include§.clear();
         this.§%!w§.clear();
         this.container = null;
         this.§7Q§ = null;
         this.turret = null;
         this.§,#R§.destroy();
         this.§,#R§ = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.container.removeChild(this.§4!7§);
         this.container.removeChild(this.§native package package§);
         this.container.removeChild(this.tracer);
         this.container.removeChild(this.§dynamic const include§);
         this.container.removeChild(this.§%!w§);
      }
      
      public function stop() : void
      {
         this.§each package include§.stop();
         this.tracer.visible = false;
         this.§4!7§.visible = false;
         this.§native package package§.visible = false;
         this.§dynamic const include§.visible = false;
         this.§%!w§.visible = false;
         this.§5#T§ = false;
      }
      
      private function §@!W§(param1:§null var§) : void
      {
         var _loc2_:§throw const switch§ = param1.fireAlongTexture;
         this.§4!7§.init(_loc2_,_loc2_.fps);
         this.§4!7§.blendMode = BlendMode.ADD;
         var _loc3_:§throw const switch§ = param1.fireAcrossTexture;
         this.§native package package§.init(_loc3_,_loc3_.fps);
         this.§native package package§.blendMode = BlendMode.ADD;
         this.§7g§();
      }
      
      private function §7g§() : void
      {
         var _loc1_:Number = §=#0§.direction.x;
         var _loc2_:Number = §=#0§.direction.y;
         this.§native package package§.rotationX = Math.atan2(§=#0§.direction.z,Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_)) - Math.PI / 2;
         this.§native package package§.rotationY = 0;
         this.§native package package§.rotationZ = -Math.atan2(_loc1_,_loc2_);
      }
      
      private function §`w§(param1:§3!0§) : void
      {
         §null catch while§.§4!R§(this.§4!7§,param1.position,§=#0§.direction,false,8,0.9);
         §null catch while§.§4!R§(this.§native package package§,param1.position,§=#0§.direction,true,4,0.3);
         this.§52§(§=#0§.§6u§,§=#0§.direction,§false package else§,origin);
         §null catch while§.§native var static§(this.§4!7§,origin,§=#0§.direction,param1.position);
         this.§4!7§.setTime(this.time % this.§4!7§.§8a§());
         this.§7g§();
         this.§,"^§(this.§native package package§,§=#0§.§6u§,§=#0§.direction,§null const return§);
         this.§native package package§.setTime(this.time % this.§native package package§.§8a§());
      }
      
      private function §'#9§(param1:Number, param2:§3!0§, param3:int) : void
      {
         var _loc4_:Number = NaN;
         if(this.§throw use§)
         {
            §for set default§.copy(this.§&#9§);
            §for set default§.subtract(§=#0§.§6u§);
            _loc4_ = §for set default§.length();
            §for set default§.normalize();
            this.§include package catch§(param1,param2,param3);
         }
         else
         {
            _loc4_ = this.§extends const with§ ? Number(0) : Number(§class var extends§);
            §for set default§.copy(§=#0§.direction);
            this.§?!C§();
         }
         this.§52§(§=#0§.§6u§,§=#0§.direction,§'"`§,origin);
         §null catch while§.§native var static§(this.tracer,origin,§for set default§,param2.position);
         this.tracer.update(param3,_loc4_ - §'"`§);
      }
      
      private function §include package catch§(param1:Number, param2:§3!0§, param3:int) : void
      {
         this.§?!C§();
         var _loc4_:§7J§;
         (_loc4_ = this.§default catch return§ ? this.§%!w§ : this.§dynamic const include§).visible = this.§5#T§;
         _loc4_.update(param1);
         this.§,#R§.init(this.§&#9§,§each native§);
         this.§,#R§.§'!g§(_loc4_,param2,param3);
      }
      
      private function §?!C§() : void
      {
         this.§dynamic const include§.visible = false;
         this.§%!w§.visible = false;
      }
      
      private function §'!M§(param1:Number) : void
      {
         this.§52§(§=#0§.§6u§,§=#0§.direction,§%!>§,origin);
         this.§each package include§.§;s§(origin);
         this.§case package case§ = this.§each package include§.update(param1);
      }
      
      private function §52§(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : void
      {
         param4.copy(param1).addScaled(param3,param2);
      }
      
      private function §,"^§(param1:Object3D, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         param1.x = param2.x + param4 * param3.x;
         param1.y = param2.y + param4 * param3.y;
         param1.z = param2.z + param4 * param3.z;
      }
   }
}


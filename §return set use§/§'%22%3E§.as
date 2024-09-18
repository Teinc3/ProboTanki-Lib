package §return set use§
{
   import §-!!§.§6!<§;
   import §7"j§.§extends super§;
   import §7"j§.§finally const package§;
   import §7"j§.§null catch while§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.§?!2§;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.utils.SetControllerForTemporaryItems;
   import alternativa.tanks.utils.§super with§;
   import §extends for const§.§import use§;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.utils.Dictionary;
   
   public class §'">§ implements §finally const package§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §9!a§:Class = §while set return§;
      
      public static var §""7§:BitmapData = new §9!a§().bitmapData;
      
      private static const §null var each§:Vector3 = new Vector3();
      
      private static const §return use§:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const §[!u§:Dictionary = new Dictionary();
      
      private static const §extends catch get§:int = 0;
      
      private static const §,"K§:int = 1;
      
      private static const §static catch false§:int = 2;
      
      private static const §9!t§:int = 3;
      
      private static const §else set false§:int = 4;
      
      private static const §&!3§:int = 200;
      
      private static const § 6§:Number = 100000;
      
      private static const §0"A§:Number = 200;
      
      private static const §2#,§:Number = 2.2;
      
      private static const §get catch import§:Number = 0.333;
      
      private static const §use const if§:Number = 30;
      
      private static const §false package var§:Number = 10;
      
      private static const §package package true§:Number = 0.001;
      
      private static const §`!'§:Number = 1;
      
      private var visible:Boolean;
      
      private var state:int;
      
      private var time:int;
      
      private var fadeInTimeMs:int;
      
      private var turret:Object3D;
      
      private var laser:§1c§;
      
      private var container:§6!<§;
      
      private var §package var return§:§extends super§;
      
      private var §while set function§:Sprite3D;
      
      private var §"$$§:Number;
      
      private var §="h§:Number;
      
      private var §throw for catch§:Number;
      
      private var targetTank:Tank;
      
      private var §return for finally§:Vector3;
      
      private var §?#q§:SetControllerForTemporaryItems;
      
      private var §import null§:Dictionary;
      
      public function §'">§(param1:int, param2:Tank)
      {
         this.§return for finally§ = new Vector3();
         super();
         this.fadeInTimeMs = param1;
         this.laser = new §1c§();
         this.§while set function§ = new Sprite3D(§use const if§,§use const if§);
         this.§while set function§.useShadowMap = false;
         this.§while set function§.useLight = false;
         this.§while set function§.blendMode = BlendMode.ADD;
         this.§while set function§.sorting = Sorting.DYNAMIC_BSP;
         this.§while set function§.shadowMapAlphaThreshold = 2;
         this.§while set function§.depthMapAlphaThreshold = 2;
         this.turret = param2.§in package default§().§&K§();
         var _loc3_:§import use§ = battleService.§class while§();
         this.§package var return§ = §extends super§(_loc3_.getObject(§extends super§));
         this.§package var return§.init(this.turret,param2.§%$#§());
         this.§import null§ = battleService.§3l§().§native var implements§();
         this.§?#q§ = new SetControllerForTemporaryItems(this.§import null§);
      }
      
      public function show(param1:uint) : void
      {
         this.visible = true;
         this.state = §extends catch get§;
         this.§="h§ = 0;
         this.§throw for catch§ = 1;
         this.laser.alpha = 0;
         this.laser.visible = false;
         this.laser.init(param1);
         this.§while set function§.alpha = 0;
         this.§while set function§.visible = false;
         this.§while set function§.material = §super with§.§continue in§(§[!u§,param1,§""7§);
         if(this.container == null)
         {
            battleService.§7"0§(this);
         }
      }
      
      public function §for set switch§() : void
      {
         this.visible = true;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.laser);
         param1.addChild(this.§while set function§);
      }
      
      public function §else catch class§(param1:Number) : Boolean
      {
         if(this.state == §extends catch get§ || this.targetTank != null || Math.abs(this.§"$$§ - param1) > §package package true§)
         {
            this.§final package catch§();
            this.§"$$§ = param1;
            this.targetTank = null;
            return true;
         }
         return false;
      }
      
      public function §var const extends§(param1:Tank, param2:Vector3) : Boolean
      {
         this.§final package catch§();
         if(this.targetTank != param1 || param2.distanceToSquared(this.§return for finally§) > §`!'§)
         {
            this.targetTank = param1;
            this.§return for finally§.copy(param2);
            return true;
         }
         return false;
      }
      
      private function §final package catch§() : void
      {
         if(this.state == §extends catch get§)
         {
            this.time = 0;
            this.state = §,"K§;
         }
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         this.updateState(param1);
         if(this.state == §else set false§)
         {
            return false;
         }
         if(this.state == §extends catch get§)
         {
            this.laser.alpha = 0;
            this.laser.visible = false;
            this.§while set function§.alpha = 0;
            this.§while set function§.visible = false;
            return true;
         }
         this.§package var return§.§'!g§(this.laser,param2,param1);
         §null var each§.x = this.laser.x;
         §null var each§.y = this.laser.y;
         §null var each§.z = this.laser.z;
         this.§6#K§();
         var _loc3_:Number = Vector3.distanceBetween(§null var each§,§return use§);
         this.laser.update(param1,_loc3_);
         this.laser.visible = _loc3_ >= §0"A§;
         this.§while set function§.x = §return use§.x;
         this.§while set function§.y = §return use§.y;
         this.§while set function§.z = §return use§.z;
         this.§while set function§.visible = _loc3_ < § 6§;
         §null catch while§.§native var static§(this.laser,§null var each§,direction,param2.position);
         return true;
      }
      
      private function §6#K§() : void
      {
         var _loc1_:Matrix3 = §+$%§.§6!;§;
         _loc1_.setRotationMatrixForObject3D(this.turret);
         var _loc2_:Vector3 = §+$%§.§@!c§;
         _loc1_.getUp(_loc2_);
         if(this.targetTank != null && this.targetTank.§0"t§() != null)
         {
            §return use§.copy(this.§return for finally§);
            §+$%§.localToGlobal(this.targetTank.§0"t§(),§return use§);
            direction.diff(§return use§,§null var each§).normalize();
            this.§"$$§ = _loc2_.dot(direction);
            if(Math.abs(this.§"$$§ - this.§="h§) < §package package true§)
            {
               §return use§.addScaled(-§false package var§,direction);
               return;
            }
         }
         if(Math.abs(this.§"$$§ - this.§="h§) > §package package true§)
         {
            this.§="h§ += §get catch import§ * (this.§"$$§ - this.§="h§);
            this.§throw for catch§ = Math.sqrt(1 - this.§="h§ * this.§="h§);
         }
         direction.copy(_loc2_);
         direction.scale(this.§="h§);
         _loc1_.getForward(_loc2_);
         direction.addScaled(this.§throw for catch§,_loc2_);
         this.§in var in§();
      }
      
      private function updateState(param1:int) : void
      {
         var _loc2_:Number = 0;
         switch(this.state)
         {
            case §,"K§:
               _loc2_ = this.§super for with§(param1,§static catch false§,this.fadeInTimeMs);
               break;
            case §9!t§:
               _loc2_ = 1 - this.§super for with§(param1,§else set false§,§&!3§);
               break;
            default:
               return;
         }
         var _loc3_:Number = Math.pow(_loc2_,§2#,§);
         this.laser.alpha = _loc3_;
         this.§while set function§.alpha = _loc3_;
      }
      
      private function §super for with§(param1:int, param2:int, param3:int) : Number
      {
         this.time += param1;
         if(this.time >= param3)
         {
            this.state = param2;
            this.time = param3;
         }
         return this.time / param3;
      }
      
      private function §in var in§() : void
      {
         var _loc1_:RayIntersectionData = null;
         var _loc2_:Object3D = null;
         this.§?#q§.addTemporaryItem(this.turret);
         while(true)
         {
            _loc1_ = battleService.§3l§().raycast(§null var each§,direction,this.§import null§);
            if(_loc1_ == null)
            {
               break;
            }
            _loc2_ = _loc1_.object;
            if(_loc2_.name == §?!2§.§finally catch while§ || _loc2_.name == §?!2§.TANK_PART)
            {
               §return use§.copy(§null var each§);
               §return use§.addScaled(_loc1_.time - §false package var§,direction);
               this.§?#q§.deleteAllTemporaryItems();
               return;
            }
            this.§?#q§.addTemporaryItem(_loc1_.object);
         }
         this.§?#q§.deleteAllTemporaryItems();
         §return use§.copy(§null var each§);
         §return use§.addScaled(§ 6§,direction);
      }
      
      public function hide() : void
      {
         this.visible = false;
         if(this.container)
         {
            this.state = §9!t§;
            this.time = 0;
         }
         else
         {
            this.kill();
         }
      }
      
      public function isVisible() : Boolean
      {
         return this.visible;
      }
      
      public function destroy() : void
      {
         this.kill();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.kill();
         this.§package var return§.destroy();
         this.§package var return§ = null;
         this.turret = null;
         this.laser = null;
         this.§while set function§ = null;
         this.§import null§ = null;
         this.§?#q§ = null;
      }
      
      public function kill() : void
      {
         if(this.container)
         {
            this.container.removeChild(this.laser);
            this.container.removeChild(this.§while set function§);
            this.container = null;
            this.laser.close();
            this.§while set function§.material = null;
            this.state = §else set false§;
         }
         else
         {
            this.state = §extends catch get§;
         }
         this.targetTank = null;
         this.§return for finally§.reset();
         this.§"$$§ = 0;
         this.§="h§ = 0;
         this.§throw for catch§ = 1;
      }
   }
}


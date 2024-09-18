package alternativa.tanks.battle.scene3d
{
   import §-!!§.§%"C§;
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import §@"]§.§4#C§;
   import §@$ §.§include for true§;
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.core.View;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§0"O§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§in package use§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.§static const super§;
   import alternativa.tanks.battle.§throw package class§;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.camera.§function const package§;
   import alternativa.tanks.camera.§true var set§;
   import alternativa.utils.TextureMaterialRegistry;
   import §dynamic catch class§.§-2§;
   import flash.display.BitmapData;
   import flash.display.Stage;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import §override package get§.§catch continue§;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import §while catch use§.§finally for false§;
   
   public class §[!r§
   {
      private static const §get var return§:int = 10;
      
      private static const §=#4§:int = 20000;
      
      private static const §<!A§:Vector3D = new Vector3D();
      
      private static const §+"7§:Vector3D = new Vector3D();
      
      private var rootContainer:Object3DContainer;
      
      private var §use const else§:Object3DContainer;
      
      private var mainContainer:Object3DContainer;
      
      private var §const set class§:Object3DContainer;
      
      public var §`#0§:Object3DContainer;
      
      private var §="N§:§%"C§;
      
      private var §1!S§:§%"C§;
      
      private var camera:§3!0§;
      
      private var §default for static§:Vector.<§##W§>;
      
      private var §native catch switch§:§function const package§;
      
      private var effects:Vector.<§finally const package§>;
      
      private var §'!H§:int;
      
      private var §?#u§:§throw package class§;
      
      private var §&O§:§0"_§;
      
      private var §,#A§:§'!4§;
      
      private var fog:§^"s§;
      
      private var §do null§:§return var var§;
      
      private var lighting:§break throw§;
      
      private var §in catch null§:§0"O§;
      
      private var stage:Stage;
      
      private var §[#b§:§static const super§;
      
      private var §function var in§:§-2§;
      
      private var §@#R§:TextureMaterialRegistry;
      
      private var §override for throw§:Number;
      
      private var §var package for§:§true var const§;
      
      private var §&"_§:Boolean;
      
      private var tanks:Vector.<Tank>;
      
      public function §[!r§(param1:Stage, param2:TextureMaterialRegistry, param3:Number)
      {
         this.§import null§ = new Dictionary();
         this.§static const finally§ = new Dictionary();
         this.§implements set try§ = new §catch continue§();
         this.§class catch set§ = new Dictionary();
         this.§get package with§ = new §in package use§(100);
         this.§,_§ = new §4#C§();
         this.§="N§ = new §%"C§();
         this.§default for static§ = Vector.<§##W§>([new §##W§(),new §##W§()]);
         this.§native catch switch§ = §true var set§.INSTANCE;
         this.effects = new Vector.<§finally const package§>();
         this.tanks = new Vector.<Tank>();
         super();
         this.§@#R§ = param2;
         this.stage = param1;
         this.§override for throw§ = param3;
         this.§set else§();
         this.§"!N§();
         this.§if for switch§();
         this.§function var in§ = new §-2§();
         this.fog = new §^"s§(this.camera);
         this.§do null§ = new §return var var§(this.camera);
         this.lighting = new §break throw§(this.camera);
      }
      
      public function §]!4§() : §6!<§
      {
         return this.§1!S§;
      }
      
      public function §9#"§() : §6!<§
      {
         return this.§="N§;
      }
      
      public function §+a§(param1:View) : void
      {
         this.camera.view = param1;
      }
      
      public function §finally var function§(param1:Number, param2:uint, param3:Number, param4:Number, param5:Number) : void
      {
      }
      
      public function §9! §() : void
      {
         this.§9"N§(this.§,_§,0);
      }
      
      public function §6x§(param1:BattleService, param2:§include for true§) : void
      {
         this.§[#b§ = new §static const super§(param1);
         this.§[#b§.init(param2.dustParticle,this.§@#R§,param2.dustFarDistance,param2.dustNearDistance,param2.dustSize,param2.alpha,param2.§default const in§);
      }
      
      public function §if catch import§() : §static const super§
      {
         return this.§[#b§;
      }
      
      public function §&![§() : void
      {
         this.§0!n§(this.§,_§,0);
         this.§,_§.§default package each§();
      }
      
      public function §get var get§(param1:Boolean, param2:String) : void
      {
         if(param1)
         {
            if(this.§in catch null§ == null)
            {
               this.§override catch static§(true);
               this.§###§(true);
               this.§7x§(true);
               this.§^! §(true);
               this.§8!9§(true);
               this.§throw var finally§(true);
               this.§true set catch§(true);
               this.§false for return§(true);
               this.§import package for§(true);
               this.§in catch null§ = new §0"O§();
               this.§in catch null§.§do const true§(this.stage,this.camera,param2);
            }
         }
         else if(this.§in catch null§ != null)
         {
            this.§in catch null§.stop();
            this.§in catch null§ = null;
         }
      }
      
      public function §4"_§(param1:int, param2:Number, param3:Number, param4:Number) : void
      {
         this.fog.setup(param1,param2,param3,param4);
      }
      
      public function §^";§(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         this.lighting.setup(param1,param2,param3,param4);
      }
      
      public function §override catch static§(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(param1)
            {
               this.§do null§.enable();
            }
            else
            {
               this.§do null§.disable();
            }
         }
      }
      
      public function §###§(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(param1)
            {
               this.lighting.§-I§();
            }
            else
            {
               this.lighting.§[",§();
            }
         }
      }
      
      public function §7x§(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(param1)
            {
               this.fog.enable();
            }
            else
            {
               this.fog.disable();
            }
         }
      }
      
      public function §override package catch§() : void
      {
         this.§7x§(this.camera.fogAlpha == 0);
      }
      
      public function §%"G§(param1:§'!4§) : void
      {
         this.§,#A§ = param1;
      }
      
      public function §false var null§(param1:Dictionary) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in this.§class catch set§)
         {
            param1[_loc2_] = true;
         }
      }
      
      public function §const var extends§(param1:Object3D) : void
      {
         this.§import null§[param1] = true;
      }
      
      public function §"!f§(param1:Object3D) : void
      {
         delete this.§import null§[param1];
      }
      
      public function §native var implements§() : Dictionary
      {
         return this.§import null§;
      }
      
      public function §import catch package§() : Dictionary
      {
         return this.§static const finally§;
      }
      
      private function §set else§() : void
      {
         this.rootContainer = new Object3DContainer();
         this.rootContainer.addChild(this.§use const else§ = new Object3DContainer());
         this.rootContainer.addChild(this.mainContainer = new Object3DContainer());
         this.rootContainer.addChild(this.§const set class§ = new Object3DContainer());
         this.§1!S§ = new §%"C§(this.§const set class§);
      }
      
      private function §"!N§() : void
      {
         this.camera = new §3!0§();
         this.camera.ssaoRadius = 400;
         this.camera.ssaoRange = 1200;
         this.camera.ssaoColor = 0;
         this.camera.ssaoAlpha = 1.4;
         this.camera.addToDebug(Debug.BOUNDS,Object3D);
         this.camera.addToDebug(Debug.EDGES,Object3D);
         this.rootContainer.addChild(this.camera);
      }
      
      public function §"!c§(param1:uint) : void
      {
         this.camera.ssaoColor = param1;
      }
      
      private function §if for switch§() : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.§&O§ = new §0"_§(§=#4§);
            this.§9"N§(this.§&O§,0);
         }
      }
      
      public function §?!Y§(param1:Shadow) : void
      {
         this.§do null§.add(param1);
      }
      
      public function §-#F§(param1:Shadow) : void
      {
         this.§do null§.remove(param1);
      }
      
      public function §84§(param1:§finally for false§) : void
      {
         this.§with catch with§(param1.§2"F§());
      }
      
      public function §break for while§(param1:§finally for false§) : void
      {
         this.removeObject(param1.§2"F§());
      }
      
      public function §each const finally§(param1:Boolean) : void
      {
         this.camera.debug = param1;
      }
      
      public function isDebug() : Boolean
      {
         return this.camera.debug;
      }
      
      public function §catch const break§() : void
      {
         this.§&"_§ = true;
      }
      
      public function §<!i§() : void
      {
         this.§&"_§ = false;
      }
      
      public function §true var extends§(param1:§throw package class§) : void
      {
         this.§?#u§ = param1;
      }
      
      public function §each package import§(param1:Tank) : void
      {
         this.tanks.push(param1);
      }
      
      public function §true set false§(param1:Tank) : void
      {
         var _loc2_:int = int(this.tanks.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.tanks.splice(_loc2_,1);
         }
      }
      
      public function §9"N§(param1:§else if§, param2:int = 0) : void
      {
         var _loc3_:§##W§ = this.§default for static§[param2];
         _loc3_.§9"N§(param1);
      }
      
      public function §0!n§(param1:§else if§, param2:int = 0) : void
      {
         var _loc3_:§##W§ = this.§default for static§[param2];
         _loc3_.§0!n§(param1);
      }
      
      public function §7"0§(param1:§finally const package§) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError();
         }
         var _loc2_:* = this.§'!H§++;
         this.effects[_loc2_] = param1;
         param1.§&"-§(this.§="N§);
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(this.§&"_§)
         {
            this.§get package with§.update();
            this.§do null§.§throw set extends§(this.§get package with§.§finally package try§());
            this.§[#b§.update();
            this.§6"F§(param1,param2);
            this.§native catch switch§.update(param1,param2);
            this.camera.§const for package§();
            this.§while catch finally§(param1,param2);
            this.§if use§(param2);
            if(this.§?#u§ != null)
            {
               this.§?#u§.§<z§();
            }
            _loc3_ = this.camera.shadowMap != null ? Number(this.camera.shadowMapStrength) : Number(0);
            if(this.camera.directionalLight != null)
            {
               this.camera.directionalLight.intensity = this.§override for throw§ + _loc3_ * (1 - this.§override for throw§);
            }
            this.camera.render();
         }
      }
      
      private function §6"F§(param1:int, param2:int) : void
      {
         var _loc3_:Tank = null;
         for each(_loc3_ in this.tanks)
         {
            _loc3_.render(param1,param2);
         }
      }
      
      private function §if use§(param1:int) : void
      {
         var _loc2_:§finally const package§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.§'!H§)
         {
            _loc2_ = this.effects[_loc3_];
            if(!_loc2_.play(param1,this.camera))
            {
               _loc2_.destroy();
               var _loc4_:*;
               this.effects[_loc4_ = _loc3_--] = this.effects[--this.§'!H§];
               this.effects[this.§'!H§] = null;
            }
            _loc3_++;
         }
      }
      
      public function §super package§() : §3!0§
      {
         return this.camera;
      }
      
      public function §with var use§(param1:Object3D) : void
      {
         if(this.§use const else§.numChildren > 0)
         {
            this.§use const else§.removeChildAt(0);
         }
         this.§use const else§.addChild(param1);
      }
      
      public function §throw var finally§(param1:Boolean) : void
      {
         this.camera.ssao = param1;
      }
      
      public function §else for extends§(param1:Object3DContainer) : void
      {
         if(this.§`#0§ != null)
         {
            this.mainContainer.removeChild(this.§`#0§);
            this.§`#0§ = null;
         }
         this.§="N§.§class const continue§(param1);
         this.§`#0§ = param1;
         if(this.§`#0§ != null)
         {
            this.mainContainer.addChild(this.§`#0§);
            this.camera.farClipping = 1.5 * this.§1$§(this.§`#0§);
         }
      }
      
      public function §1$§(param1:Object3D) : Number
      {
         var _loc2_:Number = param1.boundMaxX - param1.boundMinX;
         var _loc3_:Number = param1.boundMaxY - param1.boundMinY;
         var _loc4_:Number = param1.boundMaxZ - param1.boundMinZ;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_ + _loc4_ * _loc4_);
      }
      
      public function §with catch with§(param1:Object3D) : void
      {
         this.§="N§.addChild(param1);
         if(param1.name != §?!2§.§finally catch while§ && param1.name != §?!2§.TANK_PART)
         {
            this.§static const finally§[param1] = true;
         }
      }
      
      public function removeObject(param1:Object3D) : void
      {
         this.§="N§.removeChild(param1);
         if(param1.name != §?!2§.§finally catch while§ && param1.name != §?!2§.TANK_PART)
         {
            delete this.§static const finally§[param1];
         }
      }
      
      public function raycast(param1:Vector3, param2:Vector3, param3:Dictionary, param4:Camera3D = null) : RayIntersectionData
      {
         var _loc5_:Object3D = null;
         §+$%§.§with catch return§(param1,§<!A§);
         §+$%§.§with catch return§(param2,§+"7§);
         var _loc6_:RayIntersectionData = this.§`#0§.intersectRay(§<!A§,§+"7§,param3,param4);
         if(_loc6_)
         {
            _loc5_ = _loc6_.object;
            while(_loc5_ != null && !_loc5_.mouseEnabled)
            {
               _loc5_ = _loc5_.parent;
            }
            _loc6_.object = _loc5_;
         }
         return _loc6_;
      }
      
      public function §'!3§(param1:Boolean) : void
      {
         var _loc2_:Object3D = this.§implements var while§();
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
         }
      }
      
      public function §switch set const§() : Boolean
      {
         var _loc1_:Object3D = this.§implements var while§();
         if(_loc1_ != null)
         {
            return _loc1_.visible;
         }
         return false;
      }
      
      public function addDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:§<!T§ = null) : void
      {
         var _loc6_:Decal = this.createDecal(param1,param2,param3,param4,param5);
         if(_loc6_ != null)
         {
            this.§implements set try§.put(_loc6_);
            if(this.§implements set try§.getSize() > §get var return§)
            {
               this.§&O§.add(this.§implements set try§.pop());
            }
         }
      }
      
      public function §do package super§(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial) : Decal
      {
         return this.createDecal(param1,param2,param3,param4);
      }
      
      private function createDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:§<!T§ = null) : Decal
      {
         var _loc6_:Decal = null;
         if(param5 == null)
         {
            param5 = §<!T§.§true set§;
         }
         if(GPUCapabilities.gpuEnabled && this.§`#0§ is KDContainer)
         {
            _loc6_ = this.§,#A§.createDecal(param1,param2,param3,param4,KDContainer(this.§`#0§),param5);
            this.§="N§.addChildAt(_loc6_,0);
            this.§class catch set§[_loc6_] = true;
            this.§const var extends§(_loc6_);
            this.§static const finally§[_loc6_] = true;
            return _loc6_;
         }
         return null;
      }
      
      public function §do for default§(param1:Decal) : void
      {
         if(param1 != null && GPUCapabilities.gpuEnabled)
         {
            this.§="N§.removeChild(param1);
            this.§"!f§(param1);
            delete this.§static const finally§[param1];
            delete this.§class catch set§[param1];
         }
      }
      
      public function §2!k§(param1:§function const package§) : void
      {
         this.§native catch switch§ = param1;
      }
      
      public function §import catch extends§() : §function const package§
      {
         return this.§native catch switch§;
      }
      
      private function §implements var while§() : Object3D
      {
         if(this.§use const else§.numChildren == 0)
         {
            return null;
         }
         return this.§use const else§.getChildAt(0);
      }
      
      private function §while catch finally§(param1:int, param2:int) : void
      {
         var _loc3_:§##W§ = null;
         for each(_loc3_ in this.§default for static§)
         {
            _loc3_.render(param1,param2);
         }
      }
      
      public function shutdown() : void
      {
         if(this.§native catch switch§ != null)
         {
            this.§native catch switch§.deactivate();
         }
         this.§get var get§(false,"");
         this.§1##§(this.§use const else§);
         this.§1##§(this.mainContainer);
         this.§1##§(this.§const set class§);
         this.§1##§(this.rootContainer);
         this.§,_§.clear();
      }
      
      private function §1##§(param1:Object3DContainer) : void
      {
         while(param1.numChildren > 0)
         {
            param1.removeChildAt(0);
         }
      }
      
      public function §^! §(param1:Boolean) : void
      {
         this.camera.softTransparency = param1;
      }
      
      public function §8!9§(param1:Boolean) : void
      {
         this.§if catch import§().enabled = param1;
      }
      
      public function §in throw§() : void
      {
         this.lighting.toggle();
      }
      
      public function §<!u§(param1:Mesh) : void
      {
         this.§function var in§.add(param1);
      }
      
      public function §use for use§(param1:BitmapData) : void
      {
         this.§function var in§.setImage(param1);
      }
      
      public function §true set catch§(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(param1)
            {
               this.lighting.§true set catch§();
            }
            else
            {
               this.lighting.§ #m§();
            }
         }
      }
      
      public function §false for return§(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.camera.deferredLighting = param1;
         }
      }
      
      public function §import package for§(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.camera.view.antiAliasEnabled = param1;
         }
      }
      
      public function §case get§() : Number
      {
         return this.§`#0§ == null ? Number(0) : Number(this.§`#0§.boundMinZ);
      }
   }
}


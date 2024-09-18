package §<">§
{
   import § !V§.§=p§;
   import §!!v§.§use catch true§;
   import §"$§.§implements include§;
   import §%3§.§?"p§;
   import §%3§.§super var default§;
   import §'H§.§const const case§;
   import §'H§.§implements set else§;
   import §0#I§.§break for catch§;
   import §0#I§.§get for default§;
   import §3^§.§"u§;
   import §4"%§.§3#X§;
   import §6!u§.§for package true§;
   import §;"?§.§#">§;
   import §<#<§.§switch const null§;
   import §@$ §.§for var finally§;
   import §@$ §.§include for true§;
   import §@$ §.§package package override§;
   import §@$ §.§static static§;
   import §@$ §.§switch var in§;
   import §]!3§.§=#@§;
   import §]!3§.§throw var each§;
   import §]R§.§[g§;
   import §]R§.§in true§;
   import §]i§.§'#;§;
   import §`"X§.§4"e§;
   import §`"b§.§function catch extends§;
   import §`"b§.§if for else§;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.register.ClientClass;
   import alternativa.tanks.models.battle.battlefield.§static throw§;
   import alternativa.tanks.models.battle.gui.§&"4§;
   import alternativa.tanks.models.battle.gui.chat.ChatModel;
   import alternativa.tanks.models.battle.gui.chat.§finally else§;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.types.Long;
   import §catch package super§.§in const§;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankParts;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankState;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattleBonus;
   import com.alternativaplatform.projects.tanks.client.models.tank.ClientTank;
   import §extends var default§.§do package do§;
   import §final package set§.§`"B§;
   import §finally for continue§.§true override§;
   import flash.geom.ColorTransform;
   import §function implements§.§override package for§;
   import §if try§.§return package if§;
   import §native for§.§+!>§;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import platform.client.fp10.core.type.impl.GameClass;
   import platform.client.fp10.core.type.impl.GameObject;
   import projects.tanks.client.battleservice.§final package import§;
   import projects.tanks.client.commons.models.coloring.ColoringCC;
   import projects.tanks.client.garage.models.item.object3ds.Object3DSCC;
   import projects.tanks.clients.flash.commons.models.coloring.ColoringModel;
   import projects.tanks.clients.flash.resources.object3ds.Object3DSModel;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import scpacker.tanks.WeaponsManager;
   import scpacker.utils.§throw package each§;
   import §switch package return§.§+"O§;
   import §switch package return§.§else for override§;
   
   public class §do switch§ extends §return package if§
   {
      private var §default false§:§static throw§;
      
      private var §5#3§:ColoringModel;
      
      private var §!!4§:Object3DSModel;
      
      private var §null catch false§:§override package for§;
      
      private var §each set var§:§3#X§;
      
      private var §use set do§:§for package true§;
      
      private var §@"z§:§+!>§;
      
      private var §%9§:§+"O§;
      
      private var §,n§:§2!s§;
      
      private var §<!p§:§"u§;
      
      private var §break var set§:§switch const null§;
      
      private var §[#u§:§true override§;
      
      private var §static set var§:§implements include§;
      
      private var §;!#§:§[g§;
      
      private var userPropertiesService:IUserPropertiesService;
      
      private var §get const true§:ILightingEffectsService;
      
      private var §-c§:ISpace;
      
      private var §implements set extends§:GameClass;
      
      public var modelId:int;
      
      public function §do switch§()
      {
         super();
         this.modelId = 36;
         this.§5#3§ = ColoringModel(modelRegistry.getModel(Long.getLong(947299051,-358915161)));
         this.§!!4§ = Object3DSModel(modelRegistry.getModel(Long.getLong(1497301838,-1092921347)));
         this.§null catch false§ = §override package for§(modelRegistry.getModel(Long.getLong(923418047,-17313881)));
         this.§each set var§ = §3#X§(modelRegistry.getModel(Long.getLong(1099120188,-904226430)));
         this.§use set do§ = §for package true§(modelRegistry.getModel(Long.getLong(1129811198,-16275595)));
         this.§default false§ = §static throw§(modelRegistry.getModel(Long.getLong(1723277227,1936126557)));
         this.§@"z§ = §+!>§(modelRegistry.getModel(Long.getLong(1092696378,-225264163)));
         this.§%9§ = §+"O§(modelRegistry.getModelsByInterface(§else for override§)[0]);
         this.§,n§ = §2!s§(modelRegistry.getModelsByInterface(§finally var return§)[0]);
         this.§<!p§ = §"u§(modelRegistry.getModel(Long.getLong(815932807,-684891581)));
         this.§break var set§ = §switch const null§(modelRegistry.getModel(Long.getLong(759725658,1071543601)));
         this.§[#u§ = §true override§(modelRegistry.getModel(Long.getLong(1983242842,420087132)));
         this.§static set var§ = §implements include§(modelRegistry.getModel(Long.getLong(1545673170,1705258317)));
         this.§;!#§ = §[g§(modelRegistry.getModel(Long.getLong(1742678945,1383804656)));
         this.userPropertiesService = IUserPropertiesService(OSGi.getInstance().getService(IUserPropertiesService));
         §9#A§ = TankUsersRegistry(OSGi.getInstance().getService(TankUsersRegistry));
         this.§get const true§ = ILightingEffectsService(OSGi.getInstance().getService(ILightingEffectsService));
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(this.§5#3§.id);
         _loc1_.push(this.§!!4§.id);
         _loc1_.push(this.§null catch false§.id);
         _loc1_.push(this.§each set var§.id);
         _loc1_.push(this.§use set do§.id);
         var _loc2_:Vector.<Long> = new Vector.<Long>();
         _loc2_.push(this.§@"z§.id);
         _loc2_.push(this.§default false§.id);
         this.§implements set extends§ = gameTypeRegistry.createClass(Long.getLong(14025,684260),_loc1_);
         gameTypeRegistry.createClass(Long.getLong(150325,6843660),_loc2_);
         this.§-c§ = spaceRegistry.getSpace(Long.getLong(10568210,51255591));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §[!E§.§?!I§:
               this.§@!`§(param1);
               break;
            case §[!E§.§default const package§:
               this.§]d§(param1);
               break;
            case §[!E§.§^_§:
               this.§,#b§(param1);
               break;
            case §[!E§.§;" §:
               this.§each catch with§(param1);
               break;
            case §[!E§.§;!K§:
               this.§`#%§(param1);
               break;
            case §[!E§.§1!]§:
               this.§`K§(param1);
               break;
            case §[!E§.§switch const§:
               this.§1"8§(param1);
               break;
            case §[!E§.§@#i§:
               this.§%#B§(param1);
               break;
            case §[!E§.§4!U§:
               this.§8#j§();
         }
      }
      
      private function §each catch with§(param1:Object) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:Object = JSON.parse(param1.json);
         for each(_loc3_ in _loc2_.effects)
         {
            IInitialEffectsService(OSGi.getInstance().getService(IInitialEffectsService)).addInitialEffect(_loc3_.userID,_loc3_.itemIndex,_loc3_.durationTime,_loc3_.effectLevel);
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         var _loc2_:Object = JSON.parse(param1.json);
         var _loc3_:Object = JSON.parse(_loc2_.map_graphic_data);
         var _loc4_:Object = JSON.parse(_loc2_.skybox);
         var _loc5_:Object = JSON.parse(_loc2_.lighting);
         var _loc6_:§package package override§;
         (_loc6_ = new §package package override§()).back = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.back)));
         _loc6_.bottom = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.bottom)));
         _loc6_.front = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.front)));
         _loc6_.left = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.left)));
         _loc6_.right = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.right)));
         _loc6_.top = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.top)));
         var _loc7_:§for var finally§ = new §for var finally§(new §include for true§(_loc3_.dustAlpha,_loc3_.dustDensity,_loc3_.dustFarDistance,_loc3_.dustNearDistance,MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_loc2_.dustParticle))),_loc3_.dustSize),new §static static§(_loc3_.angleX,_loc3_.angleZ,_loc3_.lightColor,_loc3_.shadowColor),new §switch var in§(_loc3_.fogAlpha,_loc3_.fogColor,_loc3_.farLimit,_loc3_.nearLimit),_loc3_.gravity,resourceRegistry.getResource(Long.getLong(0,_loc2_.mapId)) as MapResource,new §#">§(10,3,0),_loc3_.skyboxRevolutionSpeed,_loc6_,_loc3_.ssaoColor);
         var _loc8_:IGameObject = this.§-c§.createObject(Long.getLong(0,_loc2_.mapId),GameClass(gameTypeRegistry.getClass(Long.getLong(150325,6843660))),"BattlefieldModel object");
         Model.object = _loc8_;
         this.§@"z§.putInitParams(_loc7_);
         Model.popObject();
         var _loc9_:§const const case§ = new §const const case§(_loc5_.ctfLighting.redColor,_loc5_.ctfLighting.redColorIntensity);
         var _loc10_:§const const case§ = new §const const case§(_loc5_.ctfLighting.blueColor,_loc5_.ctfLighting.blueColorIntensity);
         var _loc11_:§implements set else§ = new §implements set else§(_loc9_,_loc10_,null,_loc5_.ctfLighting.attenuationBegin,_loc5_.ctfLighting.attenuationEnd);
         var _loc12_:§const const case§ = new §const const case§(_loc5_.dominationLighting.redPointColor,_loc5_.dominationLighting.redPointIntensity);
         var _loc13_:§const const case§ = new §const const case§(_loc5_.dominationLighting.bluePointColor,_loc5_.dominationLighting.bluePointIntensity);
         var _loc14_:§const const case§ = new §const const case§(_loc5_.dominationLighting.neutralPointColor,_loc5_.dominationLighting.neutralPointIntensity);
         var _loc15_:§implements set else§ = new §implements set else§(_loc9_,_loc10_,_loc14_,_loc5_.dominationLighting.attenuationBegin,_loc5_.dominationLighting.attenuationEnd);
         this.§get const true§.§@!z§(§final package import§.CTF,_loc11_);
         this.§get const true§.§@!z§(§final package import§.CP,_loc15_);
         var _loc16_:Object;
         (_loc16_ = new Object()).battleId = _loc2_.battleId;
         _loc16_.minRank = _loc2_.minRank;
         _loc16_.maxRank = _loc2_.maxRank;
         _loc16_.ambientSoundId = Long.getLong(0,_loc2_.sound_id);
         _loc16_.reArmorEnabled = _loc2_.reArmorEnabled;
         _loc16_.bonusLightIntensity = _loc2_.bonusLightIntensity;
         var _loc17_:Object = _loc2_.bonusColorAdjust;
         if(_loc17_ != null)
         {
            _loc16_.bonusColorAdjust = new ColorTransform(_loc17_.redMultiplier,_loc17_.greenMultiplier,_loc17_.blueMultiplier,_loc17_.alphaMultiplier,_loc17_.redOffset,_loc17_.greenOffset,_loc17_.blueOffset,_loc17_.alphaOffset);
         }
         else
         {
            _loc16_.bonusColorAdjust = new ColorTransform();
         }
         this.§default false§.initObject(_loc2_.active,_loc7_,null,_loc2_.kick_period_ms,_loc2_.map_id,_loc2_.invisible_time,_loc2_.skybox_id,_loc2_.spectator,_loc8_,_loc16_);
         this.§[#u§.objectLoaded();
      }
      
      private function §`K§(param1:Object) : void
      {
         var _loc10_:TankState = null;
         var _loc2_:Object = JSON.parse(param1.json);
         var _loc3_:Object = JSON.parse(_loc2_.partsObject);
         var _loc4_:ColoringCC = new ColoringCC();
         var _loc5_:Object3DSCC = new Object3DSCC();
         var _loc6_:Object3DSCC = new Object3DSCC();
         var _loc7_:§`"B§;
         (_loc7_ = new §`"B§()).engineIdleSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.engineIdleSound)));
         _loc7_.engineStartMovingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.engineStartMovingSound)));
         _loc7_.engineMovingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.engineMovingSound)));
         if(resourceRegistry.getResource(Long.getLong(0,_loc2_.colormap_id)) is MultiframeImageResource)
         {
            _loc4_.animatedColoring = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_loc2_.colormap_id)));
         }
         else
         {
            _loc4_.coloring = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc2_.colormap_id)));
         }
         _loc6_.resourceId = Long.getLong(0,_loc2_.hullResource);
         _loc5_.resourceId = Long.getLong(0,_loc2_.turretResource);
         var _loc8_:TankParts;
         (_loc8_ = new TankParts()).hullObject = new GameObject(Long.getLong(0,_loc2_.hullResource),this.§implements set extends§,_loc2_.hull_id,null);
         _loc8_.turretObject = new GameObject(Long.getLong(0,_loc2_.turretResource),this.§implements set extends§,_loc2_.turret_id,null);
         _loc8_.coloringObject = new GameObject(Long.getLong(0,_loc2_.colormap_id),this.§implements set extends§,_loc2_.colormap_id,null);
         Model.object = _loc8_.hullObject;
         this.§!!4§.putInitParams(_loc6_);
         this.§null catch false§.putInitParams(_loc7_);
         Model.popObject();
         Model.object = _loc8_.turretObject;
         this.§!!4§.putInitParams(_loc5_);
         Model.popObject();
         Model.object = _loc8_.coloringObject;
         this.§5#3§.putInitParams(_loc4_);
         Model.popObject();
         var _loc9_:TankSpecification;
         (_loc9_ = new TankSpecification()).speed = _loc2_.maxSpeed;
         _loc9_.turnSpeed = _loc2_.maxTurnSpeed;
         _loc9_.turretRotationSpeed = _loc2_.turret_turn_speed;
         _loc9_.acceleration = _loc2_.acceleration;
         _loc9_.dampingCoeff = _loc2_.dampingCoeff;
         _loc9_.reverseAcceleration = _loc2_.reverseAcceleration;
         _loc9_.reverseTurnAcceleration = _loc2_.reverseTurnAcceleration;
         _loc9_.sideAcceleration = _loc2_.sideAcceleration;
         _loc9_.turnAcceleration = _loc2_.turnAcceleration;
         _loc9_.turretTurnAcceleration = _loc2_.turretTurnAcceleration;
         if(!_loc2_.state_null)
         {
            (_loc10_ = new TankState()).health = _loc2_.health;
            _loc10_.orientation = §throw package each§.§,i§(_loc2_.orientation);
            _loc10_.position = §throw package each§.§,i§(_loc2_.position);
            _loc10_.turretAngle = _loc2_.turretAngle;
            _loc10_.turretControl = _loc2_.turretControl;
         }
         var _loc11_:ClientTank;
         (_loc11_ = new ClientTank()).health = _loc2_.health;
         _loc11_.incarnationId = _loc2_.incarnation;
         _loc11_.self = _loc2_.tank_id == this.userPropertiesService.userId;
         _loc11_.spawnState = §throw package each§.§break set static§(_loc2_.state);
         _loc11_.tankSpecification = _loc9_;
         _loc11_.tankState = _loc10_;
         _loc11_.teamType = §throw package each§.§return package extends§(_loc2_.team_type);
         var _loc12_:ClientObject = new ClientObject(_loc2_.tank_id,new ClientClass(_loc2_.tank_id,null,_loc2_.tank_id),_loc2_.tank_id,null);
         this.§,n§.initObject(_loc12_,_loc2_.mass,_loc8_,_loc2_.impact_force,_loc2_.kickback,_loc2_.turretTurnAcceleration,_loc2_.turret_turn_speed,_loc2_.nickname);
         WeaponsManager.§import set in§(_loc12_,_loc2_.turret_id,JSON.parse(_loc2_.sfxData),_loc8_.turretObject);
         this.§,n§.§`K§(_loc12_,_loc11_,_loc8_);
         this.§static set var§.objectLoaded();
      }
      
      private function §]d§(param1:Object) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:§do package do§ = null;
         var _loc6_:ClientObject = null;
         var _loc2_:§in const§ = §in const§(modelRegistry.getModelsByInterface(§=p§)[0]);
         var _loc3_:Object = JSON.parse(param1.json);
         for each(_loc4_ in _loc3_.bonuses)
         {
            _loc5_ = new §do package do§();
            _loc6_ = WeaponsManager.getObjectFor(_loc4_.id);
            _loc5_.§package set include§ = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.resourceId)));
            _loc5_.cordResource = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.cordResource)));
            _loc5_.lifeTimeMs = _loc4_.lifeTimeMs;
            _loc5_.parachuteInnerResource = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.parachuteInnerResource)));
            _loc5_.parachuteResource = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.parachuteResource)));
            _loc5_.pickupSoundResource = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.pickupSoundResource)));
            _loc2_.putInitParams(_loc5_);
            if(_loc6_.getParams(§in true§) == null)
            {
               this.§;!#§.putInitParams(new §4"e§(_loc4_.lighting.attenuationBegin,_loc4_.lighting.attenuationEnd,_loc4_.lighting.intensity,_loc4_.lighting.color));
               _loc6_.putParams(§in true§,this.§;!#§.§do const each§());
            }
            _loc2_.objectLoaded(_loc6_);
         }
      }
      
      private function §,#b§(param1:Object) : void
      {
         var _loc4_:Object = null;
         var _loc5_:BattleBonus = null;
         var _loc2_:* = JSON.parse(param1.json);
         var _loc3_:Array = new Array();
         for each(_loc4_ in _loc2_)
         {
            (_loc5_ = new BattleBonus()).id = _loc4_.id;
            _loc5_.objectId = _loc4_.id;
            _loc5_.position = new §#">§(_loc4_.position.x,_loc4_.position.y,_loc4_.position.z);
            _loc5_.timeFromAppearing = _loc4_.timeFromAppearing;
            _loc5_.timeLife = _loc4_.timeLife;
            _loc5_.object = WeaponsManager.getObjectFor(_loc5_.id.split("_")[0]);
            _loc3_.push(_loc5_);
         }
         this.§default false§.§,#b§(_loc3_);
      }
      
      private function §%#B§(param1:Object) : void
      {
         this.§default false§.§const var native§(WeaponsManager.getObjectFor(param1.bonusId.split("_")[0]),param1.bonusId,param1.position);
      }
      
      private function §1"8§(param1:Object) : void
      {
         this.§default false§.§1"8§(param1.bonusId);
      }
      
      private function §@!`§(param1:Object) : void
      {
         this.§default false§.§@!`§(param1.bonusId);
      }
      
      private function §8#j§() : void
      {
         var _loc2_:ClientObject = null;
         var _loc3_:§super var default§ = null;
         var _loc1_:§in const§ = §in const§(modelRegistry.getModelsByInterface(§=p§)[0]);
         for each(_loc2_ in §9#A§.§ !c§())
         {
            §2!s§(OSGi.getInstance().getService(§finally var return§)).objectUnloaded(_loc2_);
            this.§static set var§.objectUnloaded();
         }
         §function catch extends§(OSGi.getInstance().getService(§&"4§)).objectUnloaded();
         this.§break var set§.objectUnloaded();
         this.§<!p§.objectUnloaded();
         ObjectUnloadListener(OSGi.getInstance().getService(§if for else§)).objectUnloaded();
         OSGi.getInstance().unregisterService(§if for else§);
         ChatModel(modelRegistry.getModelsByInterface(§finally else§)[0]).objectUnloaded();
         WeaponsManager.destroy();
         _loc3_ = OSGi.getInstance().getService(§?"p§) as §super var default§;
         if(_loc3_ != null)
         {
            _loc3_.objectUnloaded();
            OSGi.getInstance().unregisterService(§?"p§);
         }
         var _loc4_:§=#@§ = OSGi.getInstance().getService(§throw var each§) as §=#@§;
         if(_loc4_ != null)
         {
            _loc4_.objectUnloaded();
            OSGi.getInstance().unregisterService(§throw var each§);
         }
         var _loc5_:§get for default§ = OSGi.getInstance().getService(§break for catch§) as §get for default§;
         if(_loc5_ != null)
         {
            _loc5_.objectUnloaded();
            OSGi.getInstance().unregisterService(§break for catch§);
         }
         var _loc6_:§'#;§ = §'#;§(modelRegistry.getModelsByInterface(§use catch true§)[0]);
         _loc6_.objectUnloaded();
         this.§%9§.objectUnloaded();
         this.§[#u§.objectUnloaded();
         this.§default false§.objectUnloaded();
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("armor"));
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("damage"));
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("health"));
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("nitro"));
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("gold"));
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("crystall"));
      }
   }
}


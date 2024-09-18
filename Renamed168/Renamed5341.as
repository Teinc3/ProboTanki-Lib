package Renamed2402
{
   import Renamed137.Renamed2400;
   import Renamed142.Renamed2741;
   import Renamed4548.Renamed4551;
   import Renamed17.Renamed4557;
   import Renamed17.Renamed18;
   import Renamed199.Renamed3823;
   import Renamed199.Renamed3820;
   import Renamed224.Renamed4580;
   import Renamed224.Renamed4581;
   import Renamed29.Renamed30;
   import Renamed3253.Renamed4589;
   import Renamed259.Renamed4600;
   import Renamed602.Renamed603;
   import Renamed37.Renamed38;
   import Renamed306.Renamed2404;
   import Renamed306.Renamed1344;
   import Renamed306.Renamed2521;
   import Renamed306.Renamed2405;
   import Renamed306.Renamed2406;
   import Renamed475.Renamed4630;
   import Renamed475.Renamed4631;
   import Renamed487.Renamed4636;
   import Renamed487.Renamed5336;
   import Renamed485.Renamed4639;
   import Renamed4645.Renamed5337;
   import Renamed2615.Renamed2757;
   import Renamed2615.Renamed2616;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.register.ClientClass;
   import alternativa.tanks.models.battle.battlefield.Renamed2417;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import alternativa.tanks.models.battle.gui.chat.ChatModel;
   import alternativa.tanks.models.battle.gui.chat.Renamed2566;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.types.Long;
   import Renamed325.Renamed2411;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankParts;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankState;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.BattleBonus;
   import com.alternativaplatform.projects.tanks.client.models.tank.ClientTank;
   import Renamed358.Renamed5338;
   import Renamed361.Renamed5339;
   import Renamed364.Renamed4676;
   import flash.geom.ColorTransform;
   import Renamed375.Renamed4682;
   import Renamed385.Renamed4886;
   import Renamed403.Renamed4702;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import platform.client.fp10.core.type.impl.GameClass;
   import platform.client.fp10.core.type.impl.GameObject;
   import projects.tanks.client.battleservice.Renamed1587;
   import projects.tanks.client.commons.models.coloring.ColoringCC;
   import projects.tanks.client.garage.models.item.object3ds.Object3DSCC;
   import projects.tanks.clients.flash.commons.models.coloring.ColoringModel;
   import projects.tanks.clients.flash.resources.object3ds.Object3DSModel;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import scpacker.tanks.WeaponsManager;
   import scpacker.utils.Renamed5340;
   import Renamed87.Renamed88;
   import Renamed87.Renamed4711;
   
   public class Renamed5341 extends Renamed4886
   {
      private var Renamed5342:Renamed2417;
      
      private var Renamed5343:ColoringModel;
      
      private var Renamed5344:Object3DSModel;
      
      private var Renamed5345:Renamed4682;
      
      private var Renamed5346:Renamed4589;
      
      private var Renamed5347:Renamed4600;
      
      private var Renamed5348:Renamed4702;
      
      private var Renamed114:Renamed88;
      
      private var Renamed2969:Renamed2407;
      
      private var Renamed119:Renamed30;
      
      private var Renamed120:Renamed38;
      
      private var Renamed5349:Renamed4676;
      
      private var Renamed5350:Renamed4551;
      
      private var Renamed5351:Renamed4636;
      
      private var userPropertiesService:IUserPropertiesService;
      
      private var Renamed4730:ILightingEffectsService;
      
      private var Renamed121:ISpace;
      
      private var Renamed5352:GameClass;
      
      public var modelId:int;
      
      public function Renamed5341()
      {
         super();
         this.modelId = 36;
         this.Renamed5343 = ColoringModel(modelRegistry.getModel(Long.getLong(947299051,-358915161)));
         this.Renamed5344 = Object3DSModel(modelRegistry.getModel(Long.getLong(1497301838,-1092921347)));
         this.Renamed5345 = Renamed4682(modelRegistry.getModel(Long.getLong(923418047,-17313881)));
         this.Renamed5346 = Renamed4589(modelRegistry.getModel(Long.getLong(1099120188,-904226430)));
         this.Renamed5347 = Renamed4600(modelRegistry.getModel(Long.getLong(1129811198,-16275595)));
         this.Renamed5342 = Renamed2417(modelRegistry.getModel(Long.getLong(1723277227,1936126557)));
         this.Renamed5348 = Renamed4702(modelRegistry.getModel(Long.getLong(1092696378,-225264163)));
         this.Renamed114 = Renamed88(modelRegistry.getModelsByInterface(Renamed4711)[0]);
         this.Renamed2969 = Renamed2407(modelRegistry.getModelsByInterface(Renamed2408)[0]);
         this.Renamed119 = Renamed30(modelRegistry.getModel(Long.getLong(815932807,-684891581)));
         this.Renamed120 = Renamed38(modelRegistry.getModel(Long.getLong(759725658,1071543601)));
         this.Renamed5349 = Renamed4676(modelRegistry.getModel(Long.getLong(1983242842,420087132)));
         this.Renamed5350 = Renamed4551(modelRegistry.getModel(Long.getLong(1545673170,1705258317)));
         this.Renamed5351 = Renamed4636(modelRegistry.getModel(Long.getLong(1742678945,1383804656)));
         this.userPropertiesService = IUserPropertiesService(OSGi.getInstance().getService(IUserPropertiesService));
         Renamed2775 = TankUsersRegistry(OSGi.getInstance().getService(TankUsersRegistry));
         this.Renamed4730 = ILightingEffectsService(OSGi.getInstance().getService(ILightingEffectsService));
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(this.Renamed5343.id);
         _loc1_.push(this.Renamed5344.id);
         _loc1_.push(this.Renamed5345.id);
         _loc1_.push(this.Renamed5346.id);
         _loc1_.push(this.Renamed5347.id);
         var _loc2_:Vector.<Long> = new Vector.<Long>();
         _loc2_.push(this.Renamed5348.id);
         _loc2_.push(this.Renamed5342.id);
         this.Renamed5352 = gameTypeRegistry.createClass(Long.getLong(14025,684260),_loc1_);
         gameTypeRegistry.createClass(Long.getLong(150325,6843660),_loc2_);
         this.Renamed121 = spaceRegistry.getSpace(Long.getLong(10568210,51255591));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed5353.Renamed5354:
               this.Renamed2486(param1);
               break;
            case Renamed5353.Renamed5355:
               this.Renamed5356(param1);
               break;
            case Renamed5353.Renamed5357:
               this.Renamed2482(param1);
               break;
            case Renamed5353.Renamed5358:
               this.Renamed5359(param1);
               break;
            case Renamed5353.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed5353.Renamed5360:
               this.Renamed2871(param1);
               break;
            case Renamed5353.Renamed5361:
               this.Renamed2485(param1);
               break;
            case Renamed5353.Renamed5362:
               this.Renamed5363(param1);
               break;
            case Renamed5353.Renamed5364:
               this.Renamed5365();
         }
      }
      
      private function Renamed5359(param1:Object) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:Object = JSON.parse(param1.json);
         for each(_loc3_ in _loc2_.effects)
         {
            IInitialEffectsService(OSGi.getInstance().getService(IInitialEffectsService)).addInitialEffect(_loc3_.userID,_loc3_.itemIndex,_loc3_.durationTime,_loc3_.effectLevel);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         var _loc2_:Object = JSON.parse(param1.json);
         var _loc3_:Object = JSON.parse(_loc2_.map_graphic_data);
         var _loc4_:Object = JSON.parse(_loc2_.skybox);
         var _loc5_:Object = JSON.parse(_loc2_.lighting);
         var _loc6_:Renamed2521;
         (_loc6_ = new Renamed2521()).back = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.back)));
         _loc6_.bottom = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.bottom)));
         _loc6_.front = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.front)));
         _loc6_.left = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.left)));
         _loc6_.right = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.right)));
         _loc6_.top = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.top)));
         var _loc7_:Renamed2404 = new Renamed2404(new Renamed1344(_loc3_.dustAlpha,_loc3_.dustDensity,_loc3_.dustFarDistance,_loc3_.dustNearDistance,MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_loc2_.dustParticle))),_loc3_.dustSize),new Renamed2405(_loc3_.angleX,_loc3_.angleZ,_loc3_.lightColor,_loc3_.shadowColor),new Renamed2406(_loc3_.fogAlpha,_loc3_.fogColor,_loc3_.farLimit,_loc3_.nearLimit),_loc3_.gravity,resourceRegistry.getResource(Long.getLong(0,_loc2_.mapId)) as MapResource,new Renamed603(10,3,0),_loc3_.skyboxRevolutionSpeed,_loc6_,_loc3_.ssaoColor);
         var _loc8_:IGameObject = this.Renamed121.createObject(Long.getLong(0,_loc2_.mapId),GameClass(gameTypeRegistry.getClass(Long.getLong(150325,6843660))),"BattlefieldModel object");
         Model.object = _loc8_;
         this.Renamed5348.putInitParams(_loc7_);
         Model.popObject();
         var _loc9_:Renamed3823 = new Renamed3823(_loc5_.ctfLighting.redColor,_loc5_.ctfLighting.redColorIntensity);
         var _loc10_:Renamed3823 = new Renamed3823(_loc5_.ctfLighting.blueColor,_loc5_.ctfLighting.blueColorIntensity);
         var _loc11_:Renamed3820 = new Renamed3820(_loc9_,_loc10_,null,_loc5_.ctfLighting.attenuationBegin,_loc5_.ctfLighting.attenuationEnd);
         var _loc12_:Renamed3823 = new Renamed3823(_loc5_.dominationLighting.redPointColor,_loc5_.dominationLighting.redPointIntensity);
         var _loc13_:Renamed3823 = new Renamed3823(_loc5_.dominationLighting.bluePointColor,_loc5_.dominationLighting.bluePointIntensity);
         var _loc14_:Renamed3823 = new Renamed3823(_loc5_.dominationLighting.neutralPointColor,_loc5_.dominationLighting.neutralPointIntensity);
         var _loc15_:Renamed3820 = new Renamed3820(_loc9_,_loc10_,_loc14_,_loc5_.dominationLighting.attenuationBegin,_loc5_.dominationLighting.attenuationEnd);
         this.Renamed4730.Renamed3821(Renamed1587.CTF,_loc11_);
         this.Renamed4730.Renamed3821(Renamed1587.CP,_loc15_);
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
         this.Renamed5342.initObject(_loc2_.active,_loc7_,null,_loc2_.kick_period_ms,_loc2_.map_id,_loc2_.invisible_time,_loc2_.skybox_id,_loc2_.spectator,_loc8_,_loc16_);
         this.Renamed5349.objectLoaded();
      }
      
      private function Renamed2871(param1:Object) : void
      {
         var _loc10_:TankState = null;
         var _loc2_:Object = JSON.parse(param1.json);
         var _loc3_:Object = JSON.parse(_loc2_.partsObject);
         var _loc4_:ColoringCC = new ColoringCC();
         var _loc5_:Object3DSCC = new Object3DSCC();
         var _loc6_:Object3DSCC = new Object3DSCC();
         var _loc7_:Renamed5339;
         (_loc7_ = new Renamed5339()).engineIdleSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.engineIdleSound)));
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
         (_loc8_ = new TankParts()).hullObject = new GameObject(Long.getLong(0,_loc2_.hullResource),this.Renamed5352,_loc2_.hull_id,null);
         _loc8_.turretObject = new GameObject(Long.getLong(0,_loc2_.turretResource),this.Renamed5352,_loc2_.turret_id,null);
         _loc8_.coloringObject = new GameObject(Long.getLong(0,_loc2_.colormap_id),this.Renamed5352,_loc2_.colormap_id,null);
         Model.object = _loc8_.hullObject;
         this.Renamed5344.putInitParams(_loc6_);
         this.Renamed5345.putInitParams(_loc7_);
         Model.popObject();
         Model.object = _loc8_.turretObject;
         this.Renamed5344.putInitParams(_loc5_);
         Model.popObject();
         Model.object = _loc8_.coloringObject;
         this.Renamed5343.putInitParams(_loc4_);
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
            _loc10_.orientation = Renamed5340.Renamed677(_loc2_.orientation);
            _loc10_.position = Renamed5340.Renamed677(_loc2_.position);
            _loc10_.turretAngle = _loc2_.turretAngle;
            _loc10_.turretControl = _loc2_.turretControl;
         }
         var _loc11_:ClientTank;
         (_loc11_ = new ClientTank()).health = _loc2_.health;
         _loc11_.incarnationId = _loc2_.incarnation;
         _loc11_.self = _loc2_.tank_id == this.userPropertiesService.userId;
         _loc11_.spawnState = Renamed5340.Renamed5366(_loc2_.state);
         _loc11_.tankSpecification = _loc9_;
         _loc11_.tankState = _loc10_;
         _loc11_.teamType = Renamed5340.Renamed5367(_loc2_.team_type);
         var _loc12_:ClientObject = new ClientObject(_loc2_.tank_id,new ClientClass(_loc2_.tank_id,null,_loc2_.tank_id),_loc2_.tank_id,null);
         this.Renamed2969.initObject(_loc12_,_loc2_.mass,_loc8_,_loc2_.impact_force,_loc2_.kickback,_loc2_.turretTurnAcceleration,_loc2_.turret_turn_speed,_loc2_.nickname);
         WeaponsManager.Renamed5368(_loc12_,_loc2_.turret_id,JSON.parse(_loc2_.sfxData),_loc8_.turretObject);
         this.Renamed2969.Renamed2871(_loc12_,_loc11_,_loc8_);
         this.Renamed5350.objectLoaded();
      }
      
      private function Renamed5356(param1:Object) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:Renamed5338 = null;
         var _loc6_:ClientObject = null;
         var _loc2_:Renamed2411 = Renamed2411(modelRegistry.getModelsByInterface(Renamed2400)[0]);
         var _loc3_:Object = JSON.parse(param1.json);
         for each(_loc4_ in _loc3_.bonuses)
         {
            _loc5_ = new Renamed5338();
            _loc6_ = WeaponsManager.getObjectFor(_loc4_.id);
            _loc5_.Renamed5369 = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,_loc4_.resourceId)));
            _loc5_.cordResource = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.cordResource)));
            _loc5_.lifeTimeMs = _loc4_.lifeTimeMs;
            _loc5_.parachuteInnerResource = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.parachuteInnerResource)));
            _loc5_.parachuteResource = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.parachuteResource)));
            _loc5_.pickupSoundResource = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.pickupSoundResource)));
            _loc2_.putInitParams(_loc5_);
            if(_loc6_.getParams(Renamed5336) == null)
            {
               this.Renamed5351.putInitParams(new Renamed5337(_loc4_.lighting.attenuationBegin,_loc4_.lighting.attenuationEnd,_loc4_.lighting.intensity,_loc4_.lighting.color));
               _loc6_.putParams(Renamed5336,this.Renamed5351.Renamed5370());
            }
            _loc2_.objectLoaded(_loc6_);
         }
      }
      
      private function Renamed2482(param1:Object) : void
      {
         var _loc4_:Object = null;
         var _loc5_:BattleBonus = null;
         var _loc2_:* = JSON.parse(param1.json);
         var _loc3_:Array = new Array();
         for each(_loc4_ in _loc2_)
         {
            (_loc5_ = new BattleBonus()).id = _loc4_.id;
            _loc5_.objectId = _loc4_.id;
            _loc5_.position = new Renamed603(_loc4_.position.x,_loc4_.position.y,_loc4_.position.z);
            _loc5_.timeFromAppearing = _loc4_.timeFromAppearing;
            _loc5_.timeLife = _loc4_.timeLife;
            _loc5_.object = WeaponsManager.getObjectFor(_loc5_.id.split("_")[0]);
            _loc3_.push(_loc5_);
         }
         this.Renamed5342.Renamed2482(_loc3_);
      }
      
      private function Renamed5363(param1:Object) : void
      {
         this.Renamed5342.Renamed2484(WeaponsManager.getObjectFor(param1.bonusId.split("_")[0]),param1.bonusId,param1.position);
      }
      
      private function Renamed2485(param1:Object) : void
      {
         this.Renamed5342.Renamed2485(param1.bonusId);
      }
      
      private function Renamed2486(param1:Object) : void
      {
         this.Renamed5342.Renamed2486(param1.bonusId);
      }
      
      private function Renamed5365() : void
      {
         var _loc2_:ClientObject = null;
         var _loc3_:Renamed18 = null;
         var _loc1_:Renamed2411 = Renamed2411(modelRegistry.getModelsByInterface(Renamed2400)[0]);
         for each(_loc2_ in Renamed2775.Renamed2895())
         {
            Renamed2407(OSGi.getInstance().getService(Renamed2408)).objectUnloaded(_loc2_);
            this.Renamed5350.objectUnloaded();
         }
         Renamed2757(OSGi.getInstance().getService(Renamed2553)).objectUnloaded();
         this.Renamed120.objectUnloaded();
         this.Renamed119.objectUnloaded();
         ObjectUnloadListener(OSGi.getInstance().getService(Renamed2616)).objectUnloaded();
         OSGi.getInstance().unregisterService(Renamed2616);
         ChatModel(modelRegistry.getModelsByInterface(Renamed2566)[0]).objectUnloaded();
         WeaponsManager.destroy();
         _loc3_ = OSGi.getInstance().getService(Renamed4557) as Renamed18;
         if(_loc3_ != null)
         {
            _loc3_.objectUnloaded();
            OSGi.getInstance().unregisterService(Renamed4557);
         }
         var _loc4_:Renamed4630 = OSGi.getInstance().getService(Renamed4631) as Renamed4630;
         if(_loc4_ != null)
         {
            _loc4_.objectUnloaded();
            OSGi.getInstance().unregisterService(Renamed4631);
         }
         var _loc5_:Renamed4581 = OSGi.getInstance().getService(Renamed4580) as Renamed4581;
         if(_loc5_ != null)
         {
            _loc5_.objectUnloaded();
            OSGi.getInstance().unregisterService(Renamed4580);
         }
         var _loc6_:Renamed4639 = Renamed4639(modelRegistry.getModelsByInterface(Renamed2741)[0]);
         _loc6_.objectUnloaded();
         this.Renamed114.objectUnloaded();
         this.Renamed5349.objectUnloaded();
         this.Renamed5342.objectUnloaded();
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("armor"));
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("damage"));
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("health"));
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("nitro"));
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("gold"));
         _loc1_.objectUnloaded(WeaponsManager.getObjectFor("crystall"));
      }
   }
}


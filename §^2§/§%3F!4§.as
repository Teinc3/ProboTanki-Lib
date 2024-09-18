package §^2§
{
   import §!#%§.BattleTeamItemModel;
   import §-#e§.BattleDMItemModel;
   import §?#!§.§dynamic const function§;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.battleselect.BattleSelectModel;
   import alternativa.tanks.model.item.BattleItemModel;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.types.Long;
   import §each else§.§,#D§;
   import §if try§.§return package if§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   import projects.tanks.client.battleservice.§<#p§;
   import projects.tanks.client.battleservice.§final package import§;
   import scpacker.utils.§throw package each§;
   import §static set get§.§switch package class§;
   
   public class §?!4§ extends §return package if§
   {
      private var §super super§:BattleSelectModel;
      
      private var §>!Z§:BattleItemModel;
      
      private var §""X§:BattleDMItemModel;
      
      private var §`!F§:BattleTeamItemModel;
      
      private var achievementService:IAchievementService;
      
      private var §;"%§:ISpace;
      
      private var §in var throw§:ISpace;
      
      public var modelId:int;
      
      public function §?!4§()
      {
         super();
         this.modelId = 31;
         this.§super super§ = BattleSelectModel(modelRegistry.getModel(Long.getLong(0,300090011)));
         this.§>!Z§ = BattleItemModel(modelRegistry.getModel(Long.getLong(0,300090008)));
         this.§""X§ = BattleDMItemModel(modelRegistry.getModel(Long.getLong(0,300090004)));
         this.§`!F§ = BattleTeamItemModel(modelRegistry.getModel(Long.getLong(0,300090028)));
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(this.§>!Z§.id);
         _loc1_.push(this.§""X§.id);
         gameTypeRegistry.createClass(Long.getLong(5823623,5812059),_loc1_);
         _loc1_ = new Vector.<Long>();
         _loc1_.push(Long.getLong(0,300090007));
         _loc1_.push(Long.getLong(0,300090003));
         _loc1_.push(Long.getLong(0,300090023));
         gameTypeRegistry.createClass(Long.getLong(5823622,5812058),_loc1_);
         _loc1_ = new Vector.<Long>();
         _loc1_.push(this.§>!Z§.id);
         _loc1_.push(this.§`!F§.id);
         gameTypeRegistry.createClass(Long.getLong(58236221,58120558),_loc1_);
         _loc1_ = new Vector.<Long>();
         _loc1_.push(Long.getLong(0,300090007));
         _loc1_.push(Long.getLong(0,300090027));
         _loc1_.push(Long.getLong(0,300090023));
         gameTypeRegistry.createClass(Long.getLong(58236223,58120559),_loc1_);
         this.§;"%§ = spaceRegistry.getSpace(Long.getLong(59235923,646943));
         this.§in var throw§ = ISpace(spaceRegistry.getSpace(Long.getLong(52835823,6349643)));
         this.achievementService = IAchievementService(OSGi.getInstance().getService(IAchievementService));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §5#o§.§]u§:
               this.§throw var use§(param1);
               break;
            case §5#o§.§var var implements§:
               this.battleItemsPacketJoinSuccess(param1);
               break;
            case §5#o§.§;#&§:
               this.removeBattle(param1);
               break;
            case §5#o§.§set package super§:
               this.select(param1);
               break;
            case §5#o§.§4!U§:
               this.§8#j§();
         }
      }
      
      private function battleItemsPacketJoinSuccess(param1:Object) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:Object = JSON.parse(param1.json);
         this.§super super§.objectLoadedPost();
         for each(_loc3_ in _loc2_.battles)
         {
            this.§const package set§(_loc3_);
         }
         this.§super super§.battleItemsPacketJoinSuccess();
         this.achievementService.setPanelPartition(2);
      }
      
      private function select(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§;"%§.getObjectByName("BattleSelectObject");
         Model.object = _loc2_;
         this.§super super§.select(param1.item);
         Model.popObject();
      }
      
      private function §throw var use§(param1:Object) : void
      {
         this.§const package set§(JSON.parse(param1.json));
      }
      
      private function removeBattle(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§;"%§.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.§;"%§.destroyObject(_loc2_.id);
            Model.popObject();
         }
      }
      
      private function §const package set§(param1:Object) : void
      {
         var _loc3_:IGameObject = null;
         var _loc4_:BattleItemCC = null;
         var _loc5_:§switch package class§ = null;
         var _loc6_:* = undefined;
         var _loc7_:§dynamic const function§ = null;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc2_:IGameClass = gameTypeRegistry.getClass(Long.getLong(5823623,5812059));
         if(§throw package each§.§get true§(param1.battleMode) != §final package import§.DM)
         {
            _loc2_ = gameTypeRegistry.getClass(Long.getLong(58236221,58120558));
         }
         if(_loc2_ != null)
         {
            if(this.§;"%§.getObjectByName(param1.battleId) != null)
            {
               this.§;"%§.destroyObject(this.§;"%§.getObjectByName(param1.battleId).id);
            }
            _loc3_ = this.§;"%§.createObject(§,#D§.§return set extends§(),_loc2_,param1.battleId);
            (_loc4_ = new BattleItemCC()).battleId = param1.battleId;
            _loc4_.battleMode = §throw package each§.§get true§(param1.battleMode);
            _loc4_.map = this.§;"%§.getObject(Long.getLong(param1.preview * 1000,param1.preview * 1000));
            _loc4_.maxPeople = param1.maxPeople;
            _loc4_.name = param1.name;
            _loc4_.privateBattle = param1.privateBattle;
            _loc4_.proBattle = param1.proBattle;
            _loc4_.rankRange = new §<#p§(param1.maxRank,param1.minRank);
            _loc4_.suspicionLevel = §throw package each§.§8!t§(param1.suspicionLevel);
            _loc4_.equipmentConstraintsMode = §throw package each§.§#! §(param1.equipmentConstraintsMode);
            _loc4_.parkourMode = param1.parkourMode;
            Model.object = _loc3_;
            this.§>!Z§.putInitParams(_loc4_);
            if(§throw package each§.§get true§(param1.battleMode) == §final package import§.DM)
            {
               (_loc5_ = new §switch package class§()).users = new Vector.<String>();
               for each(_loc6_ in param1.users)
               {
                  _loc5_.users.push(_loc6_);
               }
               this.§""X§.putInitParams(_loc5_);
               this.§""X§.objectLoaded();
            }
            else
            {
               (_loc7_ = new §dynamic const function§()).usersBlue = new Vector.<String>();
               _loc7_.usersRed = new Vector.<String>();
               for each(_loc8_ in param1.usersBlue)
               {
                  _loc7_.usersBlue.push(_loc8_);
               }
               for each(_loc9_ in param1.usersRed)
               {
                  _loc7_.usersRed.push(_loc9_);
               }
               this.§`!F§.putInitParams(_loc7_);
               this.§`!F§.objectLoaded();
            }
            this.§>!Z§.objectLoadedPost();
            Model.popObject();
         }
      }
      
      private function §8#j§() : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:IGameObject = null;
         var _loc4_:Vector.<IGameObject> = null;
         var _loc1_:Vector.<IGameObject> = new Vector.<IGameObject>();
         for each(_loc2_ in this.§;"%§.objects)
         {
            _loc1_.push(_loc2_);
         }
         _loc1_.reverse();
         for each(_loc3_ in _loc1_)
         {
            this.§;"%§.destroyObject(_loc3_.id);
         }
         _loc4_ = new Vector.<IGameObject>();
         for each(_loc2_ in this.§in var throw§.objects)
         {
            _loc4_.push(_loc2_);
         }
         for each(_loc3_ in _loc4_)
         {
            this.§in var throw§.destroyObject(_loc3_.id);
         }
      }
   }
}


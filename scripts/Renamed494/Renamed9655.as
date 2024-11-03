package Renamed494
{
   import Renamed144.BattleTeamItemModel;
   import Renamed216.BattleDMItemModel;
   import Renamed4745.Renamed5678;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.battleselect.BattleSelectModel;
   import alternativa.tanks.model.item.BattleItemModel;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.types.Long;
   import Renamed347.Renamed5566;
   import Renamed385.Renamed4886;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   import scpacker.utils.Renamed5340;
   import Renamed424.Renamed8748;
   
   public class Renamed9646 extends Renamed4886
   {
      private var Renamed9647:BattleSelectModel;
      
      private var Renamed8427:BattleItemModel;
      
      private var Renamed8428:BattleDMItemModel;
      
      private var Renamed8429:BattleTeamItemModel;
      
      private var achievementService:IAchievementService;
      
      private var Renamed7632:ISpace;
      
      private var Renamed7633:ISpace;
      
      public var modelId:int;
      
      public function Renamed9646()
      {
         super();
         this.modelId = 31;
         this.Renamed9647 = BattleSelectModel(modelRegistry.getModel(Long.getLong(0,300090011)));
         this.Renamed8427 = BattleItemModel(modelRegistry.getModel(Long.getLong(0,300090008)));
         this.Renamed8428 = BattleDMItemModel(modelRegistry.getModel(Long.getLong(0,300090004)));
         this.Renamed8429 = BattleTeamItemModel(modelRegistry.getModel(Long.getLong(0,300090028)));
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(this.Renamed8427.id);
         _loc1_.push(this.Renamed8428.id);
         gameTypeRegistry.createClass(Long.getLong(5823623,5812059),_loc1_);
         _loc1_ = new Vector.<Long>();
         _loc1_.push(Long.getLong(0,300090007));
         _loc1_.push(Long.getLong(0,300090003));
         _loc1_.push(Long.getLong(0,300090023));
         gameTypeRegistry.createClass(Long.getLong(5823622,5812058),_loc1_);
         _loc1_ = new Vector.<Long>();
         _loc1_.push(this.Renamed8427.id);
         _loc1_.push(this.Renamed8429.id);
         gameTypeRegistry.createClass(Long.getLong(58236221,58120558),_loc1_);
         _loc1_ = new Vector.<Long>();
         _loc1_.push(Long.getLong(0,300090007));
         _loc1_.push(Long.getLong(0,300090027));
         _loc1_.push(Long.getLong(0,300090023));
         gameTypeRegistry.createClass(Long.getLong(58236223,58120559),_loc1_);
         this.Renamed7632 = spaceRegistry.getSpace(Long.getLong(59235923,646943));
         this.Renamed7633 = ISpace(spaceRegistry.getSpace(Long.getLong(52835823,6349643)));
         this.achievementService = IAchievementService(OSGi.getInstance().getService(IAchievementService));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9648.Renamed9649:
               this.Renamed9650(param1);
               break;
            case Renamed9648.Renamed9651:
               this.battleItemsPacketJoinSuccess(param1);
               break;
            case Renamed9648.Renamed9652:
               this.removeBattle(param1);
               break;
            case Renamed9648.Renamed5604:
               this.select(param1);
               break;
            case Renamed9648.CodecRegisterer4:
               this.CodecRegisterer5();
         }
      }
      
      private function battleItemsPacketJoinSuccess(param1:Object) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:Object = JSON.parse(param1.json);
         this.Renamed9647.objectLoadedPost();
         for each(_loc3_ in _loc2_.battles)
         {
            this.Renamed9653(_loc3_);
         }
         this.Renamed9647.battleItemsPacketJoinSuccess();
         this.achievementService.setPanelPartition(2);
      }
      
      private function select(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7632.getObjectByName("BattleSelectObject");
         Model.object = _loc2_;
         this.Renamed9647.select(param1.item);
         Model.popObject();
      }
      
      private function Renamed9650(param1:Object) : void
      {
         this.Renamed9653(JSON.parse(param1.json));
      }
      
      private function removeBattle(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7632.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.Renamed7632.destroyObject(_loc2_.id);
            Model.popObject();
         }
      }
      
      private function Renamed9653(param1:Object) : void
      {
         var _loc3_:IGameObject = null;
         var _loc4_:BattleItemCC = null;
         var _loc5_:Renamed8748 = null;
         var _loc6_:* = undefined;
         var _loc7_:Renamed5678 = null;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc2_:IGameClass = gameTypeRegistry.getClass(Long.getLong(5823623,5812059));
         if(Renamed5340.Renamed6898(param1.battleMode) != Renamed1587.DM)
         {
            _loc2_ = gameTypeRegistry.getClass(Long.getLong(58236221,58120558));
         }
         if(_loc2_ != null)
         {
            if(this.Renamed7632.getObjectByName(param1.battleId) != null)
            {
               this.Renamed7632.destroyObject(this.Renamed7632.getObjectByName(param1.battleId).id);
            }
            _loc3_ = this.Renamed7632.createObject(Renamed5566.Renamed5611(),_loc2_,param1.battleId);
            (_loc4_ = new BattleItemCC()).battleId = param1.battleId;
            _loc4_.battleMode = Renamed5340.Renamed6898(param1.battleMode);
            _loc4_.map = this.Renamed7632.getObject(Long.getLong(param1.preview * 1000,param1.preview * 1000));
            _loc4_.maxPeople = param1.maxPeople;
            _loc4_.name = param1.name;
            _loc4_.privateBattle = param1.privateBattle;
            _loc4_.proBattle = param1.proBattle;
            _loc4_.rankRange = new Renamed1586(param1.maxRank,param1.minRank);
            _loc4_.suspicionLevel = Renamed5340.Renamed9654(param1.suspicionLevel);
            _loc4_.equipmentConstraintsMode = Renamed5340.Renamed7638(param1.equipmentConstraintsMode);
            _loc4_.parkourMode = param1.parkourMode;
            Model.object = _loc3_;
            this.Renamed8427.putInitParams(_loc4_);
            if(Renamed5340.Renamed6898(param1.battleMode) == Renamed1587.DM)
            {
               (_loc5_ = new Renamed8748()).users = new Vector.<String>();
               for each(_loc6_ in param1.users)
               {
                  _loc5_.users.push(_loc6_);
               }
               this.Renamed8428.putInitParams(_loc5_);
               this.Renamed8428.objectLoaded();
            }
            else
            {
               (_loc7_ = new Renamed5678()).usersBlue = new Vector.<String>();
               _loc7_.usersRed = new Vector.<String>();
               for each(_loc8_ in param1.usersBlue)
               {
                  _loc7_.usersBlue.push(_loc8_);
               }
               for each(_loc9_ in param1.usersRed)
               {
                  _loc7_.usersRed.push(_loc9_);
               }
               this.Renamed8429.putInitParams(_loc7_);
               this.Renamed8429.objectLoaded();
            }
            this.Renamed8427.objectLoadedPost();
            Model.popObject();
         }
      }
      
      private function CodecRegisterer5() : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:IGameObject = null;
         var _loc4_:Vector.<IGameObject> = null;
         var _loc1_:Vector.<IGameObject> = new Vector.<IGameObject>();
         for each(_loc2_ in this.Renamed7632.objects)
         {
            _loc1_.push(_loc2_);
         }
         _loc1_.reverse();
         for each(_loc3_ in _loc1_)
         {
            this.Renamed7632.destroyObject(_loc3_.id);
         }
         _loc4_ = new Vector.<IGameObject>();
         for each(_loc2_ in this.Renamed7633.objects)
         {
            _loc4_.push(_loc2_);
         }
         for each(_loc3_ in _loc4_)
         {
            this.Renamed7633.destroyObject(_loc3_.id);
         }
      }
   }
}


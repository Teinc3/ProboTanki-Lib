package Renamed311
{
   import Renamed195.Renamed4749;
   import Renamed4741.Renamed7087;
   import Renamed4743.Renamed5643;
   import alternativa.tanks.model.info.Renamed2119;
   import alternativa.types.Long;
   import Renamed312.Renamed1585;
   import Renamed347.Renamed5566;
   import Renamed353.BattleTeamInfoModel;
   import Renamed385.Renamed4886;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import projects.tanks.client.battleselect.model.info.Renamed2118;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   import scpacker.utils.Renamed5340;
   import Renamed423.BattleDmInfoModel;
   import Renamed453.Renamed7626;
   
   public class Renamed7627 extends Renamed4886
   {
      private var Renamed7628:Renamed2119;
      
      private var Renamed7629:BattleDmInfoModel;
      
      private var Renamed7630:BattleTeamInfoModel;
      
      private var Renamed7631:Renamed4749;
      
      private var Renamed7632:ISpace;
      
      private var Renamed7633:ISpace;
      
      public var modelId:int;
      
      public function Renamed7627()
      {
         super();
         this.modelId = 33;
         this.Renamed7628 = Renamed2119(modelRegistry.getModel(Long.getLong(0,300090007)));
         this.Renamed7629 = BattleDmInfoModel(modelRegistry.getModel(Long.getLong(0,300090003)));
         this.Renamed7630 = BattleTeamInfoModel(modelRegistry.getModel(Long.getLong(0,300090027)));
         this.Renamed7631 = Renamed4749(modelRegistry.getModel(Long.getLong(0,300090023)));
         this.Renamed7632 = ISpace(spaceRegistry.getSpace(Long.getLong(59235923,646943)));
         this.Renamed7633 = ISpace(spaceRegistry.getSpace(Long.getLong(52835823,6349643)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7601.Renamed7616:
               this.addUser(param1);
               break;
            case Renamed7601.Renamed7609:
               this.addUserTeam(param1);
               break;
            case Renamed7601.Renamed7606:
               this.battleStop(param1);
               break;
            case Renamed7601.Renamed7607:
               this.Renamed7634(param1);
               break;
            case Renamed7601.Renamed7613:
               this.Renamed7635(param1);
               break;
            case Renamed7601.Renamed7618:
               this.Renamed2123(param1);
               break;
            case Renamed7601.Renamed7605:
               this.Renamed7636(param1);
               break;
            case Renamed7601.Renamed7612:
               this.removeUser(param1);
               break;
            case Renamed7601.Renamed7604:
               this.roundFinish(param1);
               break;
            case Renamed7601.Renamed7615:
               this.roundStart(param1);
               break;
            case Renamed7601.Renamed7602:
               this.Renamed7637(param1);
               break;
            case Renamed7601.Renamed7614:
               this.swapTeams(param1);
               break;
            case Renamed7601.Renamed7608:
               this.updateName(param1);
               break;
            case Renamed7601.Renamed7610:
               this.updateTeamScore(param1);
               break;
            case Renamed7601.Renamed7603:
               this.Renamed5662(param1);
               break;
            case Renamed7601.Renamed7619:
               this.updateUserScore(param1);
               break;
            case Renamed7601.Renamed7620:
               this.updateUserSuspiciousState(param1);
         }
      }
      
      private function battleStop(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7628.battleStop();
         Model.popObject();
      }
      
      private function Renamed2123(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7628.Renamed2123();
         Model.popObject();
      }
      
      private function removeUser(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7628.removeUser(param1.userId);
         Model.popObject();
      }
      
      private function roundFinish(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7628.roundFinish();
         Model.popObject();
      }
      
      private function roundStart(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7628.roundStart();
         Model.popObject();
      }
      
      private function updateName(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7628.updateName(param1.name);
         Model.popObject();
      }
      
      private function updateUserSuspiciousState(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7628.updateUserSuspiciousState(param1.userId,param1.suspicious);
         Model.popObject();
      }
      
      private function Renamed5662(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7629.Renamed5662(param1.userId,param1.kills);
         Model.popObject();
      }
      
      private function updateUserScore(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7630.updateUserScore(param1.userId,param1.score);
         Model.popObject();
      }
      
      private function updateTeamScore(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7630.updateTeamScore(param1.teamType,param1.score);
         Model.popObject();
      }
      
      private function addUser(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7629.addUser(param1.user);
         Model.popObject();
      }
      
      private function addUserTeam(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7630.addUser(param1.user,param1.team);
         Model.popObject();
      }
      
      private function swapTeams(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7630.swapTeams();
         Model.popObject();
      }
      
      private function Renamed7634(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7629.Renamed7634();
         Model.popObject();
      }
      
      private function Renamed7635(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.Renamed7630.Renamed7634();
         Model.popObject();
      }
      
      private function Renamed7637(param1:Object) : void
      {
         var _loc7_:Renamed5643 = null;
         var _loc8_:* = undefined;
         var _loc9_:BattleInfoUser = null;
         var _loc10_:Renamed7087 = null;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:BattleInfoUser = null;
         var _loc14_:BattleInfoUser = null;
         var _loc2_:Object = JSON.parse(param1.json);
         var _loc3_:IGameClass = gameTypeRegistry.getClass(Long.getLong(5823622,5812058));
         if(Renamed5340.Renamed6898(_loc2_.battleMode) != Renamed1587.DM)
         {
            _loc3_ = gameTypeRegistry.getClass(Long.getLong(58236223,58120559));
         }
         var _loc4_:IGameObject = this.Renamed7633.createObject(Renamed5566.Renamed5611(),_loc3_,_loc2_.itemId);
         var _loc5_:Renamed2118;
         (_loc5_ = new Renamed2118()).battleMode = Renamed5340.Renamed6898(_loc2_.battleMode);
         _loc5_.itemId = _loc2_.itemId;
         _loc5_.Renamed1601 = new Renamed1585(_loc2_.scoreLimit,_loc2_.timeLimitInSec);
         _loc5_.map = this.Renamed7632.getObject(Long.getLong(_loc2_.preview * 1000,_loc2_.preview * 1000));
         _loc5_.maxPeopleCount = _loc2_.maxPeopleCount;
         _loc5_.name = _loc2_.name;
         _loc5_.parkourMode = _loc2_.parkourMode;
         _loc5_.proBattle = _loc2_.proBattle;
         _loc5_.rankRange = new Renamed1586(_loc2_.maxRank,_loc2_.minRank);
         _loc5_.roundStarted = _loc2_.roundStarted;
         _loc5_.spectator = _loc2_.spectator;
         _loc5_.timeLeftInSec = _loc2_.timeLeftInSec;
         _loc5_.userPaidNoSuppliesBattle = _loc2_.userPaidNoSuppliesBattle;
         _loc5_.withoutBonuses = _loc2_.withoutBonuses;
         _loc5_.withoutCrystals = _loc2_.withoutCrystals;
         _loc5_.withoutSupplies = _loc2_.withoutSupplies;
         _loc5_.Renamed1602 = true;
         _loc5_.equipmentConstraintsMode = Renamed5340.Renamed7638(_loc2_.equipmentConstraintsMode);
         _loc5_.reArmor = _loc2_.reArmorEnabled;
         var _loc6_:Renamed7626;
         (_loc6_ = new Renamed7626()).proBattleEnterPrice = _loc2_.proBattleEnterPrice;
         _loc6_.timeLeftInSec = _loc2_.proBattleTimeLeftInSec == -1 ? 0 : int(_loc2_.proBattleTimeLeftInSec);
         Model.object = _loc4_;
         this.Renamed7631.putInitParams(_loc6_);
         this.Renamed7631.objectLoadedPost();
         this.Renamed7628.putInitParams(_loc5_);
         this.Renamed7628.objectLoaded();
         if(Renamed5340.Renamed6898(_loc2_.battleMode) == Renamed1587.DM)
         {
            (_loc7_ = new Renamed5643()).users = new Vector.<BattleInfoUser>();
            for each(_loc8_ in _loc2_.users)
            {
               (_loc9_ = new BattleInfoUser()).kills = _loc8_.kills;
               _loc9_.score = _loc8_.score;
               _loc9_.suspicious = _loc8_.suspicious;
               _loc9_.user = _loc8_.user;
               _loc7_.users.push(_loc9_);
            }
            this.Renamed7629.putInitParams(_loc7_);
            this.Renamed7629.objectLoadedPost();
         }
         else
         {
            (_loc10_ = new Renamed7087()).autoBalance = _loc2_.autoBalance;
            _loc10_.friendlyFire = _loc2_.friendlyFire;
            _loc10_.scoreBlue = _loc2_.scoreBlue;
            _loc10_.scoreRed = _loc2_.scoreRed;
            _loc10_.usersBlue = new Vector.<BattleInfoUser>();
            for each(_loc11_ in _loc2_.usersBlue)
            {
               (_loc13_ = new BattleInfoUser()).kills = _loc11_.kills;
               _loc13_.score = _loc11_.score;
               _loc13_.suspicious = _loc11_.suspicious;
               _loc13_.user = _loc11_.user;
               _loc10_.usersBlue.push(_loc13_);
            }
            _loc10_.usersRed = new Vector.<BattleInfoUser>();
            for each(_loc12_ in _loc2_.usersRed)
            {
               (_loc14_ = new BattleInfoUser()).kills = _loc12_.kills;
               _loc14_.score = _loc12_.score;
               _loc14_.suspicious = _loc12_.suspicious;
               _loc14_.user = _loc12_.user;
               _loc10_.usersRed.push(_loc14_);
            }
            this.Renamed7630.putInitParams(_loc10_);
            this.Renamed7630.objectLoadedPost();
         }
         Model.popObject();
      }
      
      private function Renamed7636(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7633.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.Renamed7633.destroyObject(_loc2_.id);
            Model.popObject();
         }
      }
   }
}


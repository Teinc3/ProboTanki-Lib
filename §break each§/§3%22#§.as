package §break each§
{
   import §'#r§.§4!A§;
   import §8!<§.§^3§;
   import §>Y§.§ "0§;
   import alternativa.tanks.model.info.§do false§;
   import alternativa.types.Long;
   import §break for null§.§'B§;
   import §each else§.§,#D§;
   import §else set break§.BattleTeamInfoModel;
   import §if try§.§return package if§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import projects.tanks.client.battleselect.model.info.§?S§;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.client.battleservice.§<#p§;
   import projects.tanks.client.battleservice.§final package import§;
   import scpacker.utils.§throw package each§;
   import §static set function§.BattleDmInfoModel;
   import §var for get§.§class for with§;
   
   public class §3"#§ extends §return package if§
   {
      private var §var const do§:§do false§;
      
      private var §!!J§:BattleDmInfoModel;
      
      private var §5d§:BattleTeamInfoModel;
      
      private var §set const in§:§4!A§;
      
      private var §;"%§:ISpace;
      
      private var §in var throw§:ISpace;
      
      public var modelId:int;
      
      public function §3"#§()
      {
         super();
         this.modelId = 33;
         this.§var const do§ = §do false§(modelRegistry.getModel(Long.getLong(0,300090007)));
         this.§!!J§ = BattleDmInfoModel(modelRegistry.getModel(Long.getLong(0,300090003)));
         this.§5d§ = BattleTeamInfoModel(modelRegistry.getModel(Long.getLong(0,300090027)));
         this.§set const in§ = §4!A§(modelRegistry.getModel(Long.getLong(0,300090023)));
         this.§;"%§ = ISpace(spaceRegistry.getSpace(Long.getLong(59235923,646943)));
         this.§in var throw§ = ISpace(spaceRegistry.getSpace(Long.getLong(52835823,6349643)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §%!i§.§extends package use§:
               this.addUser(param1);
               break;
            case §%!i§.§>#k§:
               this.addUserTeam(param1);
               break;
            case §%!i§.§9!<§:
               this.battleStop(param1);
               break;
            case §%!i§.§%N§:
               this.§extends set implements§(param1);
               break;
            case §%!i§.§return var if§:
               this.§throw var var§(param1);
               break;
            case §%!i§.§use var static§:
               this.§-#J§(param1);
               break;
            case §%!i§.§return set const§:
               this.§%!-§(param1);
               break;
            case §%!i§.§2"S§:
               this.removeUser(param1);
               break;
            case §%!i§.§try const in§:
               this.roundFinish(param1);
               break;
            case §%!i§.§for package var§:
               this.roundStart(param1);
               break;
            case §%!i§.§class const in§:
               this.§switch var try§(param1);
               break;
            case §%!i§.§implements const package§:
               this.swapTeams(param1);
               break;
            case §%!i§.§false const default§:
               this.updateName(param1);
               break;
            case §%!i§.§while default§:
               this.updateTeamScore(param1);
               break;
            case §%!i§.§]#h§:
               this.§^$"§(param1);
               break;
            case §%!i§.§^"]§:
               this.updateUserScore(param1);
               break;
            case §%!i§.§""j§:
               this.updateUserSuspiciousState(param1);
         }
      }
      
      private function battleStop(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§var const do§.battleStop();
         Model.popObject();
      }
      
      private function §-#J§(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§var const do§.§-#J§();
         Model.popObject();
      }
      
      private function removeUser(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§var const do§.removeUser(param1.userId);
         Model.popObject();
      }
      
      private function roundFinish(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§var const do§.roundFinish();
         Model.popObject();
      }
      
      private function roundStart(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§var const do§.roundStart();
         Model.popObject();
      }
      
      private function updateName(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§var const do§.updateName(param1.name);
         Model.popObject();
      }
      
      private function updateUserSuspiciousState(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§var const do§.updateUserSuspiciousState(param1.userId,param1.suspicious);
         Model.popObject();
      }
      
      private function §^$"§(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§!!J§.§^$"§(param1.userId,param1.kills);
         Model.popObject();
      }
      
      private function updateUserScore(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§5d§.updateUserScore(param1.userId,param1.score);
         Model.popObject();
      }
      
      private function updateTeamScore(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§5d§.updateTeamScore(param1.teamType,param1.score);
         Model.popObject();
      }
      
      private function addUser(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§!!J§.addUser(param1.user);
         Model.popObject();
      }
      
      private function addUserTeam(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§5d§.addUser(param1.user,param1.team);
         Model.popObject();
      }
      
      private function swapTeams(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§5d§.swapTeams();
         Model.popObject();
      }
      
      private function §extends set implements§(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§!!J§.§extends set implements§();
         Model.popObject();
      }
      
      private function §throw var var§(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         Model.object = _loc2_;
         this.§5d§.§extends set implements§();
         Model.popObject();
      }
      
      private function §switch var try§(param1:Object) : void
      {
         var _loc7_:§ "0§ = null;
         var _loc8_:* = undefined;
         var _loc9_:BattleInfoUser = null;
         var _loc10_:§^3§ = null;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:BattleInfoUser = null;
         var _loc14_:BattleInfoUser = null;
         var _loc2_:Object = JSON.parse(param1.json);
         var _loc3_:IGameClass = gameTypeRegistry.getClass(Long.getLong(5823622,5812058));
         if(§throw package each§.§get true§(_loc2_.battleMode) != §final package import§.DM)
         {
            _loc3_ = gameTypeRegistry.getClass(Long.getLong(58236223,58120559));
         }
         var _loc4_:IGameObject = this.§in var throw§.createObject(§,#D§.§return set extends§(),_loc3_,_loc2_.itemId);
         var _loc5_:§?S§;
         (_loc5_ = new §?S§()).battleMode = §throw package each§.§get true§(_loc2_.battleMode);
         _loc5_.itemId = _loc2_.itemId;
         _loc5_.§function function§ = new §'B§(_loc2_.scoreLimit,_loc2_.timeLimitInSec);
         _loc5_.map = this.§;"%§.getObject(Long.getLong(_loc2_.preview * 1000,_loc2_.preview * 1000));
         _loc5_.maxPeopleCount = _loc2_.maxPeopleCount;
         _loc5_.name = _loc2_.name;
         _loc5_.parkourMode = _loc2_.parkourMode;
         _loc5_.proBattle = _loc2_.proBattle;
         _loc5_.rankRange = new §<#p§(_loc2_.maxRank,_loc2_.minRank);
         _loc5_.roundStarted = _loc2_.roundStarted;
         _loc5_.spectator = _loc2_.spectator;
         _loc5_.timeLeftInSec = _loc2_.timeLeftInSec;
         _loc5_.userPaidNoSuppliesBattle = _loc2_.userPaidNoSuppliesBattle;
         _loc5_.withoutBonuses = _loc2_.withoutBonuses;
         _loc5_.withoutCrystals = _loc2_.withoutCrystals;
         _loc5_.withoutSupplies = _loc2_.withoutSupplies;
         _loc5_.§4#W§ = true;
         _loc5_.equipmentConstraintsMode = §throw package each§.§#! §(_loc2_.equipmentConstraintsMode);
         _loc5_.reArmor = _loc2_.reArmorEnabled;
         var _loc6_:§class for with§;
         (_loc6_ = new §class for with§()).proBattleEnterPrice = _loc2_.proBattleEnterPrice;
         _loc6_.timeLeftInSec = _loc2_.proBattleTimeLeftInSec == -1 ? 0 : int(_loc2_.proBattleTimeLeftInSec);
         Model.object = _loc4_;
         this.§set const in§.putInitParams(_loc6_);
         this.§set const in§.objectLoadedPost();
         this.§var const do§.putInitParams(_loc5_);
         this.§var const do§.objectLoaded();
         if(§throw package each§.§get true§(_loc2_.battleMode) == §final package import§.DM)
         {
            (_loc7_ = new § "0§()).users = new Vector.<BattleInfoUser>();
            for each(_loc8_ in _loc2_.users)
            {
               (_loc9_ = new BattleInfoUser()).kills = _loc8_.kills;
               _loc9_.score = _loc8_.score;
               _loc9_.suspicious = _loc8_.suspicious;
               _loc9_.user = _loc8_.user;
               _loc7_.users.push(_loc9_);
            }
            this.§!!J§.putInitParams(_loc7_);
            this.§!!J§.objectLoadedPost();
         }
         else
         {
            (_loc10_ = new §^3§()).autoBalance = _loc2_.autoBalance;
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
            this.§5d§.putInitParams(_loc10_);
            this.§5d§.objectLoadedPost();
         }
         Model.popObject();
      }
      
      private function §%!-§(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§in var throw§.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.§in var throw§.destroyObject(_loc2_.id);
            Model.popObject();
         }
      }
   }
}


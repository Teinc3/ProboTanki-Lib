package Renamed268
{
   import Renamed1580.Renamed4753;
   import Renamed188.Renamed35;
   import Renamed4739.Renamed6449;
   import Renamed1583.Renamed4756;
   import alternativa.tanks.model.battleselect.create.BattleCreateModel;
   import alternativa.types.Long;
   import Renamed312.Renamed1585;
   import Renamed385.Renamed4886;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.battleselect.create.BattleCreateCC;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   import scpacker.utils.Renamed5340;
   
   public class Renamed6892 extends Renamed4886
   {
      private var Renamed6893:BattleCreateModel;
      
      private var Renamed6894:Renamed4756;
      
      private var Renamed6895:Renamed4753;
      
      private var mapClass:IGameClass;
      
      private var Renamed6896:IGameClass;
      
      private var Renamed6897:IGameObject;
      
      public var modelId:int;
      
      public function Renamed6892()
      {
         super();
         this.modelId = 30;
         this.Renamed6893 = BattleCreateModel(modelRegistry.getModel(Long.getLong(0,300090002)));
         this.Renamed6894 = Renamed4756(modelRegistry.getModel(Long.getLong(0,300090019)));
         this.Renamed6895 = Renamed4753(modelRegistry.getModel(Long.getLong(0,300090014)));
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(this.Renamed6893.id);
         _loc1_.push(Long.getLong(0,300090011));
         var _loc2_:Vector.<Long> = new Vector.<Long>();
         _loc2_.push(this.Renamed6894.id);
         _loc2_.push(this.Renamed6895.id);
         this.mapClass = gameTypeRegistry.createClass(Long.getLong(8238523,63486349),_loc2_);
         this.Renamed6896 = gameTypeRegistry.createClass(Long.getLong(591359,5235923),_loc1_);
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6883.Renamed6886:
               this.createFailedBattleCreateDisabled();
               break;
            case Renamed6883.Renamed6890:
               this.createFailedServerIsHalting();
               break;
            case Renamed6883.Renamed6884:
               this.createFailedTooManyBattlesFromYou();
               break;
            case Renamed6883.Renamed6888:
               this.createFailedYouAreBanned();
               break;
            case Renamed6883.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed6883.Renamed6887:
               this.setFilteredBattleName(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:BattleCreateCC = null;
         var _loc5_:* = undefined;
         var _loc6_:IGameObject = null;
         var _loc7_:Renamed5806 = null;
         var _loc8_:* = undefined;
         var _loc9_:Renamed6449 = null;
         this.Renamed6897 = spaceRegistry.getSpace(Long.getLong(59235923,646943)).createObject(Long.getLong(53152835,6296493246),this.Renamed6896,"BattleSelectObject");
         var _loc2_:Object = JSON.parse(param1.json);
         for each(_loc3_ in _loc2_.maps)
         {
            _loc6_ = spaceRegistry.getSpace(Long.getLong(59235923,646943)).createObject(Long.getLong(_loc3_.preview * 1000,_loc3_.preview * 1000),this.mapClass,_loc3_.mapId + _loc3_.theme);
            (_loc7_ = new Renamed5806()).additionalCrystalsPercent = _loc3_.additionalCrystalsPercent;
            _loc7_.enabled = _loc3_.enabled;
            _loc7_.mapId = _loc3_.mapId;
            _loc7_.mapName = _loc3_.mapName;
            _loc7_.maxPeople = _loc3_.maxPeople;
            _loc7_.preview = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.preview)));
            _loc7_.Renamed5629 = new Renamed1586(_loc3_.maxRank,_loc3_.minRank);
            _loc7_.supportedModes = new Vector.<Renamed1587>();
            for each(_loc8_ in _loc3_.supportedModes)
            {
               _loc7_.supportedModes.push(Renamed5340.Renamed6898(_loc8_));
            }
            _loc7_.theme = Renamed5340.Renamed1596(_loc3_.theme);
            (_loc9_ = new Renamed6449()).clanLink = _loc3_.clanLink;
            _loc9_.clanName = _loc3_.clanName;
            Model.object = _loc6_;
            this.Renamed6894.putInitParams(_loc7_);
            this.Renamed6894.objectLoaded();
            this.Renamed6895.putInitParams(_loc9_);
            Model.popObject();
         }
         Model.object = this.Renamed6897;
         (_loc4_ = new BattleCreateCC()).battleCreationDisabled = _loc2_.battleCreationDisabled;
         _loc4_.battlesLimits = new Vector.<Renamed1585>();
         for each(_loc5_ in _loc2_.battleLimits)
         {
            _loc4_.battlesLimits.push(new Renamed1585(_loc5_.scoreLimit,_loc5_.timeLimitInSec));
         }
         _loc4_.maxRangeLength = _loc2_.maxRangeLength;
         this.Renamed6893.putInitParams(_loc4_);
         this.Renamed6893.objectLoaded();
         this.Renamed6893.objectLoadedPost();
         Model.popObject();
      }
      
      private function createFailedBattleCreateDisabled() : void
      {
         this.Renamed6893.createFailedBattleCreateDisabled();
      }
      
      private function createFailedServerIsHalting() : void
      {
         this.Renamed6893.createFailedServerIsHalting();
      }
      
      private function createFailedTooManyBattlesFromYou() : void
      {
         this.Renamed6893.createFailedTooManyBattlesFromYou();
      }
      
      private function createFailedYouAreBanned() : void
      {
         this.Renamed6893.createFailedYouAreBanned();
      }
      
      private function setFilteredBattleName(param1:Object) : void
      {
         var _loc2_:IGameObject = spaceRegistry.getSpace(Long.getLong(59235923,646943)).getObjectByName("BattleSelectObject");
         Model.object = _loc2_;
         this.Renamed6893.setFilteredBattleName(param1.name);
         Model.popObject();
      }
   }
}


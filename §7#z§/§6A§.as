package §7#z§
{
   import §""v§.§0"^§;
   import §%@§.§,§;
   import §0"k§.§^$$§;
   import §>6§.§+!2§;
   import alternativa.tanks.model.battleselect.create.BattleCreateModel;
   import alternativa.types.Long;
   import §break for null§.§'B§;
   import §if try§.§return package if§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.battleselect.create.BattleCreateCC;
   import projects.tanks.client.battleservice.§<#p§;
   import projects.tanks.client.battleservice.§final package import§;
   import scpacker.utils.§throw package each§;
   
   public class §6A§ extends §return package if§
   {
      private var §&!,§:BattleCreateModel;
      
      private var §null catch package§:§+!2§;
      
      private var § "V§:§0"^§;
      
      private var mapClass:IGameClass;
      
      private var §for package do§:IGameClass;
      
      private var §@m§:IGameObject;
      
      public var modelId:int;
      
      public function §6A§()
      {
         super();
         this.modelId = 30;
         this.§&!,§ = BattleCreateModel(modelRegistry.getModel(Long.getLong(0,300090002)));
         this.§null catch package§ = §+!2§(modelRegistry.getModel(Long.getLong(0,300090019)));
         this.§ "V§ = §0"^§(modelRegistry.getModel(Long.getLong(0,300090014)));
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(this.§&!,§.id);
         _loc1_.push(Long.getLong(0,300090011));
         var _loc2_:Vector.<Long> = new Vector.<Long>();
         _loc2_.push(this.§null catch package§.id);
         _loc2_.push(this.§ "V§.id);
         this.mapClass = gameTypeRegistry.createClass(Long.getLong(8238523,63486349),_loc2_);
         this.§for package do§ = gameTypeRegistry.createClass(Long.getLong(591359,5235923),_loc1_);
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §0#]§.§continue const true§:
               this.createFailedBattleCreateDisabled();
               break;
            case §0#]§.§&>§:
               this.createFailedServerIsHalting();
               break;
            case §0#]§.§!`§:
               this.createFailedTooManyBattlesFromYou();
               break;
            case §0#]§.§#E§:
               this.createFailedYouAreBanned();
               break;
            case §0#]§.§;!K§:
               this.§`#%§(param1);
               break;
            case §0#]§.§while static§:
               this.setFilteredBattleName(param1);
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:BattleCreateCC = null;
         var _loc5_:* = undefined;
         var _loc6_:IGameObject = null;
         var _loc7_:§,#5§ = null;
         var _loc8_:* = undefined;
         var _loc9_:§^$$§ = null;
         this.§@m§ = spaceRegistry.getSpace(Long.getLong(59235923,646943)).createObject(Long.getLong(53152835,6296493246),this.§for package do§,"BattleSelectObject");
         var _loc2_:Object = JSON.parse(param1.json);
         for each(_loc3_ in _loc2_.maps)
         {
            _loc6_ = spaceRegistry.getSpace(Long.getLong(59235923,646943)).createObject(Long.getLong(_loc3_.preview * 1000,_loc3_.preview * 1000),this.mapClass,_loc3_.mapId + _loc3_.theme);
            (_loc7_ = new §,#5§()).additionalCrystalsPercent = _loc3_.additionalCrystalsPercent;
            _loc7_.enabled = _loc3_.enabled;
            _loc7_.mapId = _loc3_.mapId;
            _loc7_.mapName = _loc3_.mapName;
            _loc7_.maxPeople = _loc3_.maxPeople;
            _loc7_.preview = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.preview)));
            _loc7_.§for catch finally§ = new §<#p§(_loc3_.maxRank,_loc3_.minRank);
            _loc7_.supportedModes = new Vector.<§final package import§>();
            for each(_loc8_ in _loc3_.supportedModes)
            {
               _loc7_.supportedModes.push(§throw package each§.§get true§(_loc8_));
            }
            _loc7_.theme = §throw package each§.§0"E§(_loc3_.theme);
            (_loc9_ = new §^$$§()).clanLink = _loc3_.clanLink;
            _loc9_.clanName = _loc3_.clanName;
            Model.object = _loc6_;
            this.§null catch package§.putInitParams(_loc7_);
            this.§null catch package§.objectLoaded();
            this.§ "V§.putInitParams(_loc9_);
            Model.popObject();
         }
         Model.object = this.§@m§;
         (_loc4_ = new BattleCreateCC()).battleCreationDisabled = _loc2_.battleCreationDisabled;
         _loc4_.battlesLimits = new Vector.<§'B§>();
         for each(_loc5_ in _loc2_.battleLimits)
         {
            _loc4_.battlesLimits.push(new §'B§(_loc5_.scoreLimit,_loc5_.timeLimitInSec));
         }
         _loc4_.maxRangeLength = _loc2_.maxRangeLength;
         this.§&!,§.putInitParams(_loc4_);
         this.§&!,§.objectLoaded();
         this.§&!,§.objectLoadedPost();
         Model.popObject();
      }
      
      private function createFailedBattleCreateDisabled() : void
      {
         this.§&!,§.createFailedBattleCreateDisabled();
      }
      
      private function createFailedServerIsHalting() : void
      {
         this.§&!,§.createFailedServerIsHalting();
      }
      
      private function createFailedTooManyBattlesFromYou() : void
      {
         this.§&!,§.createFailedTooManyBattlesFromYou();
      }
      
      private function createFailedYouAreBanned() : void
      {
         this.§&!,§.createFailedYouAreBanned();
      }
      
      private function setFilteredBattleName(param1:Object) : void
      {
         var _loc2_:IGameObject = spaceRegistry.getSpace(Long.getLong(59235923,646943)).getObjectByName("BattleSelectObject");
         Model.object = _loc2_;
         this.§&!,§.setFilteredBattleName(param1.name);
         Model.popObject();
      }
   }
}


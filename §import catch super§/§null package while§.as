package §import catch super§
{
   import §!#%§.BattleTeamItemModel;
   import §-#e§.BattleDMItemModel;
   import alternativa.tanks.model.item.BattleItemModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class §null package while§ extends §return package if§
   {
      private var §>!Z§:BattleItemModel;
      
      private var §""X§:BattleDMItemModel;
      
      private var §`!F§:BattleTeamItemModel;
      
      private var §;"%§:ISpace;
      
      private var §in var throw§:ISpace;
      
      public var modelId:int;
      
      public function §null package while§()
      {
         super();
         this.modelId = 32;
         this.§>!Z§ = BattleItemModel(modelRegistry.getModel(Long.getLong(0,300090008)));
         this.§""X§ = BattleDMItemModel(modelRegistry.getModel(Long.getLong(0,300090004)));
         this.§`!F§ = BattleTeamItemModel(modelRegistry.getModel(Long.getLong(0,300090028)));
         this.§;"%§ = ISpace(spaceRegistry.getSpace(Long.getLong(59235923,646943)));
         this.§in var throw§ = ISpace(spaceRegistry.getSpace(Long.getLong(52835823,6349643)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §import set extends§.§`$§:
               this.madePrivate(param1);
               break;
            case §import set extends§.§const var return§:
               this.§?# §(param1);
               break;
            case §import set extends§.§try catch import§:
               this.§9#X§(param1);
               break;
            case §import set extends§.§^>§:
               this.§const var set§(param1);
               break;
            case §import set extends§.§2"^§:
               this.§-#l§(param1);
               break;
            case §import set extends§.§implements const package§:
               this.swapTeams(param1);
               break;
            case §import set extends§.§false const default§:
               this.updateName(param1);
               break;
            case §import set extends§.§,#r§:
               this.updateSuspicious(param1);
         }
      }
      
      private function madePrivate(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§;"%§.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.§>!Z§.madePrivate();
            Model.popObject();
         }
      }
      
      private function updateName(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§;"%§.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.§>!Z§.updateName(param1.newName);
            Model.popObject();
         }
      }
      
      private function updateSuspicious(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§;"%§.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.§>!Z§.updateSuspicious(param1.suspicionLevel);
            Model.popObject();
         }
      }
      
      private function §const var set§(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§;"%§.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.§""X§.§const var set§(param1.userId);
            Model.popObject();
         }
      }
      
      private function §?# §(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§;"%§.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.§""X§.§?# §(param1.userId);
            Model.popObject();
         }
      }
      
      private function §9#X§(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§;"%§.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.§`!F§.§?# §(param1.userId);
            Model.popObject();
         }
      }
      
      private function §-#l§(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§;"%§.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.§`!F§.§const var set§(param1.userId,param1.team);
            Model.popObject();
         }
      }
      
      private function swapTeams(param1:Object) : void
      {
         var _loc2_:IGameObject = this.§;"%§.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.§`!F§.swapTeams();
            Model.popObject();
         }
      }
   }
}


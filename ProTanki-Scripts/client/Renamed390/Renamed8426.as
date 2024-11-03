package Renamed390
{
   import Renamed144.BattleTeamItemModel;
   import Renamed216.BattleDMItemModel;
   import alternativa.tanks.model.item.BattleItemModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class Renamed8426 extends Renamed4886
   {
      private var Renamed8427:BattleItemModel;
      
      private var Renamed8428:BattleDMItemModel;
      
      private var Renamed8429:BattleTeamItemModel;
      
      private var Renamed7632:ISpace;
      
      private var Renamed7633:ISpace;
      
      public var modelId:int;
      
      public function Renamed8426()
      {
         super();
         this.modelId = 32;
         this.Renamed8427 = BattleItemModel(modelRegistry.getModel(Long.getLong(0,300090008)));
         this.Renamed8428 = BattleDMItemModel(modelRegistry.getModel(Long.getLong(0,300090004)));
         this.Renamed8429 = BattleTeamItemModel(modelRegistry.getModel(Long.getLong(0,300090028)));
         this.Renamed7632 = ISpace(spaceRegistry.getSpace(Long.getLong(59235923,646943)));
         this.Renamed7633 = ISpace(spaceRegistry.getSpace(Long.getLong(52835823,6349643)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8418.Renamed8420:
               this.madePrivate(param1);
               break;
            case Renamed8418.Renamed8422:
               this.Renamed4967(param1);
               break;
            case Renamed8418.Renamed8421:
               this.Renamed8430(param1);
               break;
            case Renamed8418.Renamed8424:
               this.Renamed4965(param1);
               break;
            case Renamed8418.Renamed8419:
               this.Renamed8431(param1);
               break;
            case Renamed8418.Renamed7614:
               this.swapTeams(param1);
               break;
            case Renamed8418.Renamed7608:
               this.updateName(param1);
               break;
            case Renamed8418.Renamed8423:
               this.updateSuspicious(param1);
         }
      }
      
      private function madePrivate(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7632.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.Renamed8427.madePrivate();
            Model.popObject();
         }
      }
      
      private function updateName(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7632.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.Renamed8427.updateName(param1.newName);
            Model.popObject();
         }
      }
      
      private function updateSuspicious(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7632.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.Renamed8427.updateSuspicious(param1.suspicionLevel);
            Model.popObject();
         }
      }
      
      private function Renamed4965(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7632.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.Renamed8428.Renamed4965(param1.userId);
            Model.popObject();
         }
      }
      
      private function Renamed4967(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7632.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.Renamed8428.Renamed4967(param1.userId);
            Model.popObject();
         }
      }
      
      private function Renamed8430(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7632.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.Renamed8429.Renamed4967(param1.userId);
            Model.popObject();
         }
      }
      
      private function Renamed8431(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7632.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.Renamed8429.Renamed4965(param1.userId,param1.team);
            Model.popObject();
         }
      }
      
      private function swapTeams(param1:Object) : void
      {
         var _loc2_:IGameObject = this.Renamed7632.getObjectByName(param1.battleId);
         if(_loc2_ != null)
         {
            Model.object = _loc2_;
            this.Renamed8429.swapTeams();
            Model.popObject();
         }
      }
   }
}


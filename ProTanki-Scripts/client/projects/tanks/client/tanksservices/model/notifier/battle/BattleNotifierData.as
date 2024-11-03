package projects.tanks.client.tanksservices.model.notifier.battle
{
   import projects.tanks.client.tanksservices.model.notifier.AbstractNotifier;
   import projects.tanks.client.tanksservices.types.battle.BattleInfoData;
   
   public class BattleNotifierData extends AbstractNotifier
   {
      private var _battleData:BattleInfoData;
      
      public function BattleNotifierData(param1:BattleInfoData = null)
      {
         super();
         this._battleData = param1;
      }
      
      public function get battleData() : BattleInfoData
      {
         return this._battleData;
      }
      
      public function set battleData(param1:BattleInfoData) : void
      {
         this._battleData = param1;
      }
      
      override public function toString() : String
      {
         var _loc1_:String = "BattleNotifierData [";
         _loc1_ += "battleData = " + this.battleData + " ";
         _loc1_ += super.toString();
         return _loc1_ + "]";
      }
   }
}


package alternativa.tanks.gui.battle
{
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class BattleFinishTeamNotification extends BattleFinishNotification
   {
      private static const YOUR_PLACE_REPLACE_PATTERN:String = "{your_place}";
      
      private static const PLACES_REPLACE_PATTERN:String = "{places}";
      
      private static const CRYSTALLS_REPLACE_PATTERN:String = "{crystalls}";
      
      private var _isVictory:Boolean;
      
      private var _isDefeat:Boolean;
      
      private var _position:int;
      
      private var _places:int;
      
      private var _reward:int;
      
      private var _bonusReward:int;
      
      public function BattleFinishTeamNotification(param1:Boolean, param2:Boolean, param3:int, param4:int, param5:int, param6:int)
      {
         this._isVictory = param1;
         this._isDefeat = param2;
         this._position = param3;
         this._places = param4;
         this._reward = param5;
         this._bonusReward = param6;
         super();
      }
      
      override public function get message() : String
      {
         return this.getTotalRoundLabel() + "\n" + localeService.getText(TanksLocale.TEXT_REARM_BATTLE_PLACE).replace(YOUR_PLACE_REPLACE_PATTERN,this._position).replace(PLACES_REPLACE_PATTERN,this._places) + "\n" + localeService.getText(TanksLocale.TEXT_REARM_BATTLE_PRIZE).replace(CRYSTALLS_REPLACE_PATTERN,getRewardText(this._reward,this._bonusReward));
      }
      
      private function getTotalRoundLabel() : String
      {
         if(this._isVictory)
         {
            return localeService.getText(TanksLocale.TEXT_REARM_TEAM_WIN);
         }
         if(this._isDefeat)
         {
            return localeService.getText(TanksLocale.TEXT_REARM_TEAM_LOOSE);
         }
         return localeService.getText(TanksLocale.TEXT_REARM_TEAM_TIE);
      }
   }
}


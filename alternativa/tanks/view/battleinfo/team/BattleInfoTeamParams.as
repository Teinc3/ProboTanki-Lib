package alternativa.tanks.view.battleinfo.team
{
   import alternativa.tanks.view.battleinfo.BattleInfoBaseParams;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class BattleInfoTeamParams extends BattleInfoBaseParams
   {
      public var usersRed:Vector.<BattleInfoUser>;
      
      public var usersBlue:Vector.<BattleInfoUser>;
      
      public var scoreRed:int;
      
      public var scoreBlue:int;
      
      public var autoBalance:Boolean;
      
      public var friendlyFire:Boolean;
      
      public function BattleInfoTeamParams()
      {
         super();
      }
   }
}


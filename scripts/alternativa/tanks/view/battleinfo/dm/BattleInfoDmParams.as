package alternativa.tanks.view.battleinfo.dm
{
   import alternativa.tanks.view.battleinfo.BattleInfoBaseParams;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class BattleInfoDmParams extends BattleInfoBaseParams
   {
      public var users:Vector.<BattleInfoUser>;
      
      public function BattleInfoDmParams()
      {
         super();
      }
   }
}


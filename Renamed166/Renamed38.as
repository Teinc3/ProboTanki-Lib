package Renamed37
{
   import Renamed257.Renamed4597;
   import Renamed257.Renamed5314;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.battle.battlefield.Renamed2395;
   import alternativa.tanks.models.battle.battlefield.Renamed2524;
   import Renamed63.Renamed617;
   import Renamed63.Renamed5315;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   
   public class Renamed38 extends Renamed5314 implements Renamed4597, ObjectLoadPostListener, ObjectUnloadListener, Renamed2524
   {
      [Inject]
      public static var battleService:BattleService;
      
      public function Renamed38()
      {
         super();
      }
      
      public function Renamed2525() : Renamed2395
      {
         return Renamed2395.DM;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         battleService.Renamed625(new Renamed5311());
         battleService.Renamed628(new Renamed5313());
         battleService.Renamed630(new Renamed5316());
         battleService.Renamed650(this.Renamed649());
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         battleService.Renamed625(null);
         battleService.Renamed628(null);
         battleService.Renamed630(null);
         battleService.Renamed650(null);
      }
      
      public function Renamed649() : Renamed617
      {
         return new Renamed5315();
      }
   }
}


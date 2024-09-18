package Renamed68
{
   import Renamed17.MessageColor;
   import Renamed201.Renamed6004;
   import Renamed201.Renamed4566;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed69 extends Renamed6004 implements Renamed4566
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const UID_PATTERN:String = "%USERNAME%";
      
      public function Renamed69()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6237(param1:String, param2:String, param3:SoundResource) : void
      {
         this.notification(param1,param2,param3);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6235(param1:String, param2:String) : void
      {
         var _loc3_:String = param1.replace(UID_PATTERN,param2);
         this.notification(param1,_loc3_,null);
      }
      
      private function notification(param1:String, param2:String, param3:SoundResource) : void
      {
         if(param3 != null)
         {
            battleService.Renamed619().Renamed801().Renamed2316(param3.sound,0,1);
         }
         var _loc4_:Renamed2553 = Renamed2553(OSGi.getInstance().getService(Renamed2553));
         _loc4_.Renamed2561(MessageColor.Renamed5390,param2);
      }
   }
}


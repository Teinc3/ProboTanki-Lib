package §implements var final§
{
   import §%3§.MessageColor;
   import §+!h§.§"!u§;
   import §+!h§.§import var get§;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.battle.gui.§&"4§;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §[P§ extends §"!u§ implements §import var get§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const UID_PATTERN:String = "%USERNAME%";
      
      public function §[P§()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function §implements const class§(param1:String, param2:String, param3:SoundResource) : void
      {
         this.notification(param1,param2,param3);
      }
      
      [Obfuscation(rename="false")]
      public function §[D§(param1:String, param2:String) : void
      {
         var _loc3_:String = param1.replace(UID_PATTERN,param2);
         this.notification(param1,_loc3_,null);
      }
      
      private function notification(param1:String, param2:String, param3:SoundResource) : void
      {
         if(param3 != null)
         {
            battleService.§'x§().§'M§().§finally package get§(param3.sound,0,1);
         }
         var _loc4_:§&"4§ = §&"4§(OSGi.getInstance().getService(§&"4§));
         _loc4_.§@e§(MessageColor.§%#K§,param2);
      }
   }
}


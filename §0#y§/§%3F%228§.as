package §0#y§
{
   import §4"%§.§80§;
   import §6!u§.§false set false§;
   import §9#o§.§+!l§;
   import §9#o§.§true finally§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§catch catch§;
   import alternativa.tanks.models.weapon.shotgun.§static package null§;
   import §each throw§.§super set var§;
   import §in var super§.§9!T§;
   
   public class §?"8§ extends §true finally§ implements §+!l§, §with for§, §9!T§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var §=#0§:§ !8§;
      
      private var §break catch const§:§static package null§;
      
      public function §?"8§()
      {
         this.§=#0§ = new § !8§();
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:§false set false§ = §false set false§(object.adapt(§false set false§));
         var _loc3_:§if catch use§ = new §if catch use§(getInitParam(),_loc2_.§switch for return§("shot"),§80§(object.adapt(§80§)));
         param1.putParams(§if catch use§,_loc3_);
         var _loc4_:§with package import§ = new §with package import§(_loc3_);
         param1.putParams(§with package import§,_loc4_);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         §with package import§(param1.removeParams(§with package import§)).close();
         §if catch use§(param1.removeParams(§if catch use§)).close();
      }
      
      public function §-!<§(param1:ClientObject, param2:Vector3, param3:Vector.<§super set var§>) : void
      {
         this.§var case§(param1,param2);
      }
      
      private function §var case§(param1:ClientObject, param2:Vector3) : void
      {
         var _loc3_:Tank = null;
         var _loc4_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         var _loc5_:§7!9§;
         if(!(_loc5_ = _loc4_.getTankData(param1)).local)
         {
            this.§include const try§(param1);
            _loc3_ = _loc5_.tank;
            this.§continue for each§(param1).§ #'§(this.§1#C§(param1),this.§=#0§,_loc3_,param2);
         }
      }
      
      private function §include const try§(param1:ClientObject) : void
      {
         var _loc2_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         var _loc3_:Tank = _loc2_.getTankData(param1).tank;
         §catch catch§.§^S§(_loc3_.§2"F§(),_loc3_.§else catch true§(),this.§=#0§);
      }
      
      public function §continue for each§(param1:ClientObject) : §with package import§
      {
         return §with package import§(param1.getParams(§with package import§));
      }
      
      private function §1#C§(param1:ClientObject) : §static package null§
      {
         if(this.§break catch const§ == null)
         {
            this.§break catch const§ = new §static package null§(param1);
         }
         else
         {
            this.§break catch const§.§4>§(param1);
         }
         return this.§break catch const§;
      }
   }
}


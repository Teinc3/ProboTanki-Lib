package §5"C§
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.§%#e§;
   import alternativa.tanks.models.weapon.shared.§set set get§;
   import scpacker.tanks.WeaponsManager;
   import §super var native§.§return for while§;
   
   public class §[!y§ implements §else var null§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private const §="Q§:Number = 0.000001;
      
      private const §continue const function§:Number = 10000;
      
      private var §^"^§:§%#e§;
      
      private var §5#k§:§set set get§;
      
      private var §]Y§:Number;
      
      public function §[!y§(param1:String)
      {
         super();
         this.§^"^§ = battleService.§static const continue§();
         this.§5#k§ = battleService.§4p§();
         var _loc2_:§return for while§ = WeaponsManager.shotDatas[param1];
         this.§]Y§ = Math.max(_loc2_.§static var return§(),_loc2_.§2!H§());
      }
      
      public function §case var try§(param1:Tank, param2:Number, param3:Number) : Number
      {
         var _loc4_:Body = param1.§0"t§();
         var _loc5_:Number = this.§^"^§.§case var try§(_loc4_,param2,param3,this.§continue const function§,this.§]Y§);
         return this.§5#k§.§do do§(_loc4_) + _loc5_ * this.§="Q§;
      }
   }
}


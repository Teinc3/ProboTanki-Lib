package §9!B§
{
   import §5"C§.§else var null§;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.§%#e§;
   import alternativa.tanks.models.weapon.shared.§]!m§;
   import §set break§.§else package finally§;
   
   public class §while var finally§ implements §else var null§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private const §="Q§:Number = 0.0001;
      
      private const §'^§:Number = 50;
      
      private const §3f§:Number = 100;
      
      private var §^"^§:§%#e§;
      
      private var §5#k§:§]!m§;
      
      private var §]Y§:Number;
      
      private var §with var const§:Number;
      
      private var target:Tank;
      
      public function §while var finally§(param1:§else package finally§)
      {
         super();
         this.§^"^§ = battleService.§static const continue§();
         this.§5#k§ = battleService.§catch native§();
         this.§with var const§ = param1.radius - this.§'^§;
         this.§]Y§ = param1.coneAngle;
      }
      
      public function §return const do§(param1:Tank) : void
      {
         this.target = param1;
      }
      
      public function §implements package for§() : void
      {
         this.target = null;
      }
      
      public function §case var try§(param1:Tank, param2:Number, param3:Number) : Number
      {
         if(param1.tankData.health == 0)
         {
            return 0;
         }
         var _loc4_:Body = param1.§0"t§();
         var _loc5_:Number = this.§^"^§.§case var try§(_loc4_,param2,param3,this.§with var const§,this.§]Y§);
         return this.§5#k§.§case var try§(_loc4_) + _loc5_ * this.§="Q§ + this.§function const false§(param1);
      }
      
      private function §function const false§(param1:Tank) : Number
      {
         return param1 != this.target ? Number(0) : Number(this.§3f§);
      }
   }
}


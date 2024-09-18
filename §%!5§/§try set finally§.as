package §%!5§
{
   import §]&§.§each for native§;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§class true§;
   import alternativa.tanks.models.weapon.shared.§@"e§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §try set finally§ extends §["D§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var states:Vector.<§each for native§>;
      
      private var §8!;§:Vector3;
      
      private var § !>§:Vector3;
      
      private var §default catch§:Vector3;
      
      private var §`"@§:Vector3;
      
      private var §if var case§:int;
      
      private var startTime:int;
      
      private var §get const class§:int;
      
      private var §&s§:Boolean;
      
      public function §try set finally§(param1:§1Q§)
      {
         this.states = new Vector.<§each for native§>();
         this.§8!;§ = new Vector3();
         this.§ !>§ = new Vector3();
         this.§default catch§ = new Vector3();
         this.§`"@§ = new Vector3();
         super(param1);
      }
      
      public function §final const break§() : Vector3
      {
         return this.§8!;§;
      }
      
      public function §<R§() : Vector3
      {
         return this.§ !>§;
      }
      
      public function §6#I§() : int
      {
         return this.§get const class§;
      }
      
      public function §"Y§() : int
      {
         return battleService.§'x§().§]"d§() + §class true§.§@"r§ - this.startTime - this.§get const class§;
      }
      
      public function start(param1:Vector3, param2:Vector3) : void
      {
         this.states.length = 0;
         this.§8!;§.copy(param1);
         this.§ !>§.copy(param2);
         this.startTime = battleService.§'x§().§]"d§();
         this.§get const class§ = 0;
         this.§&s§ = true;
      }
      
      public function updateState(param1:Vector3, param2:Vector3, param3:int = 666666) : void
      {
         if(§@"e§.§final var override§(this.§8!;§,param1))
         {
            this.§"v§();
         }
         this.§default catch§.copy(param1);
         this.§`"@§.copy(param2);
         this.§if var case§ = battleService.§'x§().§]"d§() + Math.min(param3,§class true§.§@"r§) - this.startTime;
         this.§&s§ = false;
      }
      
      public function §true set static§() : Vector.<§each for native§>
      {
         this.§"v§();
         return this.states;
      }
      
      public function §"v§() : void
      {
         if(!this.§&s§)
         {
            this.states.push(new §each for native§(this.§if var case§,this.§`"@§.toVector3d(),this.§default catch§.toVector3d()));
            this.§get const class§ = this.§if var case§;
            this.§8!;§.copy(this.§default catch§);
            this.§ !>§.copy(this.§`"@§);
            this.§&s§ = true;
         }
      }
      
      public function destroy() : void
      {
         this.states.length = 0;
         recycle();
      }
   }
}


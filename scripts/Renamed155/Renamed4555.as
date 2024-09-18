package Renamed155
{
   import Renamed481.Renamed5179;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed620;
   import alternativa.tanks.models.weapon.shared.Renamed2943;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed4555 extends Renamed1444
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var states:Vector.<Renamed5179>;
      
      private var Renamed5180:Vector3;
      
      private var Renamed5181:Vector3;
      
      private var Renamed1148:Vector3;
      
      private var Renamed5182:Vector3;
      
      private var Renamed5183:int;
      
      private var startTime:int;
      
      private var Renamed5184:int;
      
      private var Renamed5185:Boolean;
      
      public function Renamed4555(param1:Renamed1443)
      {
         this.states = new Vector.<Renamed5179>();
         this.Renamed5180 = new Vector3();
         this.Renamed5181 = new Vector3();
         this.Renamed1148 = new Vector3();
         this.Renamed5182 = new Vector3();
         super(param1);
      }
      
      public function Renamed5186() : Vector3
      {
         return this.Renamed5180;
      }
      
      public function Renamed5187() : Vector3
      {
         return this.Renamed5181;
      }
      
      public function Renamed5188() : int
      {
         return this.Renamed5184;
      }
      
      public function Renamed5189() : int
      {
         return battleService.Renamed619().Renamed653() + Renamed620.Renamed782 - this.startTime - this.Renamed5184;
      }
      
      public function start(param1:Vector3, param2:Vector3) : void
      {
         this.states.length = 0;
         this.Renamed5180.copy(param1);
         this.Renamed5181.copy(param2);
         this.startTime = battleService.Renamed619().Renamed653();
         this.Renamed5184 = 0;
         this.Renamed5185 = true;
      }
      
      public function updateState(param1:Vector3, param2:Vector3, param3:int = 666666) : void
      {
         if(Renamed2943.Renamed2967(this.Renamed5180,param1))
         {
            this.Renamed5177();
         }
         this.Renamed1148.copy(param1);
         this.Renamed5182.copy(param2);
         this.Renamed5183 = battleService.Renamed619().Renamed653() + Math.min(param3,Renamed620.Renamed782) - this.startTime;
         this.Renamed5185 = false;
      }
      
      public function Renamed5190() : Vector.<Renamed5179>
      {
         this.Renamed5177();
         return this.states;
      }
      
      public function Renamed5177() : void
      {
         if(!this.Renamed5185)
         {
            this.states.push(new Renamed5179(this.Renamed5183,this.Renamed5182.toVector3d(),this.Renamed1148.toVector3d()));
            this.Renamed5184 = this.Renamed5183;
            this.Renamed5180.copy(this.Renamed1148);
            this.Renamed5181.copy(this.Renamed5182);
            this.Renamed5185 = true;
         }
      }
      
      public function destroy() : void
      {
         this.states.length = 0;
         recycle();
      }
   }
}


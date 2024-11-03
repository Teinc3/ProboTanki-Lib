package Renamed4553
{
   import Renamed206.Renamed5125;
   import Renamed475.Renamed4631;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import alternativa.tanks.utils.MathUtils;
   import Renamed405.Renamed5126;
   
   public class Renamed5127 implements Renamed919, Renamed768
   {
      private static const Renamed5128:ConsoleVarFloat = new ConsoleVarFloat("dom_smoothing_factor",0.95,0,1);
      
      private static const MAX_PROGRESS:Number = 100;
      
      private var id:int;
      
      private var name:String;
      
      private var Renamed5129:Renamed5125;
      
      private var position:Vector3;
      
      private var view:Renamed4554;
      
      private var Renamed5130:Number = 0;
      
      private var Renamed5131:Number = 0;
      
      private var progressSpeed:Number = 0;
      
      private var Renamed5132:Renamed4631;
      
      private var battleService:BattleService;
      
      private var Renamed5133:Boolean;
      
      private var Renamed5134:Renamed5126;
      
      public var Renamed5135:int;
      
      public function Renamed5127(param1:int, param2:String, param3:Vector3, param4:BattleService, param5:Renamed4631, param6:Renamed5126, param7:Renamed4554)
      {
         super();
         this.id = param1;
         this.name = param2;
         this.view = param7;
         this.position = param3;
         this.Renamed5132 = param5;
         this.Renamed5134 = param6;
         this.battleService = param4;
         this.Renamed5133 = false;
         param4.Renamed621().Renamed1287(this,0);
         param7.addToScene(param4.Renamed621(),param3);
      }
      
      public function Renamed5136(param1:Renamed5125) : void
      {
         this.Renamed5129 = param1;
         this.Renamed5133 = false;
         if(this.Renamed5129 == Renamed5125.NEUTRAL)
         {
            this.view.Renamed5123();
            if(this.Renamed5135 == 0)
            {
               this.Renamed5130 = 0;
               this.Renamed5131 = 0;
               this.progressSpeed = 0;
            }
         }
         else
         {
            if(this.Renamed5129 == Renamed5125.BLUE)
            {
               this.view.Renamed5122();
               this.Renamed5130 = MAX_PROGRESS;
            }
            else
            {
               this.view.Renamed5120();
               this.Renamed5130 = -MAX_PROGRESS;
            }
            this.Renamed5131 = this.Renamed5130;
            this.progressSpeed = 0;
         }
      }
      
      public function Renamed5137() : Renamed5125
      {
         return this.Renamed5129;
      }
      
      public function Renamed5138(param1:Number, param2:Number) : void
      {
         this.Renamed5130 = param1;
         this.progressSpeed = param2;
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.copy(this.position);
         param1.z += Renamed4554.Renamed5086;
      }
      
      public function getPosition() : Vector3
      {
         return this.position;
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function Renamed5139() : Number
      {
         return this.Renamed5131;
      }
      
      public function reset() : void
      {
         this.Renamed5135 = 0;
         this.Renamed5130 = 0;
         this.Renamed5131 = 0;
         this.progressSpeed = 0;
         this.Renamed5129 = Renamed5125.NEUTRAL;
         this.view.Renamed5123();
         this.Renamed5134.Renamed2317();
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.view.update(this.Renamed5131,this.battleService.Renamed621().Renamed739());
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         this.Renamed5140(param2);
         this.Renamed5141();
         this.Renamed5142();
      }
      
      private function Renamed5140(param1:int) : void
      {
         if(this.progressSpeed != 0)
         {
            this.Renamed5130 += this.progressSpeed * param1 / 1000;
            if(!this.Renamed5133 && this.Renamed5143())
            {
               this.Renamed5132.Renamed5144(this.id);
               this.Renamed5133 = true;
            }
         }
      }
      
      private function Renamed5141() : void
      {
         var _loc1_:Number = MathUtils.clamp(this.Renamed5131 + (this.Renamed5130 - this.Renamed5131) * Renamed5128.value,-MAX_PROGRESS,MAX_PROGRESS);
         if(this.Renamed5135 == 0 && this.Renamed5131 * _loc1_ <= 0)
         {
            this.Renamed5130 = 0;
            this.Renamed5131 = 0;
            this.progressSpeed = 0;
         }
         else
         {
            this.Renamed5131 = _loc1_;
         }
      }
      
      private function Renamed5143() : Boolean
      {
         return Math.abs(this.Renamed5130) >= MAX_PROGRESS;
      }
      
      private function Renamed5142() : void
      {
         var _loc1_:Number = this.Renamed5131 * this.progressSpeed;
         if(this.Renamed5131 >= 100 || this.Renamed5131 <= -100)
         {
            this.Renamed5134.Renamed2317();
            return;
         }
         if(_loc1_ > 0 || this.Renamed5131 == 0 && this.progressSpeed != 0)
         {
            this.Renamed5134.Renamed5145(this.position);
         }
         else if(_loc1_ < 0)
         {
            this.Renamed5134.Renamed5146(this.position);
         }
         else
         {
            this.Renamed5134.Renamed2317();
         }
      }
   }
}


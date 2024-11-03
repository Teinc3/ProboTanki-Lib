package Renamed19
{
   import Renamed301.Renamed3044;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3065;
   import Renamed388.Renamed5834;
   
   public class Renamed5874 implements Renamed990
   {
      private static const Renamed5878:Vector3 = new Vector3();
      
      private static const Renamed3195:Renamed664 = new Renamed664();
      
      private var Renamed3313:Renamed3065;
      
      private var effects:Renamed5823;
      
      private var Renamed3110:Renamed925;
      
      private var Renamed3326:Renamed3044;
      
      private var Renamed5836:Renamed5834;
      
      public function Renamed5874(param1:Renamed3065, param2:Renamed3044, param3:Renamed5834, param4:Renamed5823)
      {
         super();
         this.Renamed3313 = param1;
         this.effects = param4;
         this.Renamed5836 = param3;
         this.Renamed3326 = param2;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
      }
      
      public function destroy() : void
      {
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
      }
      
      public function reset() : void
      {
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function Renamed3454() : void
      {
         this.Renamed3110.Renamed1054(Renamed3195);
         this.Renamed5879(Renamed3195);
      }
      
      private function Renamed5879(param1:Renamed664) : void
      {
         this.Renamed3110.Renamed696().addWorldForceScaled(param1.Renamed693,param1.direction,-this.Renamed3313.Renamed3068());
         this.Renamed3110.Renamed1032();
         this.effects.Renamed3348(this.Renamed3110.Renamed1071(),this.Renamed3110.Renamed1020());
      }
      
      public function Renamed3493(param1:Vector3) : void
      {
         this.Renamed3110.Renamed1054(Renamed3195);
         this.Renamed5879(Renamed3195);
         this.effects.Renamed3472(param1);
         this.effects.Renamed3473(Renamed3195.Renamed689,param1);
         this.Renamed5880(param1,null);
      }
      
      public function Renamed3494(param1:Tank, param2:Vector3) : void
      {
         this.Renamed3110.Renamed1054(Renamed3195);
         this.Renamed5879(Renamed3195);
         this.effects.Renamed3472(param2);
         this.Renamed5881(param1,param2,Renamed3195.Renamed693);
         this.Renamed5880(param2,param1.Renamed696());
      }
      
      private function Renamed5881(param1:Tank, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Number = NaN;
         Renamed5878.diff(param2,param3).normalize();
         if(Vector3.isFiniteVector(Renamed5878))
         {
            _loc4_ = this.Renamed5882(param2);
            param1.Renamed1029(param2,Renamed5878,this.Renamed3313.Renamed3067() * _loc4_);
         }
      }
      
      private function Renamed5882(param1:Vector3) : Number
      {
         return this.Renamed3326.Renamed3447(param1.distanceTo(Renamed3195.Renamed693));
      }
      
      private function Renamed5880(param1:Vector3, param2:Body) : void
      {
         var _loc3_:Number = this.Renamed5882(param1);
         this.Renamed5836.Renamed5838(Tank(this.Renamed3110).tankData.turret,param1,_loc3_,param2);
      }
   }
}


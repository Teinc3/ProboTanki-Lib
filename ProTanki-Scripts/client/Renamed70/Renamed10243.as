package Renamed70
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3046;
   import Renamed65.Renamed66;
   import Renamed381.Renamed3045;
   
   public class Renamed10243 implements Renamed990
   {
      private static const Renamed10178:Renamed664 = new Renamed664();
      
      private var Renamed3066:Number;
      
      private var Renamed10182:Renamed4686;
      
      private var effects:Renamed10245;
      
      private var Renamed3110:Renamed925;
      
      public function Renamed10243(param1:ClientObject, param2:Renamed66, param3:Renamed10242)
      {
         super();
         var _loc4_:Renamed3046 = new Renamed3046(param1);
         var _loc5_:Renamed3045 = _loc4_.Renamed3055();
         var _loc6_:Renamed10242 = param3;
         var _loc7_:Renamed4686 = new Renamed4686(_loc4_,param2,_loc6_.Renamed10251(param1));
         this.Renamed3066 = _loc5_.Renamed3068();
         this.Renamed10182 = _loc7_;
         this.effects = _loc6_.Renamed10250(param1);
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
      }
      
      public function fire(param1:int, param2:int, param3:Vector3) : void
      {
         this.Renamed3110.Renamed1054(Renamed10178,param1);
         this.Renamed3348(param1,Renamed10178);
         var _loc4_:Renamed10231 = this.Renamed10182.Renamed10189();
         _loc4_.Renamed6065(Renamed10178,param3,this.Renamed3110.Renamed696(),param2);
      }
      
      public function Renamed4934(param1:int) : void
      {
         this.Renamed3110.Renamed1054(Renamed10178,param1);
         this.Renamed3348(param1,Renamed10178);
      }
      
      private function Renamed3348(param1:int, param2:Renamed664) : void
      {
         this.Renamed3110.Renamed696().addWorldForceScaled(param2.Renamed693,param2.direction,-this.Renamed3066);
         this.Renamed3110.Renamed1032(1);
         this.effects.Renamed3348(this.Renamed3110.Renamed1020(),this.Renamed3110.Renamed1071(param1));
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
   }
}


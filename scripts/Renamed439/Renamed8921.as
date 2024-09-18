package Renamed439
{
   import Renamed6781.Renamed6782;
   import Renamed278.Renamed3514;
   import Renamed278.Renamed3515;
   import alternativa.object.ClientObject;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapons.targeting.priority.Renamed3508;
   
   public class Renamed3509 implements Renamed3514
   {
      private var Renamed8919:Renamed4715;
      
      private var Renamed8920:Renamed6782;
      
      public function Renamed3509(param1:ClientObject, param2:Number, param3:Renamed3508)
      {
         super();
         this.Renamed8919 = new Renamed4715(param1,param2);
         this.Renamed8920 = new Renamed6782(param3);
      }
      
      public function Renamed3522(param1:Renamed664) : Vector.<Renamed3515>
      {
         var _loc2_:Vector.<Renamed3533> = this.Renamed8919.Renamed8915(param1);
         return this.Renamed8920.Renamed6787(param1,_loc2_);
      }
   }
}


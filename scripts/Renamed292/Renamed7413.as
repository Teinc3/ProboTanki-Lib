package Renamed292
{
   import projects.tanks.client.battlefield.models.bonus.battle.Renamed7400;
   
   public class Renamed7413
   {
      private var Renamed7418:Number;
      
      private var _bonuses:Vector.<Renamed4159>;
      
      public function Renamed7413(param1:Number = 0, param2:Vector.<Renamed4159> = null)
      {
         super();
         this.Renamed7418 = param1;
         this._bonuses = param2;
      }
      
      public function get Renamed7419() : Number
      {
         return this.Renamed7418;
      }
      
      public function set Renamed7419(param1:Number) : void
      {
         this.Renamed7418 = param1;
      }
      
      public function get bonuses() : Vector.<Renamed4159>
      {
         return this._bonuses;
      }
      
      public function set bonuses(param1:Vector.<Renamed4159>) : void
      {
         this._bonuses = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattlefieldBonusesCC [";
         _loc1_ += "bonusFallSpeed = " + this.Renamed7419 + " ";
         _loc1_ += "bonuses = " + this.bonuses + " ";
         return _loc1_ + "]";
      }
   }
}


package projects.tanks.client.battlefield.models.bonus.battle
{
   import Renamed602.Renamed603;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4159
   {
      private var Renamed4160:IGameObject;
      
      private var _bonusId:String;
      
      private var Renamed4161:int;
      
      private var Renamed4162:Renamed603;
      
      public function Renamed4159(param1:IGameObject = null, param2:String = null, param3:int = 0, param4:Renamed603 = null)
      {
         super();
         this.Renamed4160 = param1;
         this._bonusId = param2;
         this.Renamed4161 = param3;
         this.Renamed4162 = param4;
      }
      
      public function get Renamed4163() : IGameObject
      {
         return this.Renamed4160;
      }
      
      public function set Renamed4163(param1:IGameObject) : void
      {
         this.Renamed4160 = param1;
      }
      
      public function get bonusId() : String
      {
         return this._bonusId;
      }
      
      public function set bonusId(param1:String) : void
      {
         this._bonusId = param1;
      }
      
      public function get Renamed4164() : int
      {
         return this.Renamed4161;
      }
      
      public function set Renamed4164(param1:int) : void
      {
         this.Renamed4161 = param1;
      }
      
      public function get Renamed4165() : Renamed603
      {
         return this.Renamed4162;
      }
      
      public function set Renamed4165(param1:Renamed603) : void
      {
         this.Renamed4162 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BonusSpawnData [";
         _loc1_ += "battleBonusObject = " + this.Renamed4163 + " ";
         _loc1_ += "bonusId = " + this.bonusId + " ";
         _loc1_ += "lifeTime = " + this.Renamed4164 + " ";
         _loc1_ += "spawnPosition = " + this.Renamed4165 + " ";
         return _loc1_ + "]";
      }
   }
}


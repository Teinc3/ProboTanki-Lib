package projects.tanks.client.battlefield.models.bonus.battle
{
   import §;"?§.§#">§;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §1#1§
   {
      private var §'9§:IGameObject;
      
      private var _bonusId:String;
      
      private var §]F§:int;
      
      private var §^n§:§#">§;
      
      public function §1#1§(param1:IGameObject = null, param2:String = null, param3:int = 0, param4:§#">§ = null)
      {
         super();
         this.§'9§ = param1;
         this._bonusId = param2;
         this.§]F§ = param3;
         this.§^n§ = param4;
      }
      
      public function get §extends catch extends§() : IGameObject
      {
         return this.§'9§;
      }
      
      public function set §extends catch extends§(param1:IGameObject) : void
      {
         this.§'9§ = param1;
      }
      
      public function get bonusId() : String
      {
         return this._bonusId;
      }
      
      public function set bonusId(param1:String) : void
      {
         this._bonusId = param1;
      }
      
      public function get §function catch import§() : int
      {
         return this.§]F§;
      }
      
      public function set §function catch import§(param1:int) : void
      {
         this.§]F§ = param1;
      }
      
      public function get § !"§() : §#">§
      {
         return this.§^n§;
      }
      
      public function set § !"§(param1:§#">§) : void
      {
         this.§^n§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BonusSpawnData [";
         _loc1_ += "battleBonusObject = " + this.§extends catch extends§ + " ";
         _loc1_ += "bonusId = " + this.bonusId + " ";
         _loc1_ += "lifeTime = " + this.§function catch import§ + " ";
         _loc1_ += "spawnPosition = " + this.§ !"§ + " ";
         return _loc1_ + "]";
      }
   }
}


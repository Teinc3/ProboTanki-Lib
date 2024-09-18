package §;#L§
{
   import projects.tanks.client.battlefield.models.bonus.battle.§1§;
   
   public class §throw var switch§
   {
      private var §;!5§:Number;
      
      private var _bonuses:Vector.<§1#1§>;
      
      public function §throw var switch§(param1:Number = 0, param2:Vector.<§1#1§> = null)
      {
         super();
         this.§;!5§ = param1;
         this._bonuses = param2;
      }
      
      public function get §!2§() : Number
      {
         return this.§;!5§;
      }
      
      public function set §!2§(param1:Number) : void
      {
         this.§;!5§ = param1;
      }
      
      public function get bonuses() : Vector.<§1#1§>
      {
         return this._bonuses;
      }
      
      public function set bonuses(param1:Vector.<§1#1§>) : void
      {
         this._bonuses = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattlefieldBonusesCC [";
         _loc1_ += "bonusFallSpeed = " + this.§!2§ + " ";
         _loc1_ += "bonuses = " + this.bonuses + " ";
         return _loc1_ + "]";
      }
   }
}


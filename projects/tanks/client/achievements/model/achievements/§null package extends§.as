package projects.tanks.client.achievements.model.achievements
{
   public class §null package extends§
   {
      public static const FIRST_RANK_UP:§null package extends§ = new §null package extends§(0,"FIRST_RANK_UP");
      
      public static const FIRST_PURCHASE:§null package extends§ = new §null package extends§(1,"FIRST_PURCHASE");
      
      public static const FIGHT_FIRST_BATTLE:§null package extends§ = new §null package extends§(2,"FIGHT_FIRST_BATTLE");
      
      public static const FIRST_DONATE:§null package extends§ = new §null package extends§(3,"FIRST_DONATE");
      
      public static const FIRST_REFERRAL:§null package extends§ = new §null package extends§(4,"FIRST_REFERRAL");
      
      public static const SET_EMAIL:§null package extends§ = new §null package extends§(5,"SET_EMAIL");
      
      private var _value:int;
      
      private var _name:String;
      
      public function §null package extends§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<§null package extends§>
      {
         var _loc1_:Vector.<§null package extends§> = new Vector.<§null package extends§>();
         _loc1_.push(FIRST_RANK_UP);
         _loc1_.push(FIRST_PURCHASE);
         _loc1_.push(FIGHT_FIRST_BATTLE);
         _loc1_.push(FIRST_DONATE);
         _loc1_.push(FIRST_REFERRAL);
         _loc1_.push(SET_EMAIL);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "Achievement [" + this._name + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}


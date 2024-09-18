package projects.tanks.client.achievements.model.achievements
{
   public class Renamed2072
   {
      public static const FIRST_RANK_UP:Renamed2072 = new Renamed2072(0,"FIRST_RANK_UP");
      
      public static const FIRST_PURCHASE:Renamed2072 = new Renamed2072(1,"FIRST_PURCHASE");
      
      public static const FIGHT_FIRST_BATTLE:Renamed2072 = new Renamed2072(2,"FIGHT_FIRST_BATTLE");
      
      public static const FIRST_DONATE:Renamed2072 = new Renamed2072(3,"FIRST_DONATE");
      
      public static const FIRST_REFERRAL:Renamed2072 = new Renamed2072(4,"FIRST_REFERRAL");
      
      public static const SET_EMAIL:Renamed2072 = new Renamed2072(5,"SET_EMAIL");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Renamed2072(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Renamed2072>
      {
         var _loc1_:Vector.<Renamed2072> = new Vector.<Renamed2072>();
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


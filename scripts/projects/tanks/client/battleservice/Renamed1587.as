package projects.tanks.client.battleservice
{
   public class Renamed1587
   {
      public static const DM:Renamed1587 = new Renamed1587(0,"DM");
      
      public static const TDM:Renamed1587 = new Renamed1587(1,"TDM");
      
      public static const CTF:Renamed1587 = new Renamed1587(2,"CTF");
      
      public static const CP:Renamed1587 = new Renamed1587(3,"CP");
      
      public static const AS:Renamed1587 = new Renamed1587(4,"AS");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Renamed1587(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Renamed1587>
      {
         var _loc1_:Vector.<Renamed1587> = new Vector.<Renamed1587>();
         _loc1_.push(DM);
         _loc1_.push(TDM);
         _loc1_.push(CTF);
         _loc1_.push(CP);
         _loc1_.push(AS);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "BattleMode [" + this._name + "]";
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


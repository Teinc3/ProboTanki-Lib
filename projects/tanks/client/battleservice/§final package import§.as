package projects.tanks.client.battleservice
{
   public class §final package import§
   {
      public static const DM:§final package import§ = new §final package import§(0,"DM");
      
      public static const TDM:§final package import§ = new §final package import§(1,"TDM");
      
      public static const CTF:§final package import§ = new §final package import§(2,"CTF");
      
      public static const CP:§final package import§ = new §final package import§(3,"CP");
      
      public static const AS:§final package import§ = new §final package import§(4,"AS");
      
      private var _value:int;
      
      private var _name:String;
      
      public function §final package import§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<§final package import§>
      {
         var _loc1_:Vector.<§final package import§> = new Vector.<§final package import§>();
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


package Renamed4622
{
   public class Renamed5632
   {
      private var _name:String;
      
      private var Renamed5635:Vector.<Renamed5636>;
      
      public function Renamed5632(param1:String = null, param2:Vector.<Renamed5636> = null)
      {
         super();
         this._name = param1;
         this.Renamed5635 = param2;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get Renamed5637() : Vector.<Renamed5636>
      {
         return this.Renamed5635;
      }
      
      public function set Renamed5637(param1:Vector.<Renamed5636>) : void
      {
         this.Renamed5635 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LightingEfect [";
         _loc1_ += "name = " + this.name + " ";
         _loc1_ += "records = " + this.Renamed5637 + " ";
         return _loc1_ + "]";
      }
   }
}


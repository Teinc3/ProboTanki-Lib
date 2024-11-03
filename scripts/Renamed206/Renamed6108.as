package Renamed206
{
   import Renamed602.3DPositionVector;
   
   public class Renamed6103
   {
      private var _id:int;
      
      private var _name:String;
      
      private var _position:3DPositionVector;
      
      private var _score:Number;
      
      private var Renamed6104:Number;
      
      private var _state:Renamed5125;
      
      private var Renamed6105:Vector.<String>;
      
      public function Renamed6103(param1:int = 0, param2:String = null, param3:3DPositionVector = null, param4:Number = 0, param5:Number = 0, param6:Renamed5125 = null, param7:Vector.<String> = null)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._position = param3;
         this._score = param4;
         this.Renamed6104 = param5;
         this._state = param6;
         this.Renamed6105 = param7;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get position() : 3DPositionVector
      {
         return this._position;
      }
      
      public function set position(param1:3DPositionVector) : void
      {
         this._position = param1;
      }
      
      public function get score() : Number
      {
         return this._score;
      }
      
      public function set score(param1:Number) : void
      {
         this._score = param1;
      }
      
      public function get Renamed6106() : Number
      {
         return this.Renamed6104;
      }
      
      public function set Renamed6106(param1:Number) : void
      {
         this.Renamed6104 = param1;
      }
      
      public function get state() : Renamed5125
      {
         return this._state;
      }
      
      public function set state(param1:Renamed5125) : void
      {
         this._state = param1;
      }
      
      public function get Renamed6107() : Vector.<String>
      {
         return this.Renamed6105;
      }
      
      public function set Renamed6107(param1:Vector.<String>) : void
      {
         this.Renamed6105 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClientPointData [";
         _loc1_ += "id = " + this.id + " ";
         _loc1_ += "name = " + this.name + " ";
         _loc1_ += "position = " + this.position + " ";
         _loc1_ += "score = " + this.score + " ";
         _loc1_ += "scoreChangeRate = " + this.Renamed6106 + " ";
         _loc1_ += "state = " + this.state + " ";
         _loc1_ += "tankIds = " + this.Renamed6107 + " ";
         return _loc1_ + "]";
      }
   }
}


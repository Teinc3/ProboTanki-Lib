package Renamed206
{
   import Renamed289.Renamed6109;
   import Renamed289.Renamed5084;
   
   public class Renamed6110
   {
      private var Renamed6111:Number;
      
      private var Renamed6112:Number;
      
      private var Renamed6113:Number;
      
      private var Renamed6114:Vector.<Renamed6103>;
      
      private var _resources:Renamed5084;
      
      private var Renamed6115:Renamed6109;
      
      public function Renamed6110(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Vector.<Renamed6103> = null, param5:Renamed5084 = null, param6:Renamed6109 = null)
      {
         super();
         this.Renamed6111 = param1;
         this.Renamed6112 = param2;
         this.Renamed6113 = param3;
         this.Renamed6114 = param4;
         this._resources = param5;
         this.Renamed6115 = param6;
      }
      
      public function get Renamed6116() : Number
      {
         return this.Renamed6111;
      }
      
      public function set Renamed6116(param1:Number) : void
      {
         this.Renamed6111 = param1;
      }
      
      public function get Renamed6117() : Number
      {
         return this.Renamed6112;
      }
      
      public function set Renamed6117(param1:Number) : void
      {
         this.Renamed6112 = param1;
      }
      
      public function get Renamed6118() : Number
      {
         return this.Renamed6113;
      }
      
      public function set Renamed6118(param1:Number) : void
      {
         this.Renamed6113 = param1;
      }
      
      public function get Renamed6119() : Vector.<Renamed6103>
      {
         return this.Renamed6114;
      }
      
      public function set Renamed6119(param1:Vector.<Renamed6103>) : void
      {
         this.Renamed6114 = param1;
      }
      
      public function get resources() : Renamed5084
      {
         return this._resources;
      }
      
      public function set resources(param1:Renamed5084) : void
      {
         this._resources = param1;
      }
      
      public function get Renamed974() : Renamed6109
      {
         return this.Renamed6115;
      }
      
      public function set Renamed974(param1:Renamed6109) : void
      {
         this.Renamed6115 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ControlPointsCC [";
         _loc1_ += "keypointTriggerRadius = " + this.Renamed6116 + " ";
         _loc1_ += "keypointVisorHeight = " + this.Renamed6117 + " ";
         _loc1_ += "minesRestrictionRadius = " + this.Renamed6118 + " ";
         _loc1_ += "points = " + this.Renamed6119 + " ";
         _loc1_ += "resources = " + this.resources + " ";
         _loc1_ += "sounds = " + this.Renamed974 + " ";
         return _loc1_ + "]";
      }
   }
}


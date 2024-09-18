package Renamed306
{
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed1344
   {
      private var _alpha:Number;
      
      private var Renamed7553:Number;
      
      private var Renamed7554:Number;
      
      private var Renamed7555:Number;
      
      private var Renamed7556:MultiframeImageResource;
      
      private var Renamed7557:Number;
      
      public function Renamed1344(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:MultiframeImageResource = null, param6:Number = 0)
      {
         super();
         this._alpha = param1;
         this.Renamed7553 = param2;
         this.Renamed7554 = param3;
         this.Renamed7555 = param4;
         this.Renamed7556 = param5;
         this.Renamed7557 = param6;
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         this._alpha = param1;
      }
      
      public function get Renamed849() : Number
      {
         return this.Renamed7553;
      }
      
      public function set Renamed849(param1:Number) : void
      {
         this.Renamed7553 = param1;
      }
      
      public function get dustFarDistance() : Number
      {
         return this.Renamed7554;
      }
      
      public function set dustFarDistance(param1:Number) : void
      {
         this.Renamed7554 = param1;
      }
      
      public function get dustNearDistance() : Number
      {
         return this.Renamed7555;
      }
      
      public function set dustNearDistance(param1:Number) : void
      {
         this.Renamed7555 = param1;
      }
      
      public function get dustParticle() : MultiframeImageResource
      {
         return this.Renamed7556;
      }
      
      public function set dustParticle(param1:MultiframeImageResource) : void
      {
         this.Renamed7556 = param1;
      }
      
      public function get dustSize() : Number
      {
         return this.Renamed7557;
      }
      
      public function set dustSize(param1:Number) : void
      {
         this.Renamed7557 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DustParams [";
         _loc1_ += "alpha = " + this.alpha + " ";
         _loc1_ += "density = " + this.Renamed849 + " ";
         _loc1_ += "dustFarDistance = " + this.dustFarDistance + " ";
         _loc1_ += "dustNearDistance = " + this.dustNearDistance + " ";
         _loc1_ += "dustParticle = " + this.dustParticle + " ";
         _loc1_ += "dustSize = " + this.dustSize + " ";
         return _loc1_ + "]";
      }
   }
}


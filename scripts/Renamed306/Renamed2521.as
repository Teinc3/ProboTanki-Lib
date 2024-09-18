package Renamed306
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Renamed2521
   {
      private var Renamed7558:ImageResource;
      
      private var Renamed7559:ImageResource;
      
      private var Renamed7560:ImageResource;
      
      private var _left:ImageResource;
      
      private var _right:ImageResource;
      
      private var Renamed7561:ImageResource;
      
      public function Renamed2521(param1:ImageResource = null, param2:ImageResource = null, param3:ImageResource = null, param4:ImageResource = null, param5:ImageResource = null, param6:ImageResource = null)
      {
         super();
         this.Renamed7558 = param1;
         this.Renamed7559 = param2;
         this.Renamed7560 = param3;
         this._left = param4;
         this._right = param5;
         this.Renamed7561 = param6;
      }
      
      public function get back() : ImageResource
      {
         return this.Renamed7558;
      }
      
      public function set back(param1:ImageResource) : void
      {
         this.Renamed7558 = param1;
      }
      
      public function get bottom() : ImageResource
      {
         return this.Renamed7559;
      }
      
      public function set bottom(param1:ImageResource) : void
      {
         this.Renamed7559 = param1;
      }
      
      public function get front() : ImageResource
      {
         return this.Renamed7560;
      }
      
      public function set front(param1:ImageResource) : void
      {
         this.Renamed7560 = param1;
      }
      
      public function get left() : ImageResource
      {
         return this._left;
      }
      
      public function set left(param1:ImageResource) : void
      {
         this._left = param1;
      }
      
      public function get right() : ImageResource
      {
         return this._right;
      }
      
      public function set right(param1:ImageResource) : void
      {
         this._right = param1;
      }
      
      public function get top() : ImageResource
      {
         return this.Renamed7561;
      }
      
      public function set top(param1:ImageResource) : void
      {
         this.Renamed7561 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "SkyboxSides [";
         _loc1_ += "back = " + this.back + " ";
         _loc1_ += "bottom = " + this.bottom + " ";
         _loc1_ += "front = " + this.front + " ";
         _loc1_ += "left = " + this.left + " ";
         _loc1_ += "right = " + this.right + " ";
         _loc1_ += "top = " + this.top + " ";
         return _loc1_ + "]";
      }
   }
}


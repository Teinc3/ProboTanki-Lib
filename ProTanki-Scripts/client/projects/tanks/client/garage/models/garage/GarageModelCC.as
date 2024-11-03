package projects.tanks.client.garage.models.garage
{
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class GarageModelCC
   {
      private var _garageBox:Tanks3DSResource;
      
      public function GarageModelCC(param1:Tanks3DSResource = null)
      {
         super();
         this._garageBox = param1;
      }
      
      public function get garageBox() : Tanks3DSResource
      {
         return this._garageBox;
      }
      
      public function set garageBox(param1:Tanks3DSResource) : void
      {
         this._garageBox = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "GarageModelCC [";
         _loc1_ += "garageBox = " + this.garageBox + " ";
         return _loc1_ + "]";
      }
   }
}


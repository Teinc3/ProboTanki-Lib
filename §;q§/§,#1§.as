package §;q§
{
   public class §,#1§
   {
      private var §do package switch§:int;
      
      private var §do package case§:int;
      
      public function §,#1§(param1:int = 0, param2:int = 0)
      {
         super();
         this.§do package switch§ = param1;
         this.§do package case§ = param2;
      }
      
      public function get magazineReloadTime() : int
      {
         return this.§do package switch§;
      }
      
      public function set magazineReloadTime(param1:int) : void
      {
         this.§do package switch§ = param1;
      }
      
      public function get magazineSize() : int
      {
         return this.§do package case§;
      }
      
      public function set magazineSize(param1:int) : void
      {
         this.§do package case§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShotgunShotCC [";
         _loc1_ += "magazineReloadTime = " + this.magazineReloadTime + " ";
         _loc1_ += "magazineSize = " + this.magazineSize + " ";
         return _loc1_ + "]";
      }
   }
}


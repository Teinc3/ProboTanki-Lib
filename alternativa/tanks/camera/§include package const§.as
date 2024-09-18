package alternativa.tanks.camera
{
   public class §include package const§
   {
      private var §static class§:Vector.<§!"t§>;
      
      public function §include package const§(param1:int)
      {
         super();
         this.§static class§ = new Vector.<§!"t§>(param1);
      }
      
      public function getBookmark(param1:uint) : §!"t§
      {
         if(param1 < this.§static class§.length)
         {
            return this.§static class§[param1];
         }
         return null;
      }
      
      public function saveCurrentPositionCameraToBookmark(param1:uint) : void
      {
         if(param1 < this.§static class§.length)
         {
            this.§9!k§(param1).§,"l§();
         }
      }
      
      private function §9!k§(param1:uint) : §!"t§
      {
         if(this.§static class§[param1] == null)
         {
            this.§static class§[param1] = new §!"t§();
         }
         return this.§static class§[param1];
      }
   }
}


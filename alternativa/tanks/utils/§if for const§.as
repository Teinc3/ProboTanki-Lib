package alternativa.tanks.utils
{
   public class §if for const§
   {
      private var §3"P§:Vector.<uint>;
      
      public function §if for const§()
      {
         this.§3"P§ = new Vector.<uint>();
         super();
      }
      
      public function §&#_§(param1:uint) : Boolean
      {
         return this.§3"P§.indexOf(param1) != -1;
      }
      
      public function §try var do§(param1:uint) : void
      {
         if(this.§3"P§.indexOf(param1) == -1)
         {
            this.§3"P§.push(param1);
         }
      }
      
      public function §3t§(param1:uint) : void
      {
         var _loc2_:Number = Number(this.§3"P§.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.§3"P§.splice(_loc2_,1);
         }
      }
   }
}


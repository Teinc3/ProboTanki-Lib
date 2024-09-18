package Renamed838
{
   internal class Renamed3031 implements IRayCollisionFilter
   {
      private var body:Body;
      
      public function Renamed3031(param1:Body)
      {
         super();
         this.body = param1;
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.body != param1;
      }
   }
}


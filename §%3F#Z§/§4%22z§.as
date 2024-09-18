package §?#Z§
{
   internal class §4"z§ implements IRayCollisionFilter
   {
      private var body:Body;
      
      public function §4"z§(param1:Body)
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


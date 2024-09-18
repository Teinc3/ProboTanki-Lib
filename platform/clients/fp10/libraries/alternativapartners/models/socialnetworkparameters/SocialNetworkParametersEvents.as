package platform.clients.fp10.libraries.alternativapartners.models.socialnetworkparameters
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class SocialNetworkParametersEvents implements SocialNetworkParameters
   {
      private var object:IGameObject;
      
      private var impl:Vector.<SocialNetworkParameters>;
      
      public function SocialNetworkParametersEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<SocialNetworkParameters>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function hasOwnPaymentSystem() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:SocialNetworkParameters = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.hasOwnPaymentSystem();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function hasSocialFunction() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:SocialNetworkParameters = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.hasSocialFunction();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}


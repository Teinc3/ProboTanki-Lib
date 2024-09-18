package platform.clients.fp10.libraries.alternativapartners.type
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IPartnerEvents implements IPartner
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IPartner>;
      
      public function IPartnerEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IPartner>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getLoginParameters(param1:IParametersListener) : void
      {
         var i:int = 0;
         var m:IPartner = null;
         var listener:IParametersListener = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.getLoginParameters(listener);
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function hasPaymentAction() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IPartner = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.hasPaymentAction();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function paymentAction() : void
      {
         var i:int = 0;
         var m:IPartner = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.paymentAction();
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getFailRedirectUrl() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:IPartner = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getFailRedirectUrl();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function isExternalLoginAllowed() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IPartner = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isExternalLoginAllowed();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function hasRatings() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IPartner = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.hasRatings();
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


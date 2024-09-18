package alternativa.tanks.servermodels.socialnetwork
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §`"c§ implements IExternalEntranceModel
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IExternalEntranceModel>;
      
      public function §`"c§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IExternalEntranceModel>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function startExternalRegisterUser(param1:String, param2:Boolean, param3:String) : void
      {
         var i:int = 0;
         var m:IExternalEntranceModel = null;
         var socialNetworkId:String = param1;
         var rememberMe:Boolean = param2;
         var domain:String = param3;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.startExternalRegisterUser(socialNetworkId,rememberMe,domain);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function startExternalLoginUser(param1:String, param2:Boolean, param3:String) : void
      {
         var i:int = 0;
         var m:IExternalEntranceModel = null;
         var socialNetworkId:String = param1;
         var rememberMe:Boolean = param2;
         var domain:String = param3;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.startExternalLoginUser(socialNetworkId,rememberMe,domain);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function finishExternalRegisterUser(param1:String, param2:String) : void
      {
         var i:int = 0;
         var m:IExternalEntranceModel = null;
         var uid:String = param1;
         var referralHash:String = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.finishExternalRegisterUser(uid,referralHash);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function login(param1:String, param2:String) : void
      {
         var i:int = 0;
         var m:IExternalEntranceModel = null;
         var uid:String = param1;
         var password:String = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.login(uid,password);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function validationSuccess() : void
      {
      }
   }
}


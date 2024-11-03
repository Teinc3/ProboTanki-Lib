package platform.clients.fp10.libraries.alternativapartners.type
{
   import platform.client.core.general.socialnetwork.types.LoginParameters;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IParametersListenerEvents implements IParametersListener
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IParametersListener>;
      
      public function IParametersListenerEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IParametersListener>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function onSetParameters(param1:LoginParameters) : void
      {
         var i:int = 0;
         var m:IParametersListener = null;
         var parameters:LoginParameters = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.onSetParameters(parameters);
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function onFailSetParameters() : void
      {
         var i:int = 0;
         var m:IParametersListener = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.onFailSetParameters();
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}


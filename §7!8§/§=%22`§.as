package §7!8§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §="`§ implements §<c§
   {
      private var object:IGameObject;
      
      private var impl:§<c§;
      
      public function §="`§(param1:IGameObject, param2:§<c§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §get const try§() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.§get const try§();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §var var in§() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.§var var in§();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §9@§() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.§9@§();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}


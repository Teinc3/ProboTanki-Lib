package §%3§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §while catch final§ implements §?"p§
   {
      private var object:IGameObject;
      
      private var impl:§?"p§;
      
      public function §while catch final§(param1:IGameObject, param2:§?"p§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §?$#§() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.§?$#§();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §case package native§() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.§case package native§();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §const set native§(param1:§2!$§) : void
      {
         var §for const break§:§2!$§ = param1;
         var §<!G§:§2!$§ = §for const break§;
         try
         {
            Model.object = this.object;
            this.impl.§const set native§(§<!G§);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §override package super§() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.§override package super§();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}


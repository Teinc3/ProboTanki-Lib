package §]R§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §try package do§ implements §^H§
   {
      private var object:IGameObject;
      
      private var impl:§^H§;
      
      public function §try package do§(param1:IGameObject, param2:§^H§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §do const each§() : §in true§
      {
         var §0!J§:§in true§ = null;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§do const each§();
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
      }
   }
}


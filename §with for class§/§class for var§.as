package §with for class§
{
   import alternativa.object.ClientObject;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §class for var§ implements §implements var include§
   {
      private var object:IGameObject;
      
      private var impl:§implements var include§;
      
      public function §class for var§(param1:IGameObject, param2:§implements var include§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §if var set§(param1:ClientObject) : §null var§
      {
         var §<#A§:ClientObject = param1;
         var §0!J§:§null var§ = null;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§if var set§(§<#A§);
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
      }
   }
}


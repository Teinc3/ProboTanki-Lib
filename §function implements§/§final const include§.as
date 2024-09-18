package §function implements§
{
   import §final package set§.§`"B§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §final const include§ implements §return var class§
   {
      private var object:IGameObject;
      
      private var impl:§return var class§;
      
      public function §final const include§(param1:IGameObject, param2:§return var class§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §true extends§() : §`"B§
      {
         var §0!J§:§`"B§ = null;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§true extends§();
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
      }
   }
}


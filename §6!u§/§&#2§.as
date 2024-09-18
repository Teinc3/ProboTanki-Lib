package §6!u§
{
   import §7"j§.§include finally§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §&#2§ implements §false set false§
   {
      private var object:IGameObject;
      
      private var impl:§false set false§;
      
      public function §&#2§(param1:IGameObject, param2:§false set false§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §switch for return§(param1:String) : §include finally§
      {
         var §for const break§:String = param1;
         var §0!J§:§include finally§ = null;
         var §continue for for§:String = §for const break§;
         try
         {
            Model.object = this.object;
            §0!J§ = this.impl.§switch for return§(§continue for for§);
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
      }
   }
}


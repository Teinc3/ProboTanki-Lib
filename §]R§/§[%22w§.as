package §]R§
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §["w§ implements §^H§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§^H§>;
      
      public function §["w§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§^H§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §do const each§() : §in true§
      {
         var §0!J§:§in true§ = null;
         var §final package§:int = 0;
         var §finally const catch§:§^H§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§do const each§();
               §final package§++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return §0!J§;
      }
   }
}


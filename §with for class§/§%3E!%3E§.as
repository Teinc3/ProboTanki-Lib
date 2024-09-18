package §with for class§
{
   import alternativa.object.ClientObject;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §>!>§ implements §implements var include§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§implements var include§>;
      
      public function §>!>§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§implements var include§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §if var set§(param1:ClientObject) : §null var§
      {
         var §<#A§:ClientObject = param1;
         var §0!J§:§null var§ = null;
         var §final package§:int = 0;
         var §finally const catch§:§implements var include§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§if var set§(§<#A§);
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


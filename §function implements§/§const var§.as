package §function implements§
{
   import §final package set§.§`"B§;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §const var§ implements §return var class§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§return var class§>;
      
      public function §const var§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§return var class§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §true extends§() : §`"B§
      {
         var §0!J§:§`"B§ = null;
         var §final package§:int = 0;
         var §finally const catch§:§return var class§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§true extends§();
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


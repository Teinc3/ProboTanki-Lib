package §7!8§
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §static const default§ implements §<c§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§<c§>;
      
      public function §static const default§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§<c§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §get const try§() : void
      {
         var §final package§:int = 0;
         var §finally const catch§:§<c§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§get const try§();
               §final package§++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §var var in§() : void
      {
         var §final package§:int = 0;
         var §finally const catch§:§<c§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§var var in§();
               §final package§++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §9@§() : void
      {
         var §final package§:int = 0;
         var §finally const catch§:§<c§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§9@§();
               §final package§++;
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


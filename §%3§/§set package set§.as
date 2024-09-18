package §%3§
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §set package set§ implements §?"p§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§?"p§>;
      
      public function §set package set§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§?"p§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §?$#§() : void
      {
         var §final package§:int = 0;
         var §finally const catch§:§?"p§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§?$#§();
               §final package§++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §case package native§() : void
      {
         var §final package§:int = 0;
         var §finally const catch§:§?"p§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§case package native§();
               §final package§++;
            }
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
         var §final package§:int = 0;
         var §finally const catch§:§?"p§ = null;
         var §<!G§:§2!$§ = §for const break§;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§const set native§(§<!G§);
               §final package§++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §override package super§() : void
      {
         var §final package§:int = 0;
         var §finally const catch§:§?"p§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§override package super§();
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


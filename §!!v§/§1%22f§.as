package §!!v§
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §1"f§ implements §use catch true§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§use catch true§>;
      
      public function §1"f§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§use catch true§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §6#C§(param1:int, param2:int, param3:Boolean) : void
      {
         var §for const break§:int = param1;
         var §!!u§:int = param2;
         var §`#o§:Boolean = param3;
         var §final package§:int = 0;
         var §finally const catch§:§use catch true§ = null;
         var §4#Z§:int = §for const break§;
         var §get static§:int = §!!u§;
         var §function for final§:Boolean = §`#o§;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§6#C§(§4#Z§,§get static§,§function for final§);
               §final package§++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function §if set null§(param1:int, param2:Boolean) : void
      {
         var §for const break§:int = param1;
         var §!!u§:Boolean = param2;
         var §final package§:int = 0;
         var §finally const catch§:§use catch true§ = null;
         var §get static§:int = §for const break§;
         var §function for final§:Boolean = §!!u§;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§if set null§(§get static§,§function for final§);
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


package §6!u§
{
   import §7"j§.§include finally§;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §%i§ implements §false set false§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§false set false§>;
      
      public function §%i§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§false set false§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §switch for return§(param1:String) : §include finally§
      {
         var §for const break§:String = param1;
         var §0!J§:§include finally§ = null;
         var §final package§:int = 0;
         var §finally const catch§:§false set false§ = null;
         var §continue for for§:String = §for const break§;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§switch for return§(§continue for for§);
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


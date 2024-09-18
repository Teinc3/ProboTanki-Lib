package §switch package return§
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §throw const case§ implements §else for override§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§else for override§>;
      
      public function §throw const case§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§else for override§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §^J§() : Number
      {
         var §0!J§:Number = NaN;
         var §final package§:int = 0;
         var §finally const catch§:§else for override§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §0!J§ = §finally const catch§.§^J§();
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


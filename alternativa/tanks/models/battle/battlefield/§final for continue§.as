package alternativa.tanks.models.battle.battlefield
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §final for continue§ implements §]#P§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§]#P§>;
      
      public function §final for continue§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§]#P§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §continue catch var§() : void
      {
         var §final package§:int = 0;
         var §finally const catch§:§]#P§ = null;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§continue catch var§();
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


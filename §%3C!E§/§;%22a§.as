package §<!E§
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §;"a§ implements §include var with§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§include var with§>;
      
      public function §;"a§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§include var with§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function continueBattle() : void
      {
         var i:int = 0;
         var m:§include var with§ = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.continueBattle();
               i++;
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


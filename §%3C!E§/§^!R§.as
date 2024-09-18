package §<!E§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §^!R§ implements §include var with§
   {
      private var object:IGameObject;
      
      private var impl:§include var with§;
      
      public function §^!R§(param1:IGameObject, param2:§include var with§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function continueBattle() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.continueBattle();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}


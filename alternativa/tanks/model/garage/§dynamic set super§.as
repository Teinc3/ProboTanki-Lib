package alternativa.tanks.model.garage
{
   import flash.display.BitmapData;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §dynamic set super§ implements §null package override§
   {
      private var object:IGameObject;
      
      private var impl:§null package override§;
      
      public function §dynamic set super§(param1:IGameObject, param2:§null package override§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function showConfirmAlert(param1:String, param2:int, param3:BitmapData, param4:Boolean, param5:int, param6:int = -1, param7:Boolean = false) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.showConfirmAlert(param1,param2,param3,param4,param5,param6,param7);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}


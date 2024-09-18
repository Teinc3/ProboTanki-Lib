package §0#<§
{
   import flash.display.DisplayObjectContainer;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §function true§ implements §6<§
   {
      private var object:IGameObject;
      
      private var impl:§6<§;
      
      public function §function true§(param1:IGameObject, param2:§6<§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function updateActionElements(param1:DisplayObjectContainer) : void
      {
         var actionContainer:DisplayObjectContainer = param1;
         try
         {
            Model.object = this.object;
            this.impl.updateActionElements(actionContainer);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function handleDoubleClickOnItemPreview() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.handleDoubleClickOnItemPreview();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}


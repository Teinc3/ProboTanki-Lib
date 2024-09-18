package Renamed1687
{
   import flash.display.DisplayObjectContainer;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4767 implements Renamed1688
   {
      private var object:IGameObject;
      
      private var impl:Renamed1688;
      
      public function Renamed4767(param1:IGameObject, param2:Renamed1688)
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


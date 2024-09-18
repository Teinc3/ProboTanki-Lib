package §0#<§
{
   import flash.display.DisplayObjectContainer;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §!o§ implements §6<§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§6<§>;
      
      public function §!o§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§6<§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function updateActionElements(param1:DisplayObjectContainer) : void
      {
         var i:int = 0;
         var m:§6<§ = null;
         var actionContainer:DisplayObjectContainer = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.updateActionElements(actionContainer);
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function handleDoubleClickOnItemPreview() : void
      {
         var i:int = 0;
         var m:§6<§ = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.handleDoubleClickOnItemPreview();
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


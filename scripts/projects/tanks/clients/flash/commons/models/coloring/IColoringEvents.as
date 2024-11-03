package projects.tanks.clients.flash.commons.models.coloring
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IColoringEvents implements IColoring
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IColoring>;
      
      public function IColoringEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IColoring>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getColoring() : ImageResource
      {
         var result:ImageResource = null;
         var i:int = 0;
         var m:IColoring = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getColoring();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getAnimatedColoring() : MultiframeImageResource
      {
         var result:MultiframeImageResource = null;
         var i:int = 0;
         var m:IColoring = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getAnimatedColoring();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function isAnimated() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IColoring = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isAnimated();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}


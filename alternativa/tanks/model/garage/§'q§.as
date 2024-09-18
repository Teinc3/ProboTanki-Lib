package alternativa.tanks.model.garage
{
   import flash.display.BitmapData;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §'q§ implements §null package override§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§null package override§>;
      
      public function §'q§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§null package override§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function showConfirmAlert(param1:String, param2:int, param3:BitmapData, param4:Boolean, param5:int, param6:int = -1, param7:Boolean = false) : void
      {
         var i:int = 0;
         var m:§null package override§ = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.showConfirmAlert(param1,param2,param3,param4,param5,param6,param7);
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


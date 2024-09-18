package Renamed437
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4792 implements Renamed1711
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed1711>;
      
      public function Renamed4792(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed1711>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function fit() : void
      {
         var i:int = 0;
         var m:Renamed1711 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.fit();
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


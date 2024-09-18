package Renamed437
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4791 implements Renamed1711
   {
      private var object:IGameObject;
      
      private var impl:Renamed1711;
      
      public function Renamed4791(param1:IGameObject, param2:Renamed1711)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function fit() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.fit();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}


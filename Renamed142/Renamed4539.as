package Renamed142
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4539 implements Renamed2741
   {
      private var object:IGameObject;
      
      private var impl:Renamed2741;
      
      public function Renamed4539(param1:IGameObject, param2:Renamed2741)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed2941(param1:int, param2:int, param3:Boolean) : void
      {
         var Renamed3693:int = param1;
         var Renamed4950:int = param2;
         var Renamed4951:Boolean = param3;
         var Renamed4952:int = Renamed3693;
         var Renamed2987:int = Renamed4950;
         var Renamed4953:Boolean = Renamed4951;
         try
         {
            Model.object = this.object;
            this.impl.Renamed2941(Renamed4952,Renamed2987,Renamed4953);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed4954(param1:int, param2:Boolean) : void
      {
         var Renamed3693:int = param1;
         var Renamed4950:Boolean = param2;
         var Renamed2987:int = Renamed3693;
         var Renamed4953:Boolean = Renamed4950;
         try
         {
            Model.object = this.object;
            this.impl.Renamed4954(Renamed2987,Renamed4953);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}


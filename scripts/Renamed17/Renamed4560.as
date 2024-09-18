package Renamed17
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4560 implements Renamed4557
   {
      private var object:IGameObject;
      
      private var impl:Renamed4557;
      
      public function Renamed4560(param1:IGameObject, param2:Renamed4557)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed5393() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.Renamed5393();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5394() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.Renamed5394();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5395(param1:Renamed4556) : void
      {
         var Renamed3693:Renamed4556 = param1;
         var Renamed5431:Renamed4556 = Renamed3693;
         try
         {
            Model.object = this.object;
            this.impl.Renamed5395(Renamed5431);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5396() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.Renamed5396();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}


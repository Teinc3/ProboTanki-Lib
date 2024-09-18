package Renamed224
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4582 implements Renamed4580
   {
      private var object:IGameObject;
      
      private var impl:Renamed4580;
      
      public function Renamed4582(param1:IGameObject, param2:Renamed4580)
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
      
      public function Renamed6326() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.Renamed6326();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed6327() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.Renamed6327();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5395(param1:int) : void
      {
         var Renamed3693:int = param1;
         var Renamed6328:int = Renamed3693;
         try
         {
            Model.object = this.object;
            this.impl.Renamed5395(Renamed6328);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5396(param1:int) : void
      {
         var Renamed3693:int = param1;
         var Renamed6328:int = Renamed3693;
         try
         {
            Model.object = this.object;
            this.impl.Renamed5396(Renamed6328);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}


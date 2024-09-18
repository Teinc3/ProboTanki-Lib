package Renamed375
{
   import Renamed361.Renamed5339;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4681 implements Renamed2767
   {
      private var object:IGameObject;
      
      private var impl:Renamed2767;
      
      public function Renamed4681(param1:IGameObject, param2:Renamed2767)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed2834() : Renamed5339
      {
         var Renamed2142:Renamed5339 = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed2834();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
   }
}

